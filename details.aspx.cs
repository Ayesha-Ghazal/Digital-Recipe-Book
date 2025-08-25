using System;
using System.Data.SqlClient;

namespace sdaproject
{
    public partial class details : System.Web.UI.Page
    {
        conn db = new conn();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!SessionManager.Instance.IsLoggedIn())
            {
                Response.Redirect("Login.aspx");
                return;
            }
            if (!IsPostBack)
            {
                string recipeId = Request.QueryString["id"];

                if (!string.IsNullOrEmpty(recipeId))
                {
                    LoadRecipeDetails(recipeId);
                }
                else
                {
                    // Handle missing ID
                    lblName.InnerText = "Recipe not found.";
                }
            }
        }

        private void LoadRecipeDetails(string id)
        {
            using (SqlConnection con = db.GetConnection())
            {
                con.Open();
                string query = @"SELECT r.RecipeName, r.Ingredients, r.StepsToCook, c.CategoryName
                                 FROM Recipes r
                                 JOIN Category c ON r.CategoryId = c.CategoryId
                                 WHERE r.RecipeId = @id";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@id", id);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    lblName.InnerText = reader["RecipeName"].ToString();
                    lblIngredients.InnerText = reader["Ingredients"].ToString();
                    lblSteps.InnerText = reader["StepsToCook"].ToString();
                    lblCategory.InnerText = reader["CategoryName"].ToString();
                }
                else
                {
                    lblName.InnerText = "Recipe not found.";
                }
            }
        }
    }
}

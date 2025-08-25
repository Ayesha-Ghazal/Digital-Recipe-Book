using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace sdaproject
{
    public partial class My_Recipes : System.Web.UI.Page
    {
        conn db = new conn(); // Use your custom connection class

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUserRecipes();
            }
        }

        private void LoadUserRecipes()
        {
            if (!SessionManager.Instance.IsLoggedIn())
            {
                Response.Redirect("Login.aspx");
                return;
            }

            int userId = SessionManager.Instance.UserId;

            using (SqlConnection con = db.GetConnection())
            {
                string query = @"
    SELECT * 
    FROM UserRecipesView 
    WHERE UserId = @UserId 
    ORDER BY DateCreated DESC";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserId", userId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptRecipes.DataSource = dt;
                rptRecipes.DataBind();
            }
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add_recipe.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string keyword = txtSearch.Text.Trim();
            Response.Redirect("search.aspx?query=" + Server.UrlEncode(keyword));
        }
        protected void Recipe_Command(object sender, CommandEventArgs e)
        {
            int userId = SessionManager.Instance.UserId;

            if (e.CommandName == "DeleteRecipe")
            {
                int recipeId = Convert.ToInt32(e.CommandArgument);

                using (SqlConnection con = db.GetConnection())
                {
                    con.Open();

                    string deleteQuery = "DELETE FROM Recipes WHERE RecipeId = @RecipeId AND UserId = @UserId";
                    SqlCommand deleteCmd = new SqlCommand(deleteQuery, con);
                    deleteCmd.Parameters.AddWithValue("@RecipeId", recipeId);
                    deleteCmd.Parameters.AddWithValue("@UserId", userId);
                    deleteCmd.ExecuteNonQuery();
                }

                LoadUserRecipes();
            }
            else if (e.CommandName == "UpdateRecipe")
            {
                int recipeId = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("update_recipe.aspx?id=" + recipeId);
            }
        }
       

    }
}

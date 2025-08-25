using System;
using System.Data;
using System.Data.SqlClient;

namespace sdaproject
{
    public partial class update_recipe : System.Web.UI.Page
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
                if (string.IsNullOrEmpty(recipeId))
                {
                    lblMessage.Text = "No recipe specified.";
                    return;
                }

                // Load categories into ddlCategory dropdown
                LoadCategories();

                // Load recipe details in labels
                LoadRecipeDetails(recipeId);
            }
        }

        private void LoadCategories()
        {
            using (SqlConnection con = db.GetConnection())
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT CategoryId, CategoryName FROM Category", con);
                SqlDataReader reader = cmd.ExecuteReader();

                ddlCategory.Items.Clear();
                while (reader.Read())
                {
                    ddlCategory.Items.Add(new System.Web.UI.WebControls.ListItem(reader["CategoryName"].ToString(), reader["CategoryId"].ToString()));
                }
            }
        }

        private void LoadRecipeDetails(string id)
        {
            int recipeId;
            if (!int.TryParse(id, out recipeId))
            {
                lblMessage.Text = "Invalid recipe ID.";
                return;
            }

            using (SqlConnection con = db.GetConnection())
            {
                con.Open();
                string query = @"SELECT r.RecipeName, r.Ingredients, r.StepsToCook, c.CategoryName, r.CategoryId
                                 FROM Recipes r
                                 JOIN Category c ON r.CategoryId = c.CategoryId
                                 WHERE r.RecipeId = @id";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@id", recipeId);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    lblName.Text = reader["RecipeName"].ToString();
                    lblIngredients.Text = reader["Ingredients"].ToString();
                    lblSteps.Text = reader["StepsToCook"].ToString();
                    lblCategory.Text = reader["CategoryName"].ToString();

                    // Pre-select category in ddlCategory dropdown
                    string categoryId = reader["CategoryId"].ToString();
                    var item = ddlCategory.Items.FindByValue(categoryId);
                    if (item != null)
                    {
                        ddlCategory.ClearSelection();
                        item.Selected = true;
                    }
                }
                else
                {
                    lblMessage.Text = "Recipe not found.";
                }
            }
        }

        protected void btnUpdateRecipe_Click(object sender, EventArgs e)
        {
            string recipeIdStr = Request.QueryString["id"];
            int recipeId;

            if (!int.TryParse(recipeIdStr, out recipeId))
            {
                ShowAlert("Invalid recipe ID.");
                return;
            }

            string fieldToUpdate = ddlField.SelectedValue;
            string newValue = txtNewValue.Text.Trim();

            if (fieldToUpdate == "CategoryId")
            {
                // Get selected category ID
                newValue = ddlCategory.SelectedValue;
            }
            else if (string.IsNullOrEmpty(newValue))
            {
                ShowAlert("Please enter a new value.");
                return;
            }

            string updateQuery = $"UPDATE Recipes SET {fieldToUpdate} = @newValue WHERE RecipeId = @recipeId";

            using (SqlConnection con = db.GetConnection())
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(updateQuery, con);

                if (fieldToUpdate == "CategoryId")
                {
                    cmd.Parameters.AddWithValue("@newValue", Convert.ToInt32(newValue));
                }
                else
                {
                    cmd.Parameters.AddWithValue("@newValue", newValue);
                }

                cmd.Parameters.AddWithValue("@recipeId", recipeId);

                try
                {
                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        ShowAlert("Recipe updated successfully.");

                        // Reload updated recipe details
                        LoadRecipeDetails(recipeIdStr);

                        // Clear input fields
                        txtNewValue.Text = string.Empty;
                    }
                    else
                    {
                        ShowAlert("Update failed. Recipe not found.");
                    }
                }
                catch (Exception ex)
                {
                    ShowAlert("Error updating recipe: " + ex.Message);
                }
            }
        }
        private void ShowAlert(string message)
        {
            string script = $"alert('{message.Replace("'", "\\'")}');";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("My_Recipes.aspx");
        }
    }
}

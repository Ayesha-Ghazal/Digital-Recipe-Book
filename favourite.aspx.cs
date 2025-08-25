using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace sdaproject
{
    public partial class favourite : System.Web.UI.Page
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
                // If a recipe ID is passed in query string, add it to favourites
                string recipeIdStr = Request.QueryString["id"];
                if (!string.IsNullOrEmpty(recipeIdStr) && int.TryParse(recipeIdStr, out int recipeId))
                {
                    AddToFavourites(recipeId);
                    Response.Redirect("favourite.aspx"); // Avoid duplicate insert on refresh
                }

                LoadFavourites();
            }
        }

        private void AddToFavourites(int recipeId)
        {
            int userId = SessionManager.Instance.UserId;

            using (SqlConnection con = db.GetConnection())
            {
                con.Open();

                SqlCommand checkCmd = new SqlCommand(
                    "SELECT COUNT(*) FROM Favourites WHERE UserId = @UserId AND RecipeId = @RecipeId", con);
                checkCmd.Parameters.AddWithValue("@UserId", userId);
                checkCmd.Parameters.AddWithValue("@RecipeId", recipeId);

                int exists = (int)checkCmd.ExecuteScalar();

                if (exists == 0)
                {
                    SqlCommand insertCmd = new SqlCommand(
                        "INSERT INTO Favourites (UserId, RecipeId) VALUES (@UserId, @RecipeId)", con);
                    insertCmd.Parameters.AddWithValue("@UserId", userId);
                    insertCmd.Parameters.AddWithValue("@RecipeId", recipeId);
                    insertCmd.ExecuteNonQuery();
                }
            }
        }

        private void LoadFavourites()
        {
            using (SqlConnection con = db.GetConnection())
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(@"
                    SELECT * FROM UserFavouriteRecipesView WHERE UserId = @UserId", con);

                cmd.Parameters.AddWithValue("@UserId", SessionManager.Instance.UserId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptFavourites.DataSource = dt;
                rptFavourites.DataBind();
            }
        }

        private void RemoveFavourite(int recipeId)
        {
            int userId = SessionManager.Instance.UserId;

            using (SqlConnection con = db.GetConnection())
            {
                con.Open();

                SqlCommand deleteCmd = new SqlCommand(
                    "DELETE FROM Favourites WHERE UserId = @UserId AND RecipeId = @RecipeId", con);
                deleteCmd.Parameters.AddWithValue("@UserId", userId);
                deleteCmd.Parameters.AddWithValue("@RecipeId", recipeId);
                deleteCmd.ExecuteNonQuery();
            }
        }

        protected void rptFavourites_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                int recipeId = Convert.ToInt32(e.CommandArgument);
                RemoveFavourite(recipeId);
                LoadFavourites();
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string keyword = txtSearch.Text.Trim();
            Response.Redirect("search.aspx?query=" + Server.UrlEncode(keyword));
        }
    }
}

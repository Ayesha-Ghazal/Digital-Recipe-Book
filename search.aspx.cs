using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace sdaproject
{
    public partial class search : Page
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
                string keyword = Request.QueryString["query"];
                if (!string.IsNullOrEmpty(keyword))
                {
                    LoadSearchResults(keyword);
                }
                else
                {
                    // Optionally show message or clear results
                    rptSearchResults.DataSource = null;
                    rptSearchResults.DataBind();
                }
            }
        }

        private void LoadSearchResults(string keyword)
        {
            using (SqlConnection con = db.GetConnection())
            {
                con.Open();

                string query = @"SELECT RecipeId, RecipeName, CategoryName, Username, Skills
        FROM RecipeDetails
        WHERE RecipeName LIKE @keyword OR Ingredients LIKE @keyword";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@keyword", "%" + keyword + "%");

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    rptSearchResults.DataSource = dt;
                    rptSearchResults.DataBind();

                    lblNoResults.Visible = dt.Rows.Count == 0;
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string keyword = txtSearch.Text.Trim();
            Response.Redirect("search.aspx?query=" + Server.UrlEncode(keyword));
        }

    }
}

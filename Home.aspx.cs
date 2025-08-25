using System;
using System.Data;
using System.Data.SqlClient;

namespace sdaproject
{
    public partial class Home : System.Web.UI.Page
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
                LoadCategories();
                LoadRecipes();
            }
        }

        private void LoadCategories()
        {
            using (SqlConnection con = db.GetConnection())
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT CategoryId, CategoryName FROM Category", con);
                SqlDataReader reader = cmd.ExecuteReader();

                ddlCategory.DataSource = reader;
                ddlCategory.DataTextField = "CategoryName";
                ddlCategory.DataValueField = "CategoryId";
                ddlCategory.DataBind();

                ddlCategory.Items.Insert(0, new System.Web.UI.WebControls.ListItem("All Categories", ""));
            }
        }

        private void LoadRecipes()
        {
            using (SqlConnection con = db.GetConnection())
            {
                string sql = @"SELECT RecipeId, RecipeName, CategoryName, Username, Skills, CategoryId 
                       FROM RecipeDetails";

                if (!string.IsNullOrEmpty(ddlCategory.SelectedValue))
                    sql += " WHERE CategoryId = @CategoryId";

                SqlCommand cmd = new SqlCommand(sql, con);

                if (!string.IsNullOrEmpty(ddlCategory.SelectedValue))
                    cmd.Parameters.AddWithValue("@CategoryId", ddlCategory.SelectedValue);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptSearchResults.DataSource = dt;
                rptSearchResults.DataBind();
            }
        }


        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadRecipes();
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string keyword = txtSearch.Text.Trim();
            Response.Redirect("search.aspx?query=" + Server.UrlEncode(keyword));
        }
    }
}

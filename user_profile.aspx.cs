using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace sdaproject
{
    public partial class user_profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (SessionManager.Instance.IsLoggedIn())
                {
                    UpdateSkillLevel(SessionManager.Instance.UserId);
                    LoadUserProfile(SessionManager.Instance.Username);
                    LoadUpdateHistory();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }
        private void LoadUserProfile(string username)
        {
            conn c = new conn(); // your custom connection class
            SqlConnection con = c.GetConnection();

            string query = @"SELECT * FROM UserProfileView WHERE username = @username"; ;

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@username", username);

            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    Username.Text = reader["username"].ToString();
                    fullname.Text = reader["fullname"].ToString();
                    skill.Text = reader["skills"].ToString();
                    pointsLabel.Text = reader["Points"].ToString();

                    bronze.Text = reader["Bronze"].ToString();
                    silver.Text = reader["Silver"].ToString();
                    gold.Text = reader["Gold"].ToString();
                }
                else
                {
                    Username.Text = "User not found.";
                }

                reader.Close();
                con.Close();
            }
            catch (Exception ex)
            {
                Username.Text = "Error loading profile.";
               
            }
       
    
        }
        public void UpdateSkillLevel(int userId)
        {
            conn c = new conn();
            using (SqlConnection con = c.GetConnection())
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("UpdateUserSkillLevel", con))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserId", userId);

                    cmd.ExecuteNonQuery();
                }
            }
        }
        private void LoadUpdateHistory()
        {
            conn c = new conn();
            SqlConnection con = c.GetConnection();

            string query = @"
        SELECT UpdatedColumn, OldValue, NewValue, UpdatedAt
        FROM UserUpdateLog
        WHERE UserId = @UserId
        ORDER BY UpdatedAt DESC";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@UserId", SessionManager.Instance.UserId);

            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                gvUpdateHistory.DataSource = reader;
                gvUpdateHistory.DataBind();
                reader.Close();
            }
            catch (Exception ex)
            {
                lblHistory.Text = "Error loading update history.";
            }
            finally
            {
                con.Close();
            }
        }

    }
}

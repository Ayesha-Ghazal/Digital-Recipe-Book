using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sdaproject
{
    public partial class edit_profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (SessionManager.Instance.IsLoggedIn())
                {
                    LoadUserProfile(SessionManager.Instance.Username);
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }
        private void LoadUserProfile(string username)
        {
            conn c = new conn(); // Your custom connection class
            SqlConnection con = c.GetConnection();

            string query = @"SELECT username, fullname, email, password FROM Users WHERE username = @username";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@username", username);

            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    lblUsername.Text = reader["username"].ToString();
                    lblFullName.Text = reader["fullname"].ToString();
                    lblEmail.Text = reader["email"].ToString();
                    lblPassword.Text = "********"; // Do not display real password
                }
                reader.Close();
            }
            catch (Exception ex)
            {
                lblUsername.Text = "Error loading profile.";
            }
            finally
            {
                con.Close();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string field = ddlField.SelectedValue;
            string newValue = txtNewValue.Text.Trim();

            if (string.IsNullOrEmpty(newValue))
            {
                // Optionally show a message
                return;
            }

            // Validate input field
            string columnToUpdate = "";
            switch (field)
            {
                case "Username":
                    columnToUpdate = "username";
                    break;
                case "FullName":
                    columnToUpdate = "fullname";
                    break;
                case "Email":
                    columnToUpdate = "email";
                    break;
                case "Password":
                    columnToUpdate = "password";
                    break;
            }

            if (string.IsNullOrEmpty(columnToUpdate)) return;

            conn c = new conn();
            SqlConnection con = c.GetConnection();

            SqlCommand cmd = new SqlCommand("UpdateUserProfile", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@CurrentUsername", SessionManager.Instance.Username);
            cmd.Parameters.AddWithValue("@ColumnName", columnToUpdate);
            cmd.Parameters.AddWithValue("@NewValue", newValue);

            try
            {
                con.Open();
                int rowsAffected = cmd.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    var subject = new UserProfileSubject();

                    subject.Attach(new EmailNotifierObserver(lblMessage));

                    string message = $"User '{SessionManager.Instance.Username}' updated '{columnToUpdate}' to '{newValue}'";
                    subject.Notify(message);

                    if (columnToUpdate == "username")
                    {
                        SessionManager.Instance.UpdateUsername(newValue);
                    }

                    LoadUserProfile(SessionManager.Instance.Username);
                }

            }
            catch (Exception ex)
            {
                // Log or show error
            }
            finally
            {
                con.Close();
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("user_profile.aspx");
        }
    }
}
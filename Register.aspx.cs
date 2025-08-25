using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace sdaproject
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string fullname = fullnametxt.Text;
            string username = usernametxt.Text;
            string email = emailtxt.Text;
            string password = passwordtxt.Text;
            string confirmPassword = cpasstxt.Text;

            if (password != confirmPassword)
            {
                Response.Write("<script>alert('Passwords do not match!');</script>");
                return;
            }

            conn db = new conn();
            SqlConnection con = db.GetConnection();

            string checkUserQuery = "SELECT COUNT(*) FROM Users WHERE Username = @Username";
            SqlCommand checkCmd = new SqlCommand(checkUserQuery, con);
            checkCmd.Parameters.AddWithValue("@Username", username);

            try
            {
                con.Open();
                int userExists = (int)checkCmd.ExecuteScalar();
                if (userExists > 0)
                {
                    Response.Write("<script>alert('Username already exists. Please choose another.');</script>");
                    return;
                }

                string query = "INSERT INTO Users (FullName, Username, Password, Email, Skills)"+
                                 "OUTPUT INSERTED.Id " +" VALUES (@FullName, @Username, @Password, @Email, @Skills)";
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@FullName", fullname);
            cmd.Parameters.AddWithValue("@Username", username);
            cmd.Parameters.AddWithValue("@Password", password);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Skills", "Newbie");
                int newUserId = (int)cmd.ExecuteScalar();

                // Insert into Badges table
                string badgeInsertQuery = "INSERT INTO Badges (BadgeId, UserId, Bronze, Silver, Gold) " +
                                          "VALUES (@BadgeId, @UserId, 0, 0, 0)";
                SqlCommand badgeCmd = new SqlCommand(badgeInsertQuery, con);
                badgeCmd.Parameters.AddWithValue("@BadgeId", newUserId); // or use a separate auto-generated BadgeId if needed
                badgeCmd.Parameters.AddWithValue("@UserId", newUserId);

                badgeCmd.ExecuteNonQuery();


                Response.Write("<script>alert('Registration successful');</script>");
                Response.Redirect("Login.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
            finally
            {
                con.Close();
            }
        }

        protected void Cancelbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm1.aspx");
        }
    }
}
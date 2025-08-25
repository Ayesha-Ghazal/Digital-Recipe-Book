using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sdaproject
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SessionManager.Instance.EndSession();  // clear your singleton session
            Session.Clear();                       // clear actual ASP.NET session
            Session.Abandon();                     // terminate session
            Response.Redirect("Login.aspx");
        }
    }
}
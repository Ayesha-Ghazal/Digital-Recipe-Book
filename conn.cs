using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace sdaproject
{
    public class conn
    {
        private static string connectionString = "Data Source=DESKTOP-LS1M4HB\\SQLEXPRESS;Initial Catalog=sdaproj;Integrated Security=True;";
        public SqlConnection GetConnection()
        {
            SqlConnection con = new SqlConnection(connectionString);
            return con;
        }
    }
}
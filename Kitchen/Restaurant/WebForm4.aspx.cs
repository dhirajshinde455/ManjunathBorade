using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Restaurant
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = "Data Source=SUKHADA\\SQLEXPRESS2;Initial Catalog=Kitchen;Integrated Security=True";
            SqlConnection con = null;

            string command = string.Format("select * from Cart",con);

            con = new SqlConnection(cs);

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = command;
            cmd.Connection = con;

            con.Open();

            SqlDataReader reader = cmd.ExecuteReader();

            GridView1.DataSource = reader;
            GridView1.DataBind();


        }
    }
}
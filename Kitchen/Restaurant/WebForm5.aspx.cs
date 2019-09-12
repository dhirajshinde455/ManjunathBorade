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
    public partial class WebForm5 : System.Web.UI.Page
    {
        string cs = "Data Source=SUKHADA\\SQLEXPRESS2;Initial Catalog=Kitchen;Integrated Security=True";
        SqlConnection con = null;

        protected void Page_Load(object sender, EventArgs e)
        {

            con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("select * from Food", con);

            con.Open();

            SqlDataReader reader = cmd.ExecuteReader();

            Gridview1.DataSource = reader;
            Gridview1.DataBind();

            con.Close();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("usp_AddFood", con);
            cmd.CommandType = CommandType.StoredProcedure;

            var MenuName = TextBox2.Text;
            cmd.Parameters.AddWithValue("@MenuName", MenuName);

            var Description = TextBox3.Text;
            cmd.Parameters.AddWithValue("@Description", Description);

            var Ingredients = TextBox4.Text;
            cmd.Parameters.AddWithValue("@Ingredients", Ingredients);

            var Category = TextBox5.Text;
            cmd.Parameters.AddWithValue("@Category", Category);

            var Price = int.Parse(TextBox6.Text);
            cmd.Parameters.AddWithValue("@Price",Price);

            con.Open();

            SqlDataReader reader = cmd.ExecuteReader();

            GridView2.DataSource = reader;
            GridView2.DataBind();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("usp_DeleteFood", con);
            cmd.CommandType = CommandType.StoredProcedure;

            var Id = TextBox1.Text;
            cmd.Parameters.AddWithValue("@Id", Id);

            con.Open();

            SqlDataReader reader = cmd.ExecuteReader();

            GridView2.DataSource = reader;
            GridView2.DataBind();
         

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "usp_UpdateFood";
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;

            var Id = TextBox1.Text;
            cmd.Parameters.AddWithValue("@Id", Id);

            var MenuName = TextBox2.Text;
            cmd.Parameters.AddWithValue("@MenuName", MenuName);

            var Description = TextBox3.Text;
            cmd.Parameters.AddWithValue("@Description", Description);

            var Ingredients = TextBox4.Text;
            cmd.Parameters.AddWithValue("@Ingredients", Ingredients);

            var Category = TextBox5.Text;
            cmd.Parameters.AddWithValue("@Category", Category);

            var Price = int.Parse(TextBox6.Text);
            cmd.Parameters.AddWithValue("@Price", Price);

            con.Open();

            SqlDataReader reader = cmd.ExecuteReader();

            GridView2.DataSource = reader;
            GridView2.DataBind();

        }
    }
}
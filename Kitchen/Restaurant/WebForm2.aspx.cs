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
    public partial class WebForm2 : System.Web.UI.Page
    {
        string cs = "Data Source=SUKHADA\\SQLEXPRESS2;Initial Catalog=Kitchen;Integrated Security=True";
        SqlConnection con = null;


        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "USP_FOOD";
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;

            con.Open();

            SqlDataReader reader = cmd.ExecuteReader();

            GridView1.DataSource = reader;
            GridView1.DataBind();

            con.Close();

            SqlConnection con2 = new SqlConnection(cs);

            con.Open();
            SqlDataAdapter adpt = new SqlDataAdapter("Select id, MenuName from Food", con);

            DataSet myDataSet = new DataSet();

            adpt.Fill(myDataSet, "Food");

            DataTable myDataTable = myDataSet.Tables[0];

            DataRow tempRow = null;



            foreach (DataRow tempRow_Variable in myDataTable.Rows)
            {

                tempRow = tempRow_Variable;

                ListBox1.Items.Add((tempRow["MenuName"].ToString()));

            }

            if (!IsPostBack)
            {
                string cs1 = "Data Source=SUKHADA\\SQLEXPRESS2;Initial Catalog=Kitchen;Integrated Security=True";
                con = new SqlConnection(cs1);

                SqlCommand cmd1 = new SqlCommand("delete from Cart", con);

                cmd1.Connection = con;

                con.Open();

                SqlDataReader reader1 = cmd1.ExecuteReader();
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String FoodItem = ListBox1.SelectedItem.ToString();
            int Quantity = Convert.ToInt32(DropDownList1.SelectedItem.ToString());
            int TotalPrice = 0;
            con = new SqlConnection(cs);

            SqlDataAdapter adpt = new SqlDataAdapter("Select MenuName, Price from Food", con);


            DataSet myDataSet = new DataSet();

            adpt.Fill(myDataSet, "Food");

            DataTable myDataTable = myDataSet.Tables[0];
            //DataRow tempRowMenu = null;
            //DataRow tempRowPrice = null;
            DataRow tempRow = null;

            foreach (DataRow tempRow_Variable in myDataTable.Rows)
            {
                tempRow = tempRow_Variable;

                if (FoodItem == tempRow["MenuName"].ToString())
                {

                    TotalPrice = Convert.ToInt32(tempRow["Price"]) * Quantity;
                }

            }
            
            string command = string.Format("insert into Cart values('{0}',{1},{2});select * from Cart", FoodItem, Quantity, TotalPrice);

            con = new SqlConnection(cs);

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = command;
            cmd.Connection = con;

            con.Open();

            SqlDataReader reader = cmd.ExecuteReader();

            GridView2.DataSource = reader;
            GridView2.DataBind();

        }

    }
}

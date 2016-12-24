using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace lkhassignment
{
    public partial class ReservationReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {

            if (DropDownList1.SelectedItem.Text == "Monthly Sales Report")
            {

                Label3.Text = DropDownList2.SelectedItem.ToString() + " Sales Report in " + RadioButtonList1.SelectedValue;
                /*Step 1: Create and Open Connection*/
                SqlConnection con;
                string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con = new SqlConnection(connStr);
                con.Open();

                string strSelect;
                SqlCommand cmdSelect;

                strSelect = "SELECT CONVERT (VARCHAR, DATE, 103) AS DATE, FORMAT(SUM(AMOUNT), 'N2') AS TOTAL FROM RESERVATION WHERE MONTH(DATE) = @MON AND YEAR(DATE) = @YEAR GROUP BY DATE";
                cmdSelect = new SqlCommand(strSelect, con);
                cmdSelect.Parameters.AddWithValue("@MON", DropDownList2.SelectedValue);
                cmdSelect.Parameters.AddWithValue("@YEAR", RadioButtonList1.SelectedValue);
                SqlDataReader dtr;
                dtr = cmdSelect.ExecuteReader();

                GridView1.DataSource = dtr;
                GridView1.DataBind();

            }
            else
            {
                Label3.Text = DropDownList2.SelectedItem.ToString() + " Exception Report in " + RadioButtonList1.SelectedValue;
                SqlConnection con;
                string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con = new SqlConnection(connStr);
                con.Open();

                string strSelect;
                SqlCommand cmdSelect;
                string cancel = "Cancel";

                strSelect = "SELECT CONVERT (VARCHAR, DATE, 103) AS DATE, COUNT(STATUS) AS CANCELLATION FROM RESERVATION WHERE MONTH(DATE) = @MON AND STATUS = @CANCEL GROUP BY DATE";
                cmdSelect = new SqlCommand(strSelect, con);
                cmdSelect.Parameters.AddWithValue("@MON", DropDownList2.SelectedValue);
                cmdSelect.Parameters.AddWithValue("@CANCEL", cancel);
                SqlDataReader dtr;
                dtr = cmdSelect.ExecuteReader();

                GridView1.DataSource = dtr;
                GridView1.DataBind();
            }



        }
    }
}
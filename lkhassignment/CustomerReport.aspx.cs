using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace lkhassignment
{
    public partial class CustomerReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            if (ddlType.SelectedValue == "Customer Yearly Summary Report")
            {
                /*Step 1: Create and Open Connection*/
                SqlConnection connTaxi;
                string connStr = ConfigurationManager.ConnectionStrings["TaxiConn"].ConnectionString;
                connTaxi = new SqlConnection(connStr);
                connTaxi.Open();

                /*Step2 : SQL Command object to retrieve data from Books table*/
                string strSelect;
                SqlCommand cmdSelect;

                strSelect = "SELECT COUNT(cust_id) AS Number_Of_Customer_Sign_Up, CONVERT (VARCHAR,  cust_join_date, 106) AS DATE from customer WHERE YEAR(cust_join_date) = @YEAR GROUP BY cust_join_date order by (CONVERT (VARCHAR,  cust_join_date, 106)) ASC ;";
                cmdSelect = new SqlCommand(strSelect, connTaxi);
                cmdSelect.Parameters.AddWithValue("@YEAR", ddlYear.SelectedValue);

                /*Step 3: Execute command to retrieve data*/
                SqlDataReader dtr;
                dtr = cmdSelect.ExecuteReader();

                GridView2.DataSource = dtr;
                GridView2.DataBind();
                   
                /*Step 5: Close SqlReader and Database connection*/
                //connTaxi.Close();
                //dtr.Close();
                lblTitle.Text = "Customer Sign Up Yearly Summary Report";
                lblYearOrMonth.Text = "" + ddlYear.SelectedValue;

            }
            else if (ddlType.SelectedValue == "Customer Monthly Summary Report")
            {
                /*Step 1: Create and Open Connection*/
                SqlConnection connTaxi;
                string connStr = ConfigurationManager.ConnectionStrings["TaxiConn"].ConnectionString;
                connTaxi = new SqlConnection(connStr);
                connTaxi.Open();

                /*Step2 : SQL Command object to retrieve data from Books table*/
                string strSelect;
                SqlCommand cmdSelect;

                strSelect = "SELECT COUNT(cust_id) AS Number_Of_Customer_Sign_Up, CONVERT (VARCHAR,  cust_join_date, 106) AS DATE from customer WHERE MONTH(cust_join_date) = @MONTH GROUP BY cust_join_date order by (CONVERT (VARCHAR,  cust_join_date, 106)) ASC ;";
                cmdSelect = new SqlCommand(strSelect, connTaxi);
                cmdSelect.Parameters.AddWithValue("@MONTH", ddlMonth.SelectedValue);

                /*Step 3: Execute command to retrieve data*/
                SqlDataReader dtr;
                dtr = cmdSelect.ExecuteReader();

                GridView2.DataSource = dtr;
                GridView2.DataBind();

                lblTitle.Text = "Customer Sign Up Monthly Summary Report";
                lblYearOrMonth.Text = "Month" + ddlMonth.SelectedValue;
            }

            
        }

        protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlType.SelectedValue == "Customer Yearly Summary Report")
            {
                lblLabelYear.Visible = true;
                ddlYear.Visible = true;
                lblLabelMonth.Visible = false;
                ddlMonth.Visible = false;
            }
            else if (ddlType.SelectedValue == "Customer Monthly Summary Report")
            {
                lblLabelMonth.Visible = true;
                ddlMonth.Visible = true;
                lblLabelYear.Visible = false;
                ddlYear.Visible = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("DriverMenu.aspx");
        }
    }
}
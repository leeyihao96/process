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
    public partial class UpdateDriver : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRetrieve_Click(object sender, EventArgs e)
        {
            
            {
                /*Initilize label value to empty*/
                lblDisplay.Text = "";

                /*Step 1: Create and Open Connection*/
                SqlConnection connTaxi;
                string connStr = ConfigurationManager.ConnectionStrings["TaxiConn"].ConnectionString;
                connTaxi = new SqlConnection(connStr);
                connTaxi.Open();

                /*Step2 : SQL Command object to retrieve data from Books table*/
                string strSelect;
                SqlCommand cmdSelect;

                String username = "'" + ddlUsername.SelectedItem + "'";

                strSelect = "Select driver_full_name, driver_tel_no, driver_email, driver_address, driver_taxi_company, driver_taxi_plate_no From dbo.driver Where driver_username = " + username + ";";
                cmdSelect = new SqlCommand(strSelect, connTaxi);

                /*Step 3: Execute command to retrieve data*/
                SqlDataReader dtr;
                dtr = cmdSelect.ExecuteReader();

                /*Step 4: Display result set from the query*/
                if (dtr.HasRows)
                {
                    while (dtr.Read())
                    {
                        txtFullName.Text = dtr["driver_full_name"].ToString();
                        txtTelNo.Text = dtr["driver_tel_no"].ToString();
                        txtEmail.Text = dtr["driver_email"].ToString();
                        txtAddress.Text = dtr["driver_address"].ToString();
                        txtTaxiCompany.Text = dtr["driver_taxi_company"].ToString();
                        txtPlateNo.Text = dtr["driver_taxi_plate_no"].ToString();

                        lblDisplay.Text = "Retrieved Successfully";
                    }




                }
                else
                {
                    txtFullName.Text = "";
                    txtTelNo.Text = "";
                    txtEmail.Text = "";
                    txtAddress.Text = "";
                    txtTaxiCompany.Text = "";
                    txtExpiry.Text = "";
                    txtPlateNo.Text = "";
                    lblDisplay.Text = "There is no such record.";

                }

                /*Step 5: Close SqlReader and Database connection*/
                connTaxi.Close();
                dtr.Close();
            }
        }

        protected void txtExpiry_TextChanged(object sender, EventArgs e)
        {
            DateTime SelectedDate = DateTime.Parse(Request.Form[txtExpiry.UniqueID]);
            DateTime TodayDate = DateTime.Today.Date;
            int result = DateTime.Compare(SelectedDate, TodayDate);
            if (result == 1)
            {
                lblExpiry.Text = "Valid date.";
            }
            else if (result == 0)
            {
                lblExpiry.Text = "Expired tomorrow!Please renew ur license";
            }
            else if(result ==-1)
                lblExpiry.Text = "Expired already!Please choose a new date";
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (lblExpiry.Text == "Valid date.")
            {
            /*Initilize label value to empty*/
            lblDisplay.Text = "";

            /*Step 1: Create and Open Connection*/
            SqlConnection connTaxi;
            string connStr = ConfigurationManager.ConnectionStrings["TaxiConn"].ConnectionString;
            connTaxi = new SqlConnection(connStr);
            connTaxi.Open();

            /*Step 2: Create Sql Insert statement and Sql Insert Object*/


            string strUpdate;
            SqlCommand cmdUpdate;
            strUpdate = "Update driver Set driver_full_name = @driver_full_name, driver_tel_no = @driver_tel_no, driver_email = @driver_email, driver_address = @driver_address, driver_taxi_company = @driver_taxi_company, driver_taxi_plate_no =@driver_taxi_plate_no, driver_license_expiry_date = @driver_license_expiry_date Where driver_username = @driver_username";

            cmdUpdate = new SqlCommand(strUpdate, connTaxi);

            cmdUpdate.Parameters.AddWithValue("@driver_full_name", txtFullName.Text);
            cmdUpdate.Parameters.AddWithValue("@driver_tel_no", txtTelNo.Text);
            cmdUpdate.Parameters.AddWithValue("@driver_email", txtEmail.Text);
            cmdUpdate.Parameters.AddWithValue("@driver_address", txtAddress.Text);
            cmdUpdate.Parameters.AddWithValue("@driver_taxi_company", txtTaxiCompany.Text);
            cmdUpdate.Parameters.AddWithValue("@driver_taxi_plate_no", txtPlateNo.Text.ToUpper());
            cmdUpdate.Parameters.AddWithValue("@driver_license_expiry_date", txtExpiry.Text);
            cmdUpdate.Parameters.AddWithValue("@driver_username", ddlUsername.SelectedValue);

            /*Step 3: Execute command to insert*/
            int n = cmdUpdate.ExecuteNonQuery();

            /*Display insert status*/
            if (n > 0)
                lblDisplay.Text = "driver details updated!";
            else
                lblDisplay.Text = "Sorry, update failed.";

            /*Step 4: Close database connection*/
            connTaxi.Close();
        }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("DriverMenu.aspx");
        }
    }
}
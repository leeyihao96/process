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
    public partial class UpdateCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
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
            strUpdate = "Update customer Set cust_full_name = @cust_full_name, cust_tel_no = @cust_tel_no, cust_email = @cust_email, cust_address = @cust_address Where cust_username = @cust_username";

            cmdUpdate = new SqlCommand(strUpdate, connTaxi);

            cmdUpdate.Parameters.AddWithValue("@cust_full_name", txtFullName.Text);
            cmdUpdate.Parameters.AddWithValue("@cust_tel_no", txtTelNo.Text);
            cmdUpdate.Parameters.AddWithValue("@cust_email", txtEmail.Text);
            cmdUpdate.Parameters.AddWithValue("@cust_address", txtAddress.Text);
            cmdUpdate.Parameters.AddWithValue("@cust_username", txtUsername.Text);

            /*Step 3: Execute command to insert*/
            int n = cmdUpdate.ExecuteNonQuery();

            /*Display insert status*/
            if (n > 0)
                lblDisplay.Text = "Customer details updated!";
            else
                lblDisplay.Text = "Sorry, update failed.";

            /*Step 4: Close database connection*/
            connTaxi.Close();
        }

        protected void btnRetrieve_Click(object sender, EventArgs e)
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

            String username = "'" + txtUsername.Text + "'";

            strSelect = "Select cust_full_name, cust_tel_no, cust_email, cust_address From dbo.customer Where cust_username = " + username + ";";
            cmdSelect = new SqlCommand(strSelect, connTaxi);

            /*Step 3: Execute command to retrieve data*/
            SqlDataReader dtr;
            dtr = cmdSelect.ExecuteReader();

            /*Step 4: Display result set from the query*/
            if (dtr.HasRows)
            {
                while (dtr.Read())
                {
                    txtFullName.Text = dtr["cust_full_name"].ToString();
                    txtTelNo.Text = dtr["cust_tel_no"].ToString();
                    txtEmail.Text = dtr["cust_email"].ToString();
                    txtAddress.Text = dtr["cust_address"].ToString();

                    lblDisplay.Text = "Retrieved Successfully";
                }




            }
            else
            {
                txtFullName.Text = "";
                txtTelNo.Text = "";
                txtEmail.Text = "";
                txtAddress.Text = "";
                lblDisplay.Text = "There is no such record.";

            }

            /*Step 5: Close SqlReader and Database connection*/
            connTaxi.Close();
            dtr.Close();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerMenu.aspx");
        }
    }
}
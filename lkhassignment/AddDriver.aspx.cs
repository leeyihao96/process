using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Text;
using System.Data;
using System.Security.Cryptography;

namespace lkhassignment
{
    public partial class AddDriver : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private string Encrypt(string clearText)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }


        //protected void CalendarDOB_DayRender(object sender, DayRenderEventArgs e)
        //{
        //    if (e.Day.Date > DateTime.Today)
        //    {

        //        e.Day.IsSelectable = false;
        //    }
        //}

        //protected void CalendarLicense_DayRender(object sender, DayRenderEventArgs e)
        //{
        //    if (e.Day.Date < DateTime.Today)
        //    {

        //        e.Day.IsSelectable = false;
        //    }
        //}

        protected void btnAddDriver_Click(object sender, EventArgs e)
        {
            if (lblDOB.Text == "Valid date." && lblExpiry.Text == "Valid date.")
            {
                try
                {

               
            /*Step 1: Create and Open Connection*/
            SqlConnection connTaxi;
            string connStr = ConfigurationManager.ConnectionStrings["TaxiConn"].ConnectionString;
            connTaxi = new SqlConnection(connStr);
            connTaxi.Open();


            //get driver id
            string strCount;
            SqlCommand cmdCount;



            strCount = "Select count(*) From driver";
            cmdCount = new SqlCommand(strCount, connTaxi);
            int count = (int)cmdCount.ExecuteScalar();
            object getCount = cmdCount.ExecuteScalar();
            if (getCount != null)
            {


                if (count < 10)
                {
                    String driverID = "D00" + getCount.ToString();
                    lblDriverId.Text = driverID;
                }

                else
                {
                    String driverID = "D0" + getCount.ToString();
                    lblDriverId.Text = driverID;
                }
            }
            else
                Response.Write("no driver record.");

            

            


            /*Step 2: Create Sql Insert statement and Sql Insert Object*/
            string strInsert;
            SqlCommand cmdInsert;
            strInsert = "Insert Into driver (driver_id, driver_username, driver_password, driver_full_name, driver_ic_no, driver_tel_no, driver_email, driver_address, driver_hire_date, driver_dob, driver_role, driver_taxi_company, driver_license_expiry_date, driver_taxi_plate_no) Values (@driver_id, @driver_username, @driver_password, @driver_full_name, @driver_ic_no, @driver_tel_no, @driver_email, @driver_address, @driver_hire_date, @driver_dob, @driver_role, @driver_taxi_company, @driver_license_expiry_date, @driver_taxi_plate_no)";
            lblDriverRole.Text = "Driver";
            cmdInsert = new SqlCommand(strInsert, connTaxi);

            cmdInsert.Parameters.AddWithValue("@driver_id", lblDriverId.Text);
            cmdInsert.Parameters.AddWithValue("@driver_username", txtUsername.Text);
            cmdInsert.Parameters.AddWithValue("@driver_password", Encrypt(txtPassword.Text.Trim()));
            cmdInsert.Parameters.AddWithValue("@driver_full_name", txtFullName.Text);
            cmdInsert.Parameters.AddWithValue("@driver_ic_no", txtICNo.Text);
            cmdInsert.Parameters.AddWithValue("@driver_tel_no", txtTelNo.Text);
            cmdInsert.Parameters.AddWithValue("@driver_email", txtEmail.Text);
            cmdInsert.Parameters.AddWithValue("@driver_address", txtAddress.Text);
            cmdInsert.Parameters.AddWithValue("@driver_hire_date", DateTime.Today.Date);
            cmdInsert.Parameters.AddWithValue("@driver_dob", txtDOB.Text);
            cmdInsert.Parameters.AddWithValue("@driver_role", lblDriverRole.Text);
            cmdInsert.Parameters.AddWithValue("@driver_taxi_company", txtTaxiCompany.Text);
            cmdInsert.Parameters.AddWithValue("@driver_license_expiry_date", txtExpiry.Text);
            cmdInsert.Parameters.AddWithValue("@driver_taxi_plate_no", txtTaxiPlateNumber.Text.ToUpper());

            /*Step 3: Execute command to insert*/
            int n = cmdInsert.ExecuteNonQuery();

            /*Display insert status*/
            if (n > 0)
                lblInsertStatus.Text = "Add driver successfully!";
            else
                lblInsertStatus.Text = "Sorry, insertion failed.";

            /*Step 4: Close database connection*/
            connTaxi.Close();
                }
                catch (SqlException ex)
                {
                    Response.Write("The username or ic number or taxi plate number have been used. Please enter a new username or ic number or taxi plate number.");
                    lblInsertStatus.Text = "";
                }
        }

        }

        protected void txtDOB_TextChanged(object sender, EventArgs e)
        {
            DateTime SelectedDate = DateTime.Parse(Request.Form[txtDOB.UniqueID]);
            DateTime TodayDate = DateTime.Today.Date;
            int result = DateTime.Compare(SelectedDate, TodayDate);
            if (result == 1)
            {
                lblDOB.Text = "Invalid date.";
            }
            else if (result == 0)
            {
                lblDOB.Text = "Invalid date.";
            }
            else if (result == -1)
                lblDOB.Text = "Valid date.";
        }

        protected void txtExpiry_TextChanged(object sender, EventArgs e)
        {
            DateTime SelectedDate = DateTime.Parse(Request.Form[txtExpiry.UniqueID]);
            DateTime TodayDate = DateTime.Today.Date;
            int result = DateTime.Compare(SelectedDate, TodayDate);
            if (result == -1)
            {
                lblExpiry.Text = "Invalid date.";
            }
            else if (result == 0)
            {
                lblExpiry.Text = "Invalid date.";
            }
            else if(result == 1)
                lblExpiry.Text = "Valid date.";
        
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("DriverMenu.aspx");
        }
    }
    
}
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
    public partial class registration : System.Web.UI.Page
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

        

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if(lblDOB.Text == "Valid date."){
                try
                {
                    /*Step 1: Create and Open Connection*/
                    SqlConnection connTaxi;
                    string connStr = ConfigurationManager.ConnectionStrings["TaxiConn"].ConnectionString;
                    connTaxi = new SqlConnection(connStr);
                    connTaxi.Open();


                    //get cust id
                    string strCount;
                    SqlCommand cmdCount;



                    strCount = "Select count(*) From customer";
                    cmdCount = new SqlCommand(strCount, connTaxi);
                    int count = (int)cmdCount.ExecuteScalar();
                    object getCount = cmdCount.ExecuteScalar();
                    if (getCount != null)
                    {




                        if (count < 10)
                        {
                            String custID = "C00" + getCount.ToString();
                            lblCustId.Text = custID;
                        }

                        else
                        {
                            String custID = "C0" + getCount.ToString();
                            lblCustId.Text = custID;
                        }


                    }
                    else
                        Response.Write("no customer record.");




                    /*Step 2: Create Sql Insert statement and Sql Insert Object*/
                    string strInsert;
                    SqlCommand cmdInsert;
                    strInsert = "Insert Into customer (cust_id, cust_username, cust_password, cust_full_name, cust_tel_no, cust_email, cust_address, cust_join_date, cust_dob) Values (@cust_id, @cust_username, @cust_password, @cust_full_name, @cust_tel_no, @cust_email, @cust_address, @cust_join_date, @cust_dob)";

                    cmdInsert = new SqlCommand(strInsert, connTaxi);

                    cmdInsert.Parameters.AddWithValue("@cust_id", lblCustId.Text);
                    cmdInsert.Parameters.AddWithValue("@cust_username", txtUsername.Text);
                    cmdInsert.Parameters.AddWithValue("@cust_password", Encrypt(txtPassword.Text.Trim()));
                    cmdInsert.Parameters.AddWithValue("@cust_full_name", txtFullName.Text);
                    cmdInsert.Parameters.AddWithValue("@cust_tel_no", txtTelNo.Text);
                    cmdInsert.Parameters.AddWithValue("@cust_email", txtEmail.Text);
                    cmdInsert.Parameters.AddWithValue("@cust_address", txtAddress.Text);
                    cmdInsert.Parameters.AddWithValue("@cust_join_date", DateTime.Today.Date);
                    cmdInsert.Parameters.AddWithValue("@cust_dob", txtDOB.Text);

                    /*Step 3: Execute command to insert*/
                    int n = cmdInsert.ExecuteNonQuery();

                    /*Display insert status*/
                    if (n > 0)
                        lblInsertStatus.Text = "Sign up successfully!";
                    else
                        lblInsertStatus.Text = "Sorry, insertion failed.";

                    /*Step 4: Close database connection*/
                    connTaxi.Close();
                }
                catch(SqlException ex)
                {
                    Response.Write("The username has been used. Please enter a new username.");
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
                lblDOB.Text = "You cannot select date that born on after today.";
            }
            else if (result == 0)
            {
                lblDOB.Text = "You cannot select date that born on today.";
            }
            else if (result == -1)
                lblDOB.Text = "Valid date.";
        }

    }
}
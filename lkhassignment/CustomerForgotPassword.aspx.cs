using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Net;
using System.IO;
using System.Text;
using System.Data;
using System.Security.Cryptography;

namespace lkhassignment
{
    public partial class forgotpassword : System.Web.UI.Page
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

        protected void Button1_Click(object sender, EventArgs e)
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
            String email = "'" + txtEmail.Text + "'";

            strSelect = "Select cust_username, cust_email From customer Where cust_username = " + username + " AND cust_email = " + email + ";";
            cmdSelect = new SqlCommand(strSelect, connTaxi);

            /*Step 3: Execute command to retrieve data*/
            SqlDataReader dtr;
            dtr = cmdSelect.ExecuteReader();

            /*Step 4: Display result set from the query*/
            if (dtr.HasRows)
            {
                while (dtr.Read())
                {
                    if (dtr["cust_username"].ToString().Equals(txtUsername.Text) && dtr["cust_email"].ToString().Equals(txtEmail.Text))
                    {
                        lblDisplay.Text = "username matches email :).Please click next button.";
                        btnNext.Visible = true;
                    }
                    
                }

            }
            else
                lblDisplay.Text = "Login fail, incorrect username or password.";

            /*Step 5: Close SqlReader and Database connection*/
            connTaxi.Close();
            dtr.Close();
        }

        public static string CreateRandomPassword(int PasswordLength)
        {
            string allowedChars = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
            Random ranNum = new Random();
            char[] chars = new char[PasswordLength];
            int allowedCharCount = allowedChars.Length;
            for (int i = 0; i < PasswordLength; i++)
            {
                chars[i] = allowedChars[(int)((allowedChars.Length) * ranNum.NextDouble())];
            }
            return new string(chars);
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            String GeneratedRandomPassword = CreateRandomPassword(8);
            btnNext.Visible = true;
            txtTo.Text = txtEmail.Text;
            txtFrom.Text = "LiewKenHieng@gmail.com";
            txtSubject.Text = "Forget Password";
            txtBody.Text = "This is your new password :" + GeneratedRandomPassword;
            txtUsername2.Text = "LiewKenHieng@gmail.com";
            txtPassword.Text = "shinchan1995";

            //Send Mail
            MailMessage msg = new MailMessage();
            msg.To.Add(txtTo.Text);
            msg.From = new MailAddress(txtFrom.Text);
            msg.Subject = txtSubject.Text;
            msg.Body = txtBody.Text;
            msg.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.Credentials = new System.Net.NetworkCredential(txtUsername2.Text, txtPassword.Text);
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls11;
            smtp.Send(msg);
            Response.Write("Sucess");

            //Update database
           

            /*Step 1: Create and Open Connection*/
            SqlConnection connTaxi;
            string connStr = ConfigurationManager.ConnectionStrings["TaxiConn"].ConnectionString;
            connTaxi = new SqlConnection(connStr);
            connTaxi.Open();

            /*Step 2: Create Sql Insert statement and Sql Insert Object*/


            string strUpdate;
            SqlCommand cmdUpdate;
            strUpdate = "Update customer Set cust_password = @cust_password Where cust_username = @cust_username";

            cmdUpdate = new SqlCommand(strUpdate, connTaxi);


            cmdUpdate.Parameters.AddWithValue("@cust_password", Encrypt(GeneratedRandomPassword));
            cmdUpdate.Parameters.AddWithValue("@cust_username", txtUsername.Text);

            /*Step 3: Execute command to insert*/
            int n = cmdUpdate.ExecuteNonQuery();

            /*Display insert status*/
            if (n > 0)
                lblDisplay.Text = "New password has been send to your email, please check your email to get the password and login using the given password. You are advised to change the password later.";
            else
                lblDisplay.Text = "Sorry, update failed.";

            /*Step 4: Close database connection*/
            connTaxi.Close();
        }

 
    }
}
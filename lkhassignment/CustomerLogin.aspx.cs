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
    public partial class login : System.Web.UI.Page
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

        protected void btnLogin_Click(object sender, EventArgs e)
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
            String password = "'" + Encrypt(txtPassword.Text.Trim()) + "'";

            strSelect = "Select cust_id, cust_username , cust_password From customer Where cust_username = " + username + " AND cust_password = " + password + ";";
            cmdSelect = new SqlCommand(strSelect, connTaxi);

            /*Step 3: Execute command to retrieve data*/
            SqlDataReader dtr;
            dtr = cmdSelect.ExecuteReader();

            /*Step 4: Display result set from the query*/
            if (dtr.HasRows)
            {
                while (dtr.Read())
                {
                    if (dtr["cust_username"].ToString().Equals(txtUsername.Text) && dtr["cust_password"].ToString().Equals(Encrypt(txtPassword.Text.Trim())))
                    {
                       
                        Session["cust_id"] = dtr["cust_id"];
                        lblDisplay.Text = "Login successfully.";
                       
                       Response.Redirect("CustomerMenu.aspx");
                    }

                }

            }
            else
                lblDisplay.Text = "Login fail, incorrect username or password.";

            /*Step 5: Close SqlReader and Database connection*/
            connTaxi.Close();
            dtr.Close();


        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;

namespace lkhassignment
{
    public partial class Email : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getPromotion();

        }
        public string getPromotion()
        {
            string promotion = "";
            SqlConnection conCust;
            string connStr = ConfigurationManager.ConnectionStrings["TaxiConn"].ConnectionString;
            conCust = new SqlConnection(connStr);
            conCust.Open();

            string strSelect;
            SqlCommand cmdSelect;
            SqlDataReader dtr;

            strSelect = "select * from Promotion where promotionDateFrom in (select max(promotionDateFrom) from Promotion)";
            cmdSelect = new SqlCommand(strSelect, conCust);
            dtr = cmdSelect.ExecuteReader();
            if (dtr.HasRows)
            {
                while (dtr.Read())
                {

                    promotion = dtr["promotionDesc"].ToString();
                    
                }
            }
            return promotion;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {



            SqlConnection conCust;
            string connStr = ConfigurationManager.ConnectionStrings["TaxiConn"].ConnectionString;
            conCust = new SqlConnection(connStr);
            conCust.Open();

            string strSelect;
            SqlCommand cmdSelect;


            //strSelect1 = "select * from Promotion where promotionDateFrom in (select max(promotionDateFrom) from Promotion)";



            strSelect = "Select c.cust_email from customer c , Reservation r, Payment p where p.ReservationId = r.ReservationId AND r.CustId = c.cust_id and paymentId=(@paymentId)";
            cmdSelect = new SqlCommand(strSelect, conCust);
            cmdSelect.Parameters.AddWithValue("@paymentId", ddlPaymentID.SelectedValue);


            object getEmail = cmdSelect.ExecuteScalar();

            string email = "";
            if (getEmail != null)
            {
                email = getEmail.ToString();
                
                MailMessage mssg = new MailMessage("singsing95z@gmail.com", email);
                mssg.Subject = "Notification";
                mssg.Body = "We will arrive in 15minutes!" + "our latest promotion is" + getPromotion().ToString();
                mssg.IsBodyHtml = true;

                SmtpClient smtp = new SmtpClient();
                smtp.Send(mssg);
                Label1.Text = "Email Sent Successfully!";
            }

            conCust.Close();


        }


        protected void Timer1_Tick(object sender, EventArgs e)
        {
            lblTime.Text = DateTime.Now.ToString();
        }
   
    }
}
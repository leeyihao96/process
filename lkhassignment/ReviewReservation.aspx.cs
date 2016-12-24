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
    public partial class ReviewReservation : System.Web.UI.Page
    {
        string con = ConfigurationManager.ConnectionStrings["TaxiConn"].ConnectionString;
        SqlConnection conn;
        PaymentWebService payment = new PaymentWebService();



        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["payment"];
            lblCardType.Text = cookie["paymentType"].ToString();
            lblCard.Text = cookie["creditCardType"].ToString();
            lblCardNumber.Text = cookie["creditCardNumber"].ToString();
            openConnection();
            string strSelect = "Select * from Reservation where ReservationId = @reservationId";

            SqlCommand cmdSelect = new SqlCommand(strSelect, conn);
            cmdSelect.Parameters.AddWithValue("@reservationId", Session["reser_id"]);
            SqlDataReader dtr = cmdSelect.ExecuteReader();

            if (dtr.HasRows)
            {
                while (dtr.Read())
                {
                        string begin = dtr["pickupAddress"].ToString();
                        string finish = dtr["Destination"].ToString();
                        double amount = double.Parse(dtr["Amount"].ToString());
                        lblNavigation.Text = begin + " to " + finish;
                        lblAmount.Text = amount.ToString();
                        lblSubTotal.Text = lblAmount.Text;
                        lblTotal.Text = lblSubTotal.Text;
                }
            }
            closeConnection();
            dtr.Close();
        }

        public void openConnection()
        {
            conn = new SqlConnection(con);
            conn.Open();
        }

        public void closeConnection()
        {
            conn.Close();
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["payment"];
            string paymentId = Session["paymentId"].ToString();
            string reservationId = Session["reser_id"].ToString();

            openConnection();
            string strInsert = "Insert into Payment Values (@paymentId, @paymentDate, @paymentAmount, @paymentType, @cardType, @cardNumber, @reservationId)";

            SqlCommand cmdInsert = new SqlCommand(strInsert, conn);

            cmdInsert.Parameters.AddWithValue("@paymentId", paymentId);
            cmdInsert.Parameters.AddWithValue("@paymentDate", DateTime.Now);
            cmdInsert.Parameters.AddWithValue("@paymentAmount", double.Parse(lblTotal.Text));
            cmdInsert.Parameters.AddWithValue("@paymentType", lblCardType.Text);
            cmdInsert.Parameters.AddWithValue("@cardType", lblCard.Text);
            cmdInsert.Parameters.AddWithValue("@cardNumber", lblCardNumber.Text);
            cmdInsert.Parameters.AddWithValue("@reservationId", reservationId);


            int n = cmdInsert.ExecuteNonQuery();

            if (n > 0)
            {
                string paymentSuccess = "SUCCESS";
                if (paymentSuccess == "SUCCESS")
                {
                    closeConnection();
                    string updateSuccess = payment.updateReservationStatus(reservationId);
                    if (updateSuccess == "SUCCESS")
                    {
                        Response.Redirect("PaymentSuccessful.aspx");
                     
                    }
                }
                else
                {
                    Response.Redirect("PaymentCanceled.aspx");
                }
            }
            else
            {
                string paymentSuccess = "FAILED";
            }
            

        }
        public string getPromotion()
        {
            string promotion = "";
            SqlConnection conCust;
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
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

    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;

namespace lkhassignment
{
    /// <summary>
    /// Summary description for PaymentWebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class PaymentWebService : System.Web.Services.WebService
    {
        string con = ConfigurationManager.ConnectionStrings["TaxiConn"].ConnectionString;
        SqlConnection conn;



        public PaymentWebService()
        {
            newPaymentId();

        }

        [WebMethod]
        public void openConnection()
        {
            conn = new SqlConnection(con);
            conn.Open();
        }

        public void closeConnection()
        {
            conn.Close();
        }

        public string newPaymentId()
        {
            int total = countPaymentMade();
            openConnection();
            string strSelect = "Select paymentId from Payment";

            SqlCommand cmdSelect = new SqlCommand(strSelect, conn);

            SqlDataReader dtr = cmdSelect.ExecuteReader();

            if (dtr.HasRows)
            {
                while (dtr.Read())
                {
                    int id = int.Parse(dtr["paymentId"].ToString().Substring(3, 4)) + total;
                    return "INV" + (id);
                }
            }
            closeConnection();
            dtr.Close();
            return "";
        }

        public int countPaymentMade()
        {
            openConnection();
            string strSelect = "Select Count(paymentId) As totalPaymentMade from Payment";

            SqlCommand cmdSelect = new SqlCommand(strSelect, conn);

            SqlDataReader dtr = cmdSelect.ExecuteReader();

            if (dtr.HasRows)
            {
                while (dtr.Read())
                {
                    return int.Parse(dtr["totalPaymentMade"].ToString());
                }
            }
            closeConnection();
            dtr.Close();
            return 0;
        }

        public string addPayment(string id, DateTime date, double amount, string payment, string cardNetwork, string cardNumber, string reservationId)
        {
            openConnection();
            string strInsert = "Insert into Payment Values (@paymentId, @paymentDate, @paymentAmount, @paymentType, @cardType, @cardNumber, @reservationId)";

            SqlCommand cmdSelect = new SqlCommand(strInsert, conn);

            cmdSelect.Parameters.AddWithValue("@paymentId", id);
            cmdSelect.Parameters.AddWithValue("@paymentDate", date);
            cmdSelect.Parameters.AddWithValue("@paymentAmount", amount);
            cmdSelect.Parameters.AddWithValue("@paymentType", payment);
            cmdSelect.Parameters.AddWithValue("@cardType", cardNetwork);
            cmdSelect.Parameters.AddWithValue("@cardNumber", cardNumber);
            cmdSelect.Parameters.AddWithValue("@reservationId", "R001");


            int n = cmdSelect.ExecuteNonQuery();

            if (n > 0)
            {
                return "SUCCESS";
            }
            else
            {
                return "FAILED";
            }
            closeConnection();
            return "";
        }

        public string updateReservationStatus(string reservationId)
        {
            openConnection();
            string strInsert = "Update Reservation set Status='paid' where ReservationId = @resrevationId";

            SqlCommand cmdSelect = new SqlCommand(strInsert, conn);

            cmdSelect.Parameters.AddWithValue("@reservationId", reservationId);


            int row = cmdSelect.ExecuteNonQuery();

            if (row > 0)
            {
                return "SUCCESS";
            }
            closeConnection();
            return "";
        }

    }
}

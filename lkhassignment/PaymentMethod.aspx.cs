using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Globalization;
using System.Data.SqlClient;
using System.Configuration;

namespace lkhassignment
{
    public partial class PaymentMethod : System.Web.UI.Page
    {
        private RadioButton paypal;
        private RadioButton card;
        PaymentWebService payment = new PaymentWebService();

        string con = ConfigurationManager.ConnectionStrings["TaxiConn"].ConnectionString;
        SqlConnection conn;

        public void openConnection()
        {
            conn = new SqlConnection(con);
            conn.Open();
        }

        public void closeConnection()
        {
            conn.Close();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            lbPaypalWork.OnClientClick = "javascript:window.open('https://www.paypal.com/webapps/mpp/paypal-popup','WIPaypal','toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, width=1060, height=700'); return false;";
            paypal = rbPayPal;
            card = rbCard;
            paypal.Enabled = false;
            if (card.Checked)
            {
                panelCard.Visible = true;
                paypal.Checked = false;
                panelError.Visible = false;
                myContainer.Visible = false;
                btnProceed.Visible = true;
            }
            //else
            //{
            //    panelCard.Visible = false;
            //    card.Checked = false;
            //    panelError.Visible = false;
            //    btnProceed.Visible = false;
            //    myContainer.Visible = true;
            //}

            string reservationId = Session["reser_id"].ToString();

            openConnection();
            string strSelect = "Select * from Reservation Where ReservationId = @reservationId";

            SqlCommand cmdSelect = new SqlCommand(strSelect, conn);

            cmdSelect.Parameters.AddWithValue("@reservationId", reservationId);

            SqlDataReader dtr = cmdSelect.ExecuteReader();

            if (dtr.HasRows)
            {
                while (dtr.Read())
                {
                    lblReservationId.Text = dtr["ReservationId"].ToString();
                    RESERVATION_ID.Value = lblReservationId.Text;
                    lblPickUpAddress.Text = dtr["pickupAddress"].ToString();
                    RESERVATION_BEGINNING.Value = lblPickUpAddress.Text;
                    lblDestination.Text = dtr["Destination"].ToString();
                    RESERVATION_DESTINATION.Value = lblDestination.Text;
                    lblAmount.Text = dtr["Amount"].ToString();
                    RESERVATION_AMOUNT.Value = lblAmount.Text;
                }
            }
            closeConnection();
            dtr.Close();

            lblPaymentId.Text = payment.newPaymentId();
            lblPaymentDate.Text = Convert.ToDateTime(DateTime.Now.ToShortDateString()).ToString("dd-MM-yyyy");

            ListItem ltMonth = new ListItem();
            ltMonth.Text = " ";
            ltMonth.Value = "0";
            ddlCardExpDateMonth.Items.Add(ltMonth);
            for (int i = 1; i <= 12; i++)
            {
                ltMonth = new ListItem();
                ltMonth.Text = Convert.ToDateTime("1/" + i.ToString() + "/1900").ToString("MM");
                ltMonth.Value = i.ToString();
                ddlCardExpDateMonth.Items.Add(ltMonth);
            }
            ddlCardExpDateMonth.Items.FindByValue("0").Selected = true;

            ListItem ltYear = new ListItem();
            ltYear.Text = " ";
            ltYear.Value = "0";
            ddlCardExpDateYear.Items.Add(ltYear);
            for (int i = DateTime.Now.Year; i < (DateTime.Now.Year + 7); i++)
            {
                ltYear = new ListItem();
                ltYear.Text = i.ToString();
                ltYear.Value = i.ToString();
                ddlCardExpDateYear.Items.Add(ltYear);
            }
            ddlCardExpDateYear.Items.FindByValue("0").Selected = true;
        }

        protected void rbPayPal_CheckedChanged(object sender, EventArgs e)
        {
            rbPayPal.Checked = true;
            rbCard.Checked = false;
            imgCard.Visible = false;
            panelCard.Visible = false;
            panelError.Visible = false;
            myContainer.Visible = true;
            btnProceed.Visible = false;
            form1.Action = "SetExpressCheckout.aspx?ExpressCheckoutMethod=ShorcutExpressCheckout";
        }

        protected void rbCard_CheckedChanged(object sender, EventArgs e)
        {
            rbPayPal.Checked = false;
            rbCard.Checked = true;
            imgCard.Visible = false;
            panelCard.Visible = true;
            panelError.Visible = false;
            myContainer.Visible = false;
            btnProceed.Visible = true;
        }

        protected void btnProceed_Click(object sender, EventArgs e)
        {
            if (rbCard.Checked)
            {
                Session["paymentId"] = lblPaymentId.Text;
                HttpCookie cookie = new HttpCookie("payment");
                cookie["creditCardType"] = rblCardType.SelectedValue;
                cookie["creditCardNumber"] = txtCardNumber.Text;
                cookie["paymentType"] = rbCard.Text;
                cookie["reservationId"] = lblReservationId.Text;
                Response.Cookies.Add(cookie);
                cookie.Expires = DateTime.Now.AddMinutes(5);
                Response.Redirect("ReviewReservation.aspx");
            }
        }

        protected void cardValidation_ServerValidate(object sender, EventArgs e)
        {
            try
            {
                string patt = "^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|3[47][0-9]{13})$";
                string card = txtCardNumber.Text;

                Regex expression = new Regex(@patt);
                Match match = Regex.Match(txtCardNumber.Text, patt);
                if (match.Success)
                {
                    txtCardNumber_TextChanged(sender, e);
                }
                else
                {
                    txtCardNumber_TextChanged(sender, e);
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void txtCardNumber_TextChanged(object sender, EventArgs e)
        {
            if (txtCardNumber.Text.IndexOf("3") == 0)
            {
                txtCardNumber.MaxLength = 15;
                txtSecurityCode.MaxLength = 4;
                imgCard.ImageUrl = "~/ae-badge.png";
                if (txtCardNumber.Text.IndexOf("4") == 1)
                {
                    imgCard.Visible = true;
                    panelError.Visible = false;
                }
                else if (txtCardNumber.Text.IndexOf("7") == 1)
                {
                    imgCard.Visible = true;
                    panelError.Visible = false;
                }
                else
                {
                    imgCard.Visible = false;
                    panelError.Visible = true;
                }
            }
            else if (txtCardNumber.Text.IndexOf("4") == 0)
            {
                txtCardNumber.MaxLength = 16;
                txtSecurityCode.MaxLength = 3;
                imgCard.Visible = true;
                imgCard.ImageUrl = "~/visa-badge.png";
            }
            else if (txtCardNumber.Text.IndexOf("5") == 0)
            {
                txtCardNumber.MaxLength = 16;
                txtSecurityCode.MaxLength = 3;
                imgCard.ImageUrl = "~/mastercard-badge.png";
                if (txtCardNumber.Text.IndexOf("1") == 1)
                {
                    imgCard.Visible = true;
                    panelError.Visible = false;
                }
                else if (txtCardNumber.Text.IndexOf("2") == 1)
                {
                    imgCard.Visible = true;
                    panelError.Visible = false;
                }
                else if (txtCardNumber.Text.IndexOf("3") == 1)
                {
                    imgCard.Visible = true;
                    panelError.Visible = false;
                }
                else if (txtCardNumber.Text.IndexOf("4") == 1)
                {
                    imgCard.Visible = true;
                    panelError.Visible = false;
                }
                else if (txtCardNumber.Text.IndexOf("5") == 1)
                {
                    imgCard.Visible = true;
                    panelError.Visible = false;
                }
                else
                {
                    imgCard.Visible = false;
                    panelError.Visible = true;
                }
            }
            else
            {
                imgCard.Visible = false;
                panelError.Visible = true;
            }

        }
    }
}
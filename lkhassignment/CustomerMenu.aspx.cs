using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lkhassignment
{
    public partial class CustomerMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerChangePassword.aspx");
        }



        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Menu.aspx");
        }

        protected void btnUpdateProfile_Click1(object sender, EventArgs e)
        {
            Response.Redirect("UpdateCustomer.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Reservation.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("ReservationRecord.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateReservation.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cancellation.aspx");
        }
    }
}
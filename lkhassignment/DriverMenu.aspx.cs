using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lkhassignment
{
    public partial class DriverMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("DriverChangePassword.aspx");
        }

        protected void btnAddDriver_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddDriver.aspx");
        }

        protected void btnUpdateDriver_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateDriver.aspx");
        }

    

        protected void btnViewAllCustomer_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewCustomer.aspx");
        }

        protected void btnViewReport_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerReport.aspx");
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Menu.aspx");
        }

        protected void btnViewAllDriver_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewDriver.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("ReservationReport.aspx");
        }

        protected void btnPromotion_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManagePromotion.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Email.aspx");
        }
    }
}
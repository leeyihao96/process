using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lkhassignment
{
    public partial class PaymentForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbldest.Text = Request.QueryString["to"];
            lblloc.Text = Request.QueryString["from"];
            lblkm.Text = Request.QueryString["km"];
            lblamount.Text = Request.QueryString["amount"];
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            string reserid = Session["reser_id"].ToString();
            using (LinQDataContext dbcontext = new LinQDataContext())
            {
                Reservation reserv = dbcontext.Reservations.FirstOrDefault(reserve => reserve.ReservationId == reserid);
                reserv.Status = "Cancel";
                dbcontext.SubmitChanges();
            }

            Response.Redirect("Reservation.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("PaymentMethod.aspx");
        }
    }
}
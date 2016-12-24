using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lkhassignment
{
    public partial class Cancellation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LinQDataContext dbcontext = new LinQDataContext();
            string custId = Session["cust_id"].ToString();

            var cust = (from Reservations in dbcontext.Reservations
                        where Reservations.CustId == custId && Reservations.Status == "Pending"
                        select new
                        {
                            Id = Reservations.ReservationId,
                            Date = string.Format("{0:dd-MM-yy}", Reservations.date),
                            Time = Reservations.time,
                            Location = Reservations.pickupAddress,
                            Reservations.Destination
                        });
            GridView1.DataSource = cust;
            GridView1.DataBind();
        }
        protected void GridView1_SelectedIndexChanged(object sender, GridViewSelectEventArgs e)
        {
            TextBox1.Text = GridView1.Rows[e.NewSelectedIndex].Cells[1].Text;
            TextBox2.Text = GridView1.Rows[e.NewSelectedIndex].Cells[2].Text;
            TextBox3.Text = GridView1.Rows[e.NewSelectedIndex].Cells[3].Text;
            TextBox4.Text = GridView1.Rows[e.NewSelectedIndex].Cells[4].Text;
            TextBox5.Text = GridView1.Rows[e.NewSelectedIndex].Cells[5].Text;


        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string reserid = TextBox1.Text;

            using (LinQDataContext dbcontext = new LinQDataContext())
            {
                Reservation reserv = dbcontext.Reservations.FirstOrDefault(reserve => reserve.ReservationId == reserid);
                reserv.Status = "Cancel";
                dbcontext.SubmitChanges();
            }
            Response.Write("<script>alert('Record cancel successfully')</script>");
        }
    }
}
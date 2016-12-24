using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lkhassignment
{
    public partial class ReservationRecord : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LinQDataContext dbcontext = new LinQDataContext();
            string custId = Session["cust_id"].ToString();

            var cust = (from Reservations in dbcontext.Reservations
                        where Reservations.CustId == custId
                        select new
                        {
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
            TextBox1.Text = GridView1.Rows[e.NewSelectedIndex].Cells[3].Text;
            TextBox2.Text = GridView1.Rows[e.NewSelectedIndex].Cells[4].Text;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["loc"] = TextBox1.Text;
            Session["des"] = TextBox2.Text;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Session["loc"] != null && Session["des"] != null)
            {
                Label4.Text = "Your favourite location is from " + Session["loc"].ToString() + " to " + Session["des"].ToString();

                // The code
            }
            else
            {
                Label4.Text = "No favourite location";
            }
        }
    }
}
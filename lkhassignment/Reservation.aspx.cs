using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;

namespace lkhassignment
{
    public partial class Reservation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime today = DateTime.Today;
            Calendar1.TodaysDate = today;

        }
        protected void Calendar2_DayRender(object sender, DayRenderEventArgs e)
        {
            DateTime pastday = e.Day.Date;
            DateTime date = DateTime.Now;
            int year = date.Year;
            int month = date.Month;
            int day = date.Day;
            DateTime today = new DateTime(year, month, day);
            if (pastday.CompareTo(today) < 0)
            {
                e.Cell.BackColor = System.Drawing.Color.Gray;
                e.Day.IsSelectable = false;
            }
            //string dte = DateTime.Now.ToString();
            //if (e.Day.Date <= Convert.ToDateTime(dte))
            //{
            //    e.Day.IsSelectable = false;
            //    e.Cell.ForeColor = System.Drawing.Color.Gray;
            //}
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (ddlloc.SelectedValue == ddldest.SelectedValue)
            {
                lblError.Text = "Pick up location and destination cannot be the same!";
            }

            else
            {
                DateTime dateTime1 = Calendar1.SelectedDate;
                DateTime dateTime2 = DateTime.Today;

                if (dateTime1 == dateTime2)
                {
                    string time = DropDownList1.SelectedValue + ":" + DropDownList2.SelectedValue + " " + ddlAmPm.SelectedValue;
                    DateTime time1 = DateTime.ParseExact(time, "h:mm tt", CultureInfo.InvariantCulture);
                    string time2 = DateTime.Now.AddHours(2).ToString("h:mm tt", System.Globalization.DateTimeFormatInfo.InvariantInfo);
                    DateTime time3 = DateTime.ParseExact(time2, "h:mm tt", CultureInfo.InvariantCulture);
                    if (time1 >= time3)
                    {
                        divTaxiLists.Visible = true;
                        lblError.Text = "";
                        TextBox1.Text = ddlloc.SelectedValue;
                        TextBox2.Text = ddldest.SelectedValue;
                        TextBox3.Text = Calendar1.SelectedDate.ToString("d");
                        string time0 = DropDownList1.SelectedValue + ":" + DropDownList2.SelectedValue + " " + ddlAmPm.SelectedValue;
                        TextBox4.Text = time0;
                    }
                    else
                    {
                        lblError.Text = "Please book 2 hours in advanced!";
                    }
                }

                else
                {
                    divTaxiLists.Visible = true;
                    div1.Visible = true;
                    lblError.Text = "";
                    TextBox1.Text = ddlloc.SelectedValue;
                    TextBox2.Text = ddldest.SelectedValue;
                    TextBox3.Text = Calendar1.SelectedDate.ToString("d");
                    string time = DropDownList1.SelectedValue + ":" + DropDownList2.SelectedValue + " " + ddlAmPm.SelectedValue;
                    TextBox4.Text = time;
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //auto generate reserve id
            LinQDataContext dbcontext = new LinQDataContext();
            var count = dbcontext.Reservations.Count();
            int num = count + 1;
            string reserid;
            if (num < 10)
            {
                reserid = "R00" + num;
            }
            else
            {
                reserid = "R0" + num;
            }
            Session["reser_id"] = reserid;

            //calculate distance and amount
            string pickup = TextBox1.Text;
            string destination = TextBox2.Text;
            double km = calculateKm(pickup, destination);
            double amount = Price(km);

            DateTime pickupdate = Convert.ToDateTime(TextBox3.Text);
            string time = TextBox4.Text;
            string status = "Pending";
            string custId = Session["cust_id"].ToString();
            string platenum = TextBox5.Text;
            string company = TextBox7.Text;
            string scheduleid = TextBox8.Text;

            Reservation r = new Reservation();
            r.ReservationId = reserid;
            r.date = pickupdate;
            r.time = time;
            r.pickupAddress = pickup;
            r.Destination = destination;
            r.Amount = Math.Round(System.Convert.ToDecimal(amount));
            r.Status = status;
            r.ScheduleId = scheduleid;
            r.CustId = custId;

            dbcontext.Reservations.InsertOnSubmit(r);
            dbcontext.SubmitChanges();


            Response.Redirect("PaymentForm.aspx?km=" + km + "&amount=" + amount + "&from=" + pickup + "&to=" + destination);

        }
        public double calculateKm(string from, string to)
        {
            double km;
            if ((from == "Kepong" && to == "Wangsa Maju") || (from == "Wangsa Maju" && to == "Kepong"))
            {
                km = 21.60;
            }
            else if ((from == "Kepong" && to == "Cheras") || (from == "Cheras" && to == "Kepong"))
            {
                km = 16.60;
            }
            else if ((from == "Kepong" && to == "Sentul") || (from == "Sentul" && to == "Kepong"))
            {
                km = 7.40;
            }
            else if ((from == "Wangsa Maju" && to == "Cheras") || (from == "Cheras" && to == "Wangsa Maju"))
            {
                km = 17.80;
            }
            else if ((from == "Wangsa Maju" && to == "Sentul") || (from == "Sentul" && to == "Wangsa Maju"))
            {
                km = 16.00;
            }
            else
            {
                km = 15.90;
            }
            return km;
        }
        public double Price(double km)
        {
            double price = 3 + (km * 1.5);
            return price;
        }

        protected void GridView1_SelectedIndexChanged(object sender, GridViewSelectEventArgs e)
        {
            TextBox8.Text = GridView1.Rows[e.NewSelectedIndex].Cells[1].Text;
            TextBox5.Text = GridView1.Rows[e.NewSelectedIndex].Cells[2].Text;
            TextBox6.Text = GridView1.Rows[e.NewSelectedIndex].Cells[3].Text;
            TextBox7.Text = GridView1.Rows[e.NewSelectedIndex].Cells[4].Text;
            divTaxiLists2.Visible = true;
        }
    }
}
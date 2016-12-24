using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace lkhassignment
{
    public partial class ManagePromotion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string CountId()
        {
            int i = 0;
            SqlConnection conPromotion;
            string connStr = ConfigurationManager.ConnectionStrings["TaxiConn"].ConnectionString;
            conPromotion = new SqlConnection(connStr);
            conPromotion.Open();

            string strSearch;
            SqlCommand cmdSearch;

            strSearch = "select count(*) from Promotion";
            cmdSearch = new SqlCommand(strSearch, conPromotion);
            i = Convert.ToInt32(cmdSearch.ExecuteScalar());
            object getCount = cmdSearch.ExecuteScalar();

            int n = Convert.ToInt32(getCount) + 1;

            string proID = "";
            if (getCount != null)
            {

                if (i < 100)
                {

                    proID = "P100" + n.ToString();

                }
                else
                {
                    proID = "P10" + n.ToString();

                }
            }

            return proID;


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            lblMssg.Text = "";
            SqlConnection conPromotion;
            string connStr = ConfigurationManager.ConnectionStrings["TaxiConn"].ConnectionString;
            conPromotion = new SqlConnection(connStr);
            conPromotion.Open();

            string strInsert;
            SqlCommand cmdInsert;


            strInsert = "Insert Into Promotion (promotionId,promotionDesc,promotionDateFrom,promotionDateUntil,promotionStatus) Values (@promotionId,@promotionDesc,@promotionDateFrom,@promotionDateUntil,@promotionStatus)";
            cmdInsert = new SqlCommand(strInsert, conPromotion);

            if (Calendar1.SelectedDate > Calendar2.SelectedDate)
            {
                lblMssg.Text = "The promotion begin date should not over than promotion end date!";
            }

            else if (txtDesc.Value.Equals("") || txtStatus.Text.Equals("") || txtCalendar1.Text.Equals("") || txtCalendar2.Text.Equals(""))
            {
                lblMssg.Text = "cannot be blank";
            }
            else
            {
                cmdInsert.Parameters.AddWithValue("@promotionId", CountId().ToString());
                cmdInsert.Parameters.AddWithValue("@promotionDesc", txtDesc.Value);

                cmdInsert.Parameters.AddWithValue("@promotionDateFrom", Calendar1.SelectedDate);
                cmdInsert.Parameters.AddWithValue("@promotionDateUntil", Calendar2.SelectedDate);

                cmdInsert.Parameters.AddWithValue("@promotionStatus", txtStatus.Text);
                int n = cmdInsert.ExecuteNonQuery();
                if (n > 0)
                {
                    lblMssg.Text = "New Promotion Added!";
                }
                else
                {
                    lblMssg.Text = "Sorry, Insertion Failed!";
                }

            }


            conPromotion.Close();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                lblMssg.Text = "";
                string calendar1 = Calendar1.SelectedDate.ToString();
                string calendar2 = Calendar2.SelectedDate.ToString();
                SqlConnection conPromotion;
                string connStr = ConfigurationManager.ConnectionStrings["TaxiConn"].ConnectionString;
                conPromotion = new SqlConnection(connStr);
                conPromotion.Open();

                string strSearch;
                SqlCommand cmdUpdate;

                strSearch = "Update Promotion Set promotionDesc=(@promotionDesc),promotionDateFrom=(@promotionDateFrom),promotionDateUntil=(@promotionDateUntil),promotionStatus =(@promotionStatus) Where  promotionId=(@promotionId)";



                cmdUpdate = new SqlCommand(strSearch, conPromotion);
                cmdUpdate.Parameters.AddWithValue("@promotionId", DropDownList1.SelectedValue);
                cmdUpdate.Parameters.AddWithValue("@promotionDesc", txtDesc.Value);
                cmdUpdate.Parameters.AddWithValue("@promotionDateFrom", Calendar1.SelectedDate);
                cmdUpdate.Parameters.AddWithValue("@promotionDateUntil", Calendar2.SelectedDate);
                cmdUpdate.Parameters.AddWithValue("@promotionStatus", txtStatus.Text);

                int n = cmdUpdate.ExecuteNonQuery();
                if (n > 0)
                {
                    lblMssg.Text = "Update Sucessfully";
                }
                else
                {
                    lblMssg.Text = "Sorry, Update Failed!";
                }

                conPromotion.Close();

            }
            catch (SqlException ex)
            {
                lblMssg.Text = "Error!";
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            DropDownList1.SelectedIndex = 0;

            txtDesc.Value = "";
            txtCalendar1.Text = "";
            txtCalendar2.Text = "";
            txtStatus.Text = "";
            lblMssg.Text = "";
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblMssg.Text = "";

            /*Step 1: Create and Open Connection*/
            SqlConnection conPromotion;
            string connStr = ConfigurationManager.ConnectionStrings["TaxiConn"].ConnectionString;
            conPromotion = new SqlConnection(connStr);
            conPromotion.Open();

            /*Step2 : SQL Command object to retrieve data from Books table*/
            string strSelect;
            SqlCommand cmdSelect;

            strSelect = "Select * From Promotion where promotionId=(@promotionId)";
            cmdSelect = new SqlCommand(strSelect, conPromotion);
            cmdSelect.Parameters.AddWithValue("@promotionId", DropDownList1.SelectedValue);
            /*Step 3: Execute command to retrieve data*/
            SqlDataReader dtr;
            dtr = cmdSelect.ExecuteReader();

            /*Step 4: Display result set from the query*/
            if (dtr.HasRows)
            {
                while (dtr.Read())
                {

                    txtDesc.Value = dtr["promotionDesc"].ToString();
                    txtCalendar1.Text = dtr["promotionDateFrom"].ToString();
                    txtCalendar2.Text = dtr["promotionDateUntil"].ToString();
                    txtStatus.Text = dtr["promotionStatus"].ToString();


                    lblMssg.Text = "Sucess!";

                }

                /*Step 5: Close SqlReader and Database connection*/
                conPromotion.Close();
                dtr.Close();

            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtCalendar1.Text = Calendar1.SelectedDate.ToString();
        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            txtCalendar2.Text = Calendar2.SelectedDate.ToString();
        }
    }
}
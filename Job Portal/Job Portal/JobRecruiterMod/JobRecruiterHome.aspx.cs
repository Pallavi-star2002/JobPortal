using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Job_Portal.JobRecruiter
{
    public partial class JobRecruiterHome : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=LAPTOP-BJGR0B5C\\SQLEXPRESS;initial catalog=dbjobportal ;integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                jobrecruiterBind();
            }
        }

        public void jobrecruiterBind()
        {
            if (Session["JRID"] != null)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM tblJobRecruiter WHERE JobRecruiterId = @JobRecruiterId", con);
                cmd.Parameters.AddWithValue("@JobRecruiterId", Session["JRID"]);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();

                if (dt.Rows.Count > 0)
                {
                    lblname.Text = dt.Rows[0]["JobRecruitername"].ToString();
                    lblemail.Text = dt.Rows[0]["JobRecruiteremail"].ToString();
                    lblurl.Text = dt.Rows[0]["JobRecruiterURL"].ToString();
                    lblpassword.Text = dt.Rows[0]["JobRecruiterpassword"].ToString();
                    lblstate.Text = dt.Rows[0]["JobRecruiterstate"].ToString();
                    lblcity.Text = dt.Rows[0]["JobRecruiterCity"].ToString();
                    lbladdress.Text = dt.Rows[0]["JobRecruiterAddress"].ToString();
                    lblhr.Text = dt.Rows[0]["JobRecruiterHR"].ToString();
                    lblmobile.Text = dt.Rows[0]["JobRecruiterMobile"].ToString();
                    lblcomments.Text = dt.Rows[0]["JobRecruitercomments"].ToString();
                    lblimage.Text = dt.Rows[0]["JobRecruiterimage"].ToString();
                }
                else
                {
                    // Handle case where no data is found
                    lblname.Text = "No data found";
                    // Optionally display a user-friendly message or take other actions
                }
            }
            else
            {
                // Handle the case where Session["JRID"] is null or invalid
                lblname.Text = "Session expired or invalid";
            }
        }
    }
}

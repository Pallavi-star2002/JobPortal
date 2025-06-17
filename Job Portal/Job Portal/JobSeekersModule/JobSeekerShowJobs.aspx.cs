using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Job_Portal.JobSeekersModule
{
    public partial class JobSeekerShowJobs : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=LAPTOP-BJGR0B5C\\SQLEXPRESS;initial catalog=dbjobportal ;integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bindjobshows();
                BindJobProfile();
            }
        }

        public void Bindjobshows()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("proc_JobPost", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "JOINJOBPOSTALLACTIVE");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            gvjobshow.DataSource = dt;
            gvjobshow.DataBind();

        }

        public void BindJobProfile()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tblJobProfile", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddljobprofile.DataValueField = "JobProfileId";
            ddljobprofile.DataTextField = "JobProfileName";
            ddljobprofile.DataSource = dt;
            ddljobprofile.DataBind();
            ddljobprofile.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("proc_JobPost", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "JOBPOSTSEARCH");
            cmd.Parameters.AddWithValue("@JobPostJobProfileId", ddljobprofile.SelectedValue);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            gvjobshow.DataSource = dt;
            gvjobshow.DataBind();
        }

        protected void gvjobshow_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "ApplyJob")
    {
                // Get the source of the command
                Button btn = (Button)e.CommandSource;
                GridViewRow row = (GridViewRow)btn.NamingContainer;

                // Get job post id from CommandArgument
                string jobPostId = e.CommandArgument.ToString();

                // Optional: Save this application status to DB here

                // Hide the button and show "Applied" label
                Button applyButton = (Button)row.FindControl("btnApply");
                Label lblApplied = (Label)row.FindControl("lblApplied");

                if (applyButton != null && lblApplied != null)
                {
                    applyButton.Visible = false;
                    lblApplied.Visible = true;
                }

                // Optional alert
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Successfully applied for job ID: " + jobPostId + "');", true);
            }
        }
    }
}
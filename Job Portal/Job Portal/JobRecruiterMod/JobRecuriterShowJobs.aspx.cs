using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace Job_Portal.JobRecruiterMod
{
    public partial class JobRecuriterShowJobs : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=LAPTOP-BJGR0B5C\\SQLEXPRESS;initial catalog=dbjobportal ;integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bindjobshows();
            }
        }

        public void Bindjobshows()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("proc_JobPost", con);
            cmd.CommandType= CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "JOINJOBPOST");
            cmd.Parameters.AddWithValue("@JobRecruiterId", Session["JRID"]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            gvjobshow.DataSource = dt;
            gvjobshow.DataBind();

        }

        protected void gvjobshow_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "A")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("proc_JobPost", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "DELETE");
                cmd.Parameters.AddWithValue("@JobPostId", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
                Bindjobshows();

            }
            else if (e.CommandName == "B")
            {
                
                Response.Redirect("/JobRecruiterMod/JobRecruiter_JobPost.aspx?pp=" + e.CommandArgument);

            }

        }
    }
}
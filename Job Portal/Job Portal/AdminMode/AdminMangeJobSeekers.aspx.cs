using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Job_Portal.AdminMod
{
    public partial class AdminMangeJobSeekers : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=LAPTOP-BJGR0B5C\\SQLEXPRESS;initial catalog=dbjobportal ;integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindjobSeekers();
            }

        }
        public void BindjobSeekers()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Proc_JobSeeker", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "JobSeekerJoin");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            gvjobshow.DataSource = dt;
            gvjobshow.DataBind();

        }

        protected void gvjobshow_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "B")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("proc_JobSeeker", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "JobSeekerBlock");
                cmd.Parameters.AddWithValue("@JobSeekerId", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
                BindjobSeekers();
            }
        }
    }
}
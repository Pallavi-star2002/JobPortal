using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Job_Portal.AdminMod
{
    public partial class AdminMangeJobRecuriters : System.Web.UI.Page
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
            SqlCommand cmd = new SqlCommand("proc_JobRecruiter", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "JobRecruierJoin");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            gvjobshow.DataSource = dt;
            gvjobshow.DataBind();

        }

        protected void gvjobshow_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "B")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("proc_JobRecruiter", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "JobRecruiterBlock");
                cmd.Parameters.AddWithValue("@JobRecruiterId",e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close() ;
                Bindjobshows();
            }

        }
    }
}
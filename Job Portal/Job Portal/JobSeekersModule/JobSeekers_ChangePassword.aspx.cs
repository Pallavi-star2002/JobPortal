using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Job_Portal.JobSeekersModule
{
    public partial class JobSeekers_ChangePassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=LAPTOP-BJGR0B5C\\SQLEXPRESS;initial catalog=dbjobportal ;integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void chngpwd_Click(object sender, EventArgs e)
        {
            if (txtnewpwd.Text == txtconfirmpwd.Text)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Proc_JobSeeker", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "changepwd");
                cmd.Parameters.AddWithValue("@JobSeekerId", Session["JSID"]);
                cmd.Parameters.AddWithValue("@JobSeekerNewPassword", txtnewpwd.Text);
                cmd.Parameters.AddWithValue("@JobSeekerCurrentPassword", txtoldpwd.Text);
                int i=cmd.ExecuteNonQuery();
                con.Close();
                if (i == 0)
                {
                    lblmsg.Text = "your current Password is not Correct";
                }
                else
                {
                    lblmsg.Text = "Password Change Successfully";
                }

            }
            else
            {
                lblmsg.Text = "Password do not Match!!";
            }

        
        }

    }
}
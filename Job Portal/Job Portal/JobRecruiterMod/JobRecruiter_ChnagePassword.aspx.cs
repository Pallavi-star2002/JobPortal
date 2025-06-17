using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Job_Portal.JobRecruiterMod
{
    public partial class JobRecruiter_ChnagePassword : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("proc_JobRecruiter", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "changepwd");
                cmd.Parameters.AddWithValue("@JobRecruiterId", Session["JRID"]);
                cmd.Parameters.AddWithValue("@JobRecruiterNewPassword", txtnewpwd.Text);
                cmd.Parameters.AddWithValue("@JobRecruiterCurrentPassword", txtoldpwd.Text);
                int i = cmd.ExecuteNonQuery();
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
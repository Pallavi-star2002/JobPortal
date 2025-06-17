using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Job_Portal.AdminModule
{
    public partial class Admin_changepassword : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("proc_admin", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@adminid", Session["AID"]);
                cmd.Parameters.AddWithValue("@adminNewPassword", txtnewpwd.Text);
                cmd.Parameters.AddWithValue("@adminCurrentPassword", txtconfirmpwd.Text);
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
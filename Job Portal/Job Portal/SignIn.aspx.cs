using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Job_Portal
{
    public partial class SignIn : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=LAPTOP-BJGR0B5C\\SQLEXPRESS;initial catalog=dbjobportal ;integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signin_Click(object sender, EventArgs e)
        {

            if ((ddlusertype.SelectedIndex == 1))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select*from admin where AdminEmail='" + txtemail.Text + "' AND AdminPassword='" + txtpassword.Text + "' ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                if (dt.Rows.Count == 0)
                {
                    lblmsg.Text = "Login Failed!!";
                }
                else
                {
                    Session["AID"] = dt.Rows[0]["AdminId"];
                    Response.Redirect("~/AdminMode/AdminHome.aspx");
                }
            }
           else if ((ddlusertype.SelectedIndex == 2))
            {
                con.Open();
                SqlCommand cmd= new SqlCommand("select*from tblJobSeeker where JobSeekerEmail='" + txtemail.Text+ "' AND JobSeekerPassword='" + txtpassword.Text+ "'and JobSeekerStatus=0 ", con);
                SqlDataAdapter da= new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                if(dt.Rows.Count == 0)
                {
                    lblmsg.Text = "Login Failed!!";
                }
                else
                {
                    Session["JSID"] = dt.Rows[0]["JobSeekerId"];
                    Response.Redirect("~/JobSeekersModule/JobSeekersHome.aspx");
                }

            }
           else  if ((ddlusertype.SelectedIndex == 3))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select*from tblJobRecruiter where JobRecruiterEmail='" + txtemail.Text + "' AND JobRecruiterPassword='" + txtpassword.Text + "' and JobRecruiterStatus=0", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                if (dt.Rows.Count == 0)
                {
                    lblmsg.Text = "Login Failed!!";
                }
                else
                {
                    Session["JRID"] = dt.Rows[0]["JobRecruiterId"];
                    Response.Redirect("~/JobRecruiterMod/JobRecruiterHome.aspx");
                }
            }

        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;


namespace Job_Portal
{
    public partial class JobSeeker_Registration : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=LAPTOP-BJGR0B5C\\SQLEXPRESS;initial catalog=dbjobportal ;integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindSecurityQuestions();
                BindJobProfile();
                BindQualification();
                BindState();
            }
        }
        public void BindSecurityQuestions()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tblquestions", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddlsecurityquestion.DataValueField = "QuestionId";
            ddlsecurityquestion.DataTextField = "QuestionName";
            ddlsecurityquestion.DataSource = dt;
            ddlsecurityquestion.DataBind();
            ddlsecurityquestion.Items.Insert(0, new ListItem("--Select--", "0"));
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

        public void BindQualification()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tblQualifications", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddlqualification.DataValueField = "QualificationId";
            ddlqualification.DataTextField = "QualificationName";
            ddlqualification.DataSource = dt;
            ddlqualification.DataBind();
            ddlqualification.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        public void BindState()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tblstate", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddlstate.DataValueField = "StateId";
            ddlstate.DataTextField = "StateName";
            ddlstate.DataSource = dt;
            ddlstate.DataBind();
            ddlstate.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        public void BindCity()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tblCity where StateId='" + ddlstate.SelectedValue + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddlcity.DataValueField = "CityId";
            ddlcity.DataTextField = "CityName";
            ddlcity.DataSource = dt;
            ddlcity.DataBind();
            ddlcity.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        

        protected void ddlstate_SelectedIndexChanged(object sender, EventArgs e)
        {
           
                BindCity();
          
        
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string ResumeName = DateTime.Now.Ticks.ToString() + Path.GetFileName(furesume.PostedFile.FileName);
            string PhotoName = DateTime.Now.Ticks.ToString()+Path.GetFileName(fuphoto.PostedFile.FileName);

            furesume.SaveAs(Server.MapPath("Jobseekar_resumes" +"\\" + ResumeName));
            fuphoto.SaveAs(Server.MapPath("Jobseekar_Photos" + "\\" + PhotoName));

            con.Open();
            SqlCommand cmd = new SqlCommand("Proc_JobSeeker", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "INSERT");
            cmd.Parameters.AddWithValue("@JobSeekername", txtname.Text);
            cmd.Parameters.AddWithValue("@JobSeekeremail", txtemail.Text);
            cmd.Parameters.AddWithValue("@JobSeekerGender", rblgender.SelectedValue);
            cmd.Parameters.AddWithValue("@JobSeekerpassword", txtpassword.Text);
            cmd.Parameters.AddWithValue("@JobSeekerjobprofile", ddljobprofile.SelectedValue);
            cmd.Parameters.AddWithValue("@JobSeekerexp", ddlexp.SelectedValue);
            cmd.Parameters.AddWithValue("@JobSeekerqualification", ddlqualification.SelectedValue);
            cmd.Parameters.AddWithValue("@JobSeekerstate", ddlstate.SelectedValue);
            cmd.Parameters.AddWithValue("@JobSeekercity", ddlcity.SelectedValue);
            cmd.Parameters.AddWithValue("@JobSeekerQuestion", ddlqualification.SelectedValue);
            cmd.Parameters.AddWithValue("@JobSeekerAnswer", txtanswer.Text);
            cmd.Parameters.AddWithValue("@JobSeekerAddress", txtaddress.Text);
            cmd.Parameters.AddWithValue("@JobSeekerDOB", txtdateofbirth.Text);
            cmd.Parameters.AddWithValue("@JobSeekerMobile", txtmobile.Text);
            cmd.Parameters.AddWithValue("@JobSeekercomments", txtcomments.Text);
            cmd.Parameters.AddWithValue("@JobSeekerresume", ResumeName);
            cmd.Parameters.AddWithValue("@JobSeekerimage", PhotoName);
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}
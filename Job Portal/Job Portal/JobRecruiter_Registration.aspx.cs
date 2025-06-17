using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Job_Portal
{
    public partial class JobRecruiter_Registration : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=LAPTOP-BJGR0B5C\\SQLEXPRESS;initial catalog=dbjobportal ;integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindState();
            }
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
            SqlCommand cmd = new SqlCommand("select * from tblCity where StateId='" +ddlstate.SelectedValue + "'", con);
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
        
                string ImageName = DateTime.Now.Ticks.ToString()+ Path.GetFileName(fuimage.PostedFile.FileName);
                fuimage.SaveAs(Server.MapPath("~/JobRecruiter_Images" + "\\" + ImageName));

                con.Open();
                SqlCommand cmd = new SqlCommand("proc_JobRecruiter", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "INSERT");
                cmd.Parameters.AddWithValue("@JobRecruitername", txtname.Text);
                cmd.Parameters.AddWithValue("@JobRecruiteremail", txtemail.Text);
                cmd.Parameters.AddWithValue("@JobRecruiterURL", txturl.Text);
                cmd.Parameters.AddWithValue("@JobRecruiterpassword", txtpassword.Text);
                cmd.Parameters.AddWithValue("@JobRecruiterstate", ddlstate.SelectedValue);
                cmd.Parameters.AddWithValue("@JobRecruiterCity", ddlcity.SelectedValue);
                cmd.Parameters.AddWithValue("@JobRecruiterAddress", txtaddress.Text);
                cmd.Parameters.AddWithValue("@JobRecruiterHR", txthr.Text);
                cmd.Parameters.AddWithValue("@JobRecruiterMobile", txtmobile.Text);
                cmd.Parameters.AddWithValue("@JobRecruitercomments", txtcomments.Text);
                cmd.Parameters.AddWithValue("@JobRecruiterimage", ImageName);
                cmd.ExecuteNonQuery();
                con.Close();
            }

       
    }
    

    
}
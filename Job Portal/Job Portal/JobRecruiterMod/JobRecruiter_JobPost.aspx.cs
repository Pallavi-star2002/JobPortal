using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Job_Portal.JobRecruiterMod
{
    public partial class JobRecruiter_JobPost : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=LAPTOP-BJGR0B5C\\SQLEXPRESS;initial catalog=dbjobportal ;integrated security=true");
        private int i;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                BindJobProfile();
                BindQualification();
                
            }

           

                if (Request.QueryString["pp"] != null && !string.IsNullOrEmpty(Request.QueryString["pp"]))
                {
                if (!IsPostBack)
                {
                    EditData();
                }
                   
                }
            }

         public void EditData()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("proc_JobPost", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "EDIT");
            cmd.Parameters.AddWithValue("@JobPostId", Request.QueryString["pp"]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddljobprofile.SelectedValue = dt.Rows[0]["JobPostJobProfileId"].ToString();
            ddljobmode.SelectedValue = dt.Rows[0]["JobPostMode"].ToString();
            rblgender.SelectedValue = dt.Rows[0]["JobPostGender"].ToString();
            
           string[] arr = dt.Rows[0]["JobPostQualifications"].ToString().Split(',');
            for (int i = 0; i <cblqualification.Items.Count; i++)
            {
                    for(int j = 0; j<arr.Length; j++)
                {
                    if (cblqualification.Items[i].Text == arr[j])
                    {
                        cblqualification.Items [i].Selected = true;
                    }
                }
            }



                txtminexp.Text = dt.Rows[0]["JobPostMinExp"].ToString();
            txtmaxexp.Text = dt.Rows[0]["JobPostmaxExp"].ToString();
            txtminsalary.Text = dt.Rows[0]["JobPostMinSalary"].ToString();
            txtmaxsalary.Text = dt.Rows[0]["JobPostMaxsalary"].ToString();
            txtvacancy.Text = dt.Rows[0]["JobPostVacancy"].ToString();
            txtcomments.Text = dt.Rows[0]["JobPostComments"].ToString();
            btnsubmit.Text = "Update";
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
            cblqualification.DataValueField = "QualificationId";
            cblqualification.DataTextField = "QualificationName";
            cblqualification.DataSource = dt;
            cblqualification.DataBind();
            
        }


        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(txtminsalary.Text) < Convert.ToInt32(txtmaxsalary.Text))
            {
               if (Convert.ToInt32(txtminexp.Text) < Convert.ToInt32(txtmaxexp.Text))
                {
                    string ch = "";
                    for (int i = 0; i < cblqualification.Items.Count; i++)
                    {

                        if (cblqualification.Items[i].Selected == true)
                        {
                            ch += cblqualification.Items[i].Text + ",";

                        }

                    }

                    ch = ch.TrimEnd(',');

                    if (btnsubmit.Text == "Submit")
                    {

                        con.Open();
                        SqlCommand cmd = new SqlCommand("proc_JobPost", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@action", "INSERT");
                        cmd.Parameters.AddWithValue("@JobRecruiterId", Session["JRID"]);
                        cmd.Parameters.AddWithValue("@JobPostJobProfileId", ddljobprofile.SelectedValue);
                        cmd.Parameters.AddWithValue("@JobPostMode", ddljobmode.SelectedValue);
                        cmd.Parameters.AddWithValue("@JobPostGender", rblgender.SelectedValue);
                        cmd.Parameters.AddWithValue("@JobPostQualifications", ch);
                        cmd.Parameters.AddWithValue("@JobPostMinExp", txtminexp.Text);
                        cmd.Parameters.AddWithValue("@JobPostmaxExp", txtmaxexp.Text);
                        cmd.Parameters.AddWithValue("@JobPostMinSalary", txtminsalary.Text);
                        cmd.Parameters.AddWithValue("@JobPostMaxSalary", txtmaxsalary.Text);
                        cmd.Parameters.AddWithValue("@JobPostVacancy", txtvacancy.Text);
                        cmd.Parameters.AddWithValue("@JobPostComments", txtcomments.Text);
                        cmd.ExecuteNonQuery();
                        con.Close();
                        Response.Redirect("/JobRecruiterMod/JobRecuriterShowJobs.aspx");
                    }

                    else if (btnsubmit.Text == "Update")
                    {

                        con.Open();
                        SqlCommand cmd = new SqlCommand("proc_JobPost", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@action", "UPDATE");
                        cmd.Parameters.AddWithValue("@JobPostId", Request.QueryString["pp"]);
                        cmd.Parameters.AddWithValue("@JobPostJobProfileId", ddljobprofile.SelectedValue);
                        cmd.Parameters.AddWithValue("@JobPostMode", ddljobmode.SelectedValue);
                        cmd.Parameters.AddWithValue("@JobPostGender", rblgender.SelectedValue);
                        cmd.Parameters.AddWithValue("@JobPostQualifications", ch);
                        cmd.Parameters.AddWithValue("@JobPostMinExp", txtminexp.Text);
                        cmd.Parameters.AddWithValue("@JobPostmaxExp", txtmaxexp.Text);
                        cmd.Parameters.AddWithValue("@JobPostMinSalary", txtminsalary.Text);
                        cmd.Parameters.AddWithValue("@JobPostMaxSalary", txtmaxsalary.Text);
                        cmd.Parameters.AddWithValue("@JobPostVacancy", txtvacancy.Text);
                        cmd.Parameters.AddWithValue("@JobPostComments", txtcomments.Text);
                        cmd.ExecuteNonQuery();
                        con.Close();
                        Response.Redirect("/JobRecruiterMod/JobRecuriterShowJobs.aspx");
                    }

                }
                else
                {
                    lblmsg.Text = "minimum EXp should be less then maximum EXP!!";
                }
            }
            else
            {
                lblmsg.Text = "minimum salary should be less then maximum salary!!";
            }
        }
    }
}
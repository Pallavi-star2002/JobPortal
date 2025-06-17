using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Security.Cryptography.X509Certificates;
using System.Security.Policy;


namespace Job_Portal.JobSeekers
{
    public partial class JobSeekersHome : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=LAPTOP-BJGR0B5C\\SQLEXPRESS;initial catalog=dbjobportal ;integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                JobSeekersBind();


                LoadUserPhoto();  // <-- Call it here on first page load
            }
        }

        private void LoadUserPhoto()
        {
            if (Session["JSID"] != null)
            {
                string userId = Session["JSID"].ToString();
                string connectionString = "data source=LAPTOP-BJGR0B5C\\SQLEXPRESS;initial catalog=dbjobportal;integrated security=true";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT JobSeekerImage FROM tblJobSeeker WHERE JobSeekerId = @JobSeekerId";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@JobSeekerId", userId);
                        con.Open();
                        object result = cmd.ExecuteScalar();
                        con.Close();

                        if (result == null || result == DBNull.Value)
                        {
                            // No image in DB, show default
                            imgPhoto.ImageUrl = "~/Jobseekar_Photos/638838104391713556Curly%20Girl%20Hairstyles.jpg";
                            return;
                        }

                        string photoFileName = result.ToString().Trim();

                        if (!string.IsNullOrEmpty(photoFileName))
                        {
                            // Encode filename for URL safety
                            string encodedFileName = Uri.EscapeDataString(photoFileName);
                            string virtualPath = "~/Jobseekar_Photos/" + encodedFileName;
                            string physicalPath = Server.MapPath(virtualPath);

                            if (File.Exists(physicalPath))
                            {
                                imgPhoto.ImageUrl = virtualPath;
                                return;
                            }
                        }
                    }
                }
            }

            // If session null or image not found, show default
            imgPhoto.ImageUrl = "~/Jobseekar_Photos/638838104391713556Curly%20Girl%20Hairstyles.jpg";
        }


        public void JobSeekersBind()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT *FROM tblJobSeeker JOIN tblState ON tblJobSeeker.JobSeekerState = tblState.StateId Where JobSeekerId='" + Session["JSID"] + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            lblname.Text = dt.Rows[0]["JobSeekername"].ToString();
            lblemail.Text = dt.Rows[0]["JobSeekeremail"].ToString();
            lblgender.Text = dt.Rows[0]["JobSeekerGender"].ToString();
            lblpassword.Text = dt.Rows[0]["JobSeekerpassword"].ToString();
            lbljobprofile.Text = dt.Rows[0]["JobSeekerjobprofile"].ToString();
            lblexp.Text = dt.Rows[0]["JobSeekerexp"].ToString();
            lblqualification.Text = dt.Rows[0]["JobSeekerqualification"].ToString();
            lblstate.Text = dt.Rows[0]["statename"].ToString();
            lblcity.Text = dt.Rows[0]["JobSeekercity"].ToString();
            lblecurityquestion.Text = dt.Rows[0]["JobSeekerQuestion"].ToString();
            lblanswer.Text = dt.Rows[0]["JobSeekerAnswer"].ToString();
            lbladdress.Text = dt.Rows[0]["JobSeekerAddress"].ToString();
            lbldateofbirth.Text = dt.Rows[0]["JobSeekerDOB"].ToString();
            lblmobile.Text = dt.Rows[0]["JobSeekerMobile"].ToString();
            lblcomments.Text = dt.Rows[0]["JobSeekercomments"].ToString();
            lblresume.Text = dt.Rows[0]["JobSeekerresume"].ToString();
            string photoFileName = dt.Rows[0]["JobSeekerimage"].ToString();
            imgPhoto.ImageUrl = "~/Jobseeker_Photos/" + photoFileName;
            lbldateinsert.Text = dt.Rows[0]["JobSeekerInsertedDate"].ToString();
            lblstatus.Text = dt.Rows[0]["JobSeekerstatus"].ToString();

        }
    }
}           
      
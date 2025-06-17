using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Job_Portal.AdminMod
{
    public partial class AdminJobPost : System.Web.UI.Page
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
            SqlCommand cmd = new SqlCommand("proc_JobPost", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "JOINJOBPOSTALL");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            gvjobshow.DataSource = dt;
            gvjobshow.DataBind();

        }



    }
}
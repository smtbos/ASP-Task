using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();
    }


    protected void btn_login_Click(object sender, EventArgs e)
    {
        String username = txt_username.Text;
        String password = txt_password.Text;

        cmd = new SqlCommand("select * from student where std_username='" + username + "' and std_password='" + password + "'", con);
        dr = cmd.ExecuteReader();

        if(dr.Read())
        {
            Session["std_id"] = dr.GetInt32(0).ToString();
            Response.Redirect("Default.aspx");
        }
        else
        {
            Response.Redirect("Login.aspx?s=0");
        }
    }
}
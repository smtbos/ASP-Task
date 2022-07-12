using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Register : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();
        bind();
    }

    public void bind()
    {
        cmd = new SqlCommand("SELECT * FROM state", con);
        dr = cmd.ExecuteReader();
        ddl_state.Items.Add(new ListItem("--Select--", ""));
        while (dr.Read())
        {
            ListItem li = new ListItem(dr.GetString(1), dr.GetInt32(0).ToString());
            ddl_state.Items.Add(li);
        }
        dr.Close();

        cmd = new SqlCommand("SELECT * FROM city", con);
        dr = cmd.ExecuteReader();

        ListItem l = new ListItem("--Select--", "");
        l.Attributes.Add("data-state", "0");
        ddl_city.Items.Add(l);
        while (dr.Read())
        {
            ListItem li = new ListItem(dr.GetString(2), dr.GetInt32(0).ToString());
            li.Attributes.Add("data-state", dr.GetInt32(1).ToString());
            ddl_city.Items.Add(li);
        }
        dr.Close();

    }

    public void sp(String t)
    {
        Response.Write(t + "<br>");
    }
    protected void btn_register_Click(object sender, EventArgs e)
    {
        
        String fname = txt_fname.Text;
        String lname = txt_lname.Text;
        String gender = get_gender();
        String contact = txt_contact.Text;
        String email = txt_email.Text;
        String state = ddl_state.SelectedValue;
        String city = ddl_city.SelectedValue;
        String pin = txt_pincode.Text;
        String username = txt_username.Text;
        String password = txt_password.Text;
        cmd = new SqlCommand("INSERT INTO student(std_fname, std_lname, std_gender, std_contact, std_email, std_state, std_city, std_pin, std_username, std_password) VALUES ('" + fname + "', '" + lname + "', '" + gender + "', '" + contact + "', '" + email + "', '" + state + "', '" + city + "', '" + pin + "', '" + username + "', '" + password + "')", con);
        cmd.ExecuteNonQuery();

        Response.Redirect("Login.aspx?s=1");
    }

    protected String get_gender()
    {
        if (rb_male.Checked == true)
        {
            return "Male";
        }
        else
        {
            return "Female";
        }
    }
}
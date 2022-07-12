using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter da;
    SqlDataReader dr;
    public String ed_state = "";
    public String ed_city = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["std_id"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
            con.Open();

            if (!IsPostBack)
            {
                bind();
            }
        }
    }

    public void bind()
    {
        String sid = Session["std_id"].ToString();
        String qry = "select * from student, city, state where std_id = " + sid + " and std_city = city_id and city_state = state_id";

        da = new SqlDataAdapter(qry, con);

        DataSet ds = new DataSet();
        da.Fill(ds);

        gv_details.DataSource = ds;
        gv_details.DataBind();
    }
    protected void gv_details_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gv_details.EditIndex = e.NewEditIndex;
        bind();

        GridViewRow row = gv_details.Rows[gv_details.EditIndex];

        TextBox txt_state = (TextBox)row.FindControl("txt_state");
        TextBox txt_city = (TextBox)row.FindControl("txt_city");

        DropDownList ddl_state = (DropDownList)row.FindControl("ddl_state");
        DropDownList ddl_city = (DropDownList)row.FindControl("ddl_city");

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

        ed_state = ddl_state.ClientID;
        ed_city = ddl_city.ClientID;

        ddl_state.SelectedValue = txt_state.Text;
        ddl_city.SelectedValue = txt_city.Text;

        TextBox txt_gender = (TextBox)row.FindControl("txt_gender");
        if (txt_gender.Text == "Male")
        {
            ((CheckBox)row.FindControl("rb_male")).Checked = true;
        }
        else
        {
            ((CheckBox)row.FindControl("rb_female")).Checked = true;

        }

    }
    protected void gv_details_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = gv_details.Rows[e.RowIndex];

        String sid = Session["std_id"].ToString();
        String fname = ((TextBox)row.FindControl("txt_fname")).Text;
        String lname = ((TextBox)row.FindControl("txt_lname")).Text;
        String gender = "";
        String contact = ((TextBox)row.FindControl("txt_contact")).Text;
        String email = ((TextBox)row.FindControl("txt_email")).Text;
        String state = ((DropDownList)row.FindControl("ddl_state")).SelectedValue;
        String city = ((DropDownList)row.FindControl("ddl_city")).SelectedValue; ;
        String pincode = ((TextBox)row.FindControl("txt_pincode")).Text;

        if (((CheckBox)row.FindControl("rb_male")).Checked == true)
        {
            gender = "Male";
        }
        else
        {
            gender = "Female";
        }

        cmd = new SqlCommand("UPDATE student SET std_fname='" + fname + "', std_lname='" + lname + "', std_gender='" + gender + "', std_contact='" + contact + "', std_email='" + email + "', std_state='" + state + "', std_city='" + city + "', std_pin='" + pincode + "' WHERE std_id=" + sid, con);
        cmd.ExecuteNonQuery();
        Response.Redirect("Default.aspx");

    }
    protected void gv_details_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gv_details.EditIndex = -1;
        bind();
    }
}
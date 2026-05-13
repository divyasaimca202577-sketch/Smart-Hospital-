using MySql.Data.MySqlClient;
using System;
using System.Configuration;

namespace SmartHospitalSystem
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(
        ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString);

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            con.Open();

            MySqlCommand cmd = new MySqlCommand(
            "select * from Admins where Username=@Username and Password=@Password", con);

            cmd.Parameters.AddWithValue("@Username", txtUser.Text);
            cmd.Parameters.AddWithValue("@Password", txtPass.Text);

            MySqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                Session["admin"] = txtUser.Text;
                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                lblMsg.Text = "Invalid Login";
            }

            con.Close();
        }
    }
}
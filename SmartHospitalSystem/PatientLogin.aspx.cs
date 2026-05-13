using MySql.Data.MySqlClient;
using System;
using System.Configuration;

namespace SmartHospitalSystem
{
    public partial class PatientLogin : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(
        ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString);

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            con.Open();

            MySqlCommand cmd = new MySqlCommand(
            "select * from Patients where Email=@Email and Password=@Password", con);

            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);

            MySqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                Session["patient"] = dr["FullName"].ToString();
                Response.Redirect("MyAppointments.aspx");
            }
            else
            {
                lblMsg.Text = "Invalid Login";
            }

            con.Close();
        }
    }
}
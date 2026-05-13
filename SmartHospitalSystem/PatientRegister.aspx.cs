using MySql.Data.MySqlClient;
using System;
using System.Configuration;

namespace SmartHospitalSystem
{
    public partial class PatientRegister : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(
        ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            con.Open();

            MySqlCommand cmd = new MySqlCommand(
            "insert into Patients(FullName,Email,Password,Mobile) values(@FullName,@Email,@Password,@Mobile)", con);

            cmd.Parameters.AddWithValue("@FullName", txtName.Text);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
            cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text);

            cmd.ExecuteNonQuery();

            con.Close();

            lblMsg.Text = "Registration Successful";
        }
    }
}
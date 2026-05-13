using MySql.Data.MySqlClient;
using System;
using System.Configuration;

namespace SmartHospitalSystem
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(
        ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString);

        protected void btnReset_Click(object sender, EventArgs e)
        {
            // Validation

            if (txtEmail.Text == "" ||
               txtPassword.Text == "" ||
               txtConfirmPassword.Text == "")
            {
                lblMsg.Text = "Please fill all fields";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Password match check

            if (txtPassword.Text != txtConfirmPassword.Text)
            {
                lblMsg.Text = "Passwords do not match";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            con.Open();

            // Check Email Exists

            MySqlCommand checkCmd =
            new MySqlCommand(

            "SELECT * FROM Patients WHERE Email=@Email", con);

            checkCmd.Parameters.AddWithValue(
            "@Email", txtEmail.Text);

            MySqlDataReader dr = checkCmd.ExecuteReader();

            if (dr.Read())
            {
                dr.Close();

                // Update Password

                MySqlCommand updateCmd =
                new MySqlCommand(

                "UPDATE Patients SET Password=@Password " +

                "WHERE Email=@Email", con);

                updateCmd.Parameters.AddWithValue(
                "@Password", txtPassword.Text);

                updateCmd.Parameters.AddWithValue(
                "@Email", txtEmail.Text);

                updateCmd.ExecuteNonQuery();

                lblMsg.Text =
                "Password Reset Successfully";

                lblMsg.ForeColor =
                System.Drawing.Color.LightGreen;
            }
            else
            {
                lblMsg.Text =
                "Email not found";

                lblMsg.ForeColor =
                System.Drawing.Color.Red;
            }

            con.Close();
        }
    }
}
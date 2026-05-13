using MySql.Data.MySqlClient;
using System;
using System.Configuration;

namespace SmartHospitalSystem
{
    public partial class BookAppointment : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(
        ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            // Check login session
            if (Session["patient"] == null)
            {
                Response.Redirect("PatientLogin.aspx");
            }

            // IMPORTANT FIX
            // Only set patient name on first page load
            if (!IsPostBack)
            {
                txtPatient.Text = Session["patient"].ToString();

                LoadDoctors();
            }
        }

        // Load doctors into dropdown
        void LoadDoctors()
        {
            con.Open();

            MySqlCommand cmd = new MySqlCommand(
            "select * from Doctors", con);

            MySqlDataReader dr = cmd.ExecuteReader();

            ddlDoctor.DataSource = dr;
            ddlDoctor.DataTextField = "DoctorName";
            ddlDoctor.DataValueField = "DoctorName";
            ddlDoctor.DataBind();

            con.Close();
        }

        // Book appointment
        protected void btnBook_Click(object sender, EventArgs e)
        {
            con.Open();

            MySqlCommand cmd = new MySqlCommand(
            "insert into Appointments(PatientName,DoctorName,AppointmentDate,Status) values(@PatientName,@DoctorName,@AppointmentDate,@Status)", con);

            cmd.Parameters.AddWithValue("@PatientName", txtPatient.Text);

            cmd.Parameters.AddWithValue("@DoctorName",
            ddlDoctor.SelectedValue);

            cmd.Parameters.AddWithValue("@AppointmentDate",
            txtDate.Text);

            cmd.Parameters.AddWithValue("@Status", "Pending");

            cmd.ExecuteNonQuery();

            con.Close();

            lblMsg.Text = "Appointment Booked Successfully";

            // Optional clear date after booking
            txtDate.Text = "";
        }
    }
}
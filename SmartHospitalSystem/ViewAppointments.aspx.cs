using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;

namespace SmartHospitalSystem
{
    public partial class ViewAppointments : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(
        ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAppointments();
            }
        }

        // Load Appointments

        void LoadAppointments(string search = "")
        {
            string query =
            "SELECT * FROM Appointments " +

            "WHERE PatientName LIKE @search " +
            "OR DoctorName LIKE @search";

            MySqlDataAdapter da =
            new MySqlDataAdapter(query, con);

            da.SelectCommand.Parameters.AddWithValue(
            "@search", "%" + search + "%");

            DataTable dt = new DataTable();

            da.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();

            lblCount.Text = dt.Rows.Count.ToString();
        }

        // Search

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            LoadAppointments(txtSearch.Text);
        }

        // Change Appointment Status

        protected void GridView1_RowCommand(object sender,
        System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            string status = "";

            if (e.CommandName == "ConfirmAppointment")
            {
                status = "Confirmed";
            }

            else if (e.CommandName == "PendingAppointment")
            {
                status = "Pending";
            }

            else if (e.CommandName == "CancelAppointment")
            {
                status = "Cancelled";
            }

            con.Open();

            MySqlCommand cmd = new MySqlCommand(

            "UPDATE Appointments SET Status=@Status " +

            "WHERE AppointmentId=@AppointmentId", con);

            cmd.Parameters.AddWithValue("@Status", status);

            cmd.Parameters.AddWithValue("@AppointmentId", id);

            cmd.ExecuteNonQuery();

            con.Close();

            LoadAppointments(txtSearch.Text);
        }
    }
}
using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;

namespace SmartHospitalSystem
{
    public partial class ManageDoctors : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(
        ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDoctors();
            }
        }

        // Load Doctors
        void LoadDoctors()
        {
            MySqlDataAdapter da =
            new MySqlDataAdapter(
            "SELECT * FROM Doctors", con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        // Add Doctor
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            // Validation

            if (txtDoctor.Text == "" ||
                txtSpecialization.Text == "" ||
                txtTime.Text == "")
            {
                lblMsg.Text = "Please fill all fields";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            con.Open();

            MySqlCommand cmd = new MySqlCommand(

            "INSERT INTO Doctors(DoctorName,Specialization,AvailableTime) " +

            "VALUES(@DoctorName,@Specialization,@AvailableTime)", con);

            cmd.Parameters.AddWithValue("@DoctorName",
            txtDoctor.Text);

            cmd.Parameters.AddWithValue("@Specialization",
            txtSpecialization.Text);

            cmd.Parameters.AddWithValue("@AvailableTime",
            txtTime.Text);

            cmd.ExecuteNonQuery();

            con.Close();

            // Success Message

            lblMsg.Text = "Doctor Added Successfully";
            lblMsg.ForeColor = System.Drawing.Color.LightGreen;

            // Clear Fields

            txtDoctor.Text = "";
            txtSpecialization.Text = "";
            txtTime.Text = "";

            // Reload Grid

            LoadDoctors();
        }

        // DELETE DOCTOR

        protected void GridView1_RowDeleting(object sender,
        System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(
            GridView1.DataKeys[e.RowIndex].Value);

            con.Open();

            MySqlCommand cmd = new MySqlCommand(

            "DELETE FROM Doctors WHERE DoctorId=@DoctorId", con);

            cmd.Parameters.AddWithValue("@DoctorId", id);

            cmd.ExecuteNonQuery();

            con.Close();

            lblMsg.Text = "Doctor Removed Successfully";
            lblMsg.ForeColor = System.Drawing.Color.Orange;

            LoadDoctors();
        }
    }
}
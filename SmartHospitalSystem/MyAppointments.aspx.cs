using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;

namespace SmartHospitalSystem
{
    public partial class MyAppointments : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(
        ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            // Check patient login

            if (Session["patient"] == null)
            {
                Response.Redirect("PatientLogin.aspx");
            }

            if (!IsPostBack)
            {
                LoadAppointments();
            }
        }

        void LoadAppointments()
        {
            string patient =
            Session["patient"].ToString();

            MySqlDataAdapter da =
            new MySqlDataAdapter(

            "SELECT * FROM Appointments " +

            "WHERE PatientName=@PatientName", con);

            da.SelectCommand.Parameters.AddWithValue(
            "@PatientName", patient);

            DataTable dt = new DataTable();

            da.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}
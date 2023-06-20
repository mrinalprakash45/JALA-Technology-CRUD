using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Jala_Technologies
{
    public partial class Delete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindEmployeeData();
            }
        }
        protected void BindEmployeeData()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["EmployeesConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT Employee.employee_id, Employee.first_name, Employee.last_name, Employee.email, Employee.mobile_number, Employee.date_of_birth, Employee.gender, Employee.address, Employee.country, Employee.city, EmployeeSkills.skill " +
                               "FROM Employee " +
                               "JOIN EmployeeSkills ON Employee.employee_id = EmployeeSkills.employee_id";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                employeeGridView.DataSource = dt;
                employeeGridView.DataBind();
            }
        }

        protected void EmployeeGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string employeeID = employeeGridView.DataKeys[e.RowIndex].Value.ToString();
            DeleteEmployee(employeeID);
            BindEmployeeData();
        }

        protected void DeleteEmployee(string employeeID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["EmployeesConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                SqlCommand cmdDeleteSkills = new SqlCommand("DELETE FROM EmployeeSkills WHERE employee_id = @EmployeeID", con);
                cmdDeleteSkills.Parameters.AddWithValue("@EmployeeID", employeeID);
                cmdDeleteSkills.ExecuteNonQuery();

                SqlCommand cmdDeleteEmployee = new SqlCommand("DELETE FROM Employee WHERE employee_id = @EmployeeID", con);
                cmdDeleteEmployee.Parameters.AddWithValue("@EmployeeID", employeeID);
                cmdDeleteEmployee.ExecuteNonQuery();
            }
        }

        protected void employeeGridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
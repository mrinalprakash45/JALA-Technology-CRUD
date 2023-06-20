using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Jala_Technologies
{
    public partial class Update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindEmployeeData();
            }
        }
        protected void SearchButton_Click(object sender, EventArgs e)
        {
            BindEmployeeData();
        }
        protected void BindEmployeeData()
        {
            string employeeID = employeeId.Text;

            string query = "SELECT Employee.employee_id, Employee.first_name, Employee.last_name, Employee.email, Employee.mobile_number, Employee.date_of_birth, Employee.gender, Employee.address, Employee.country, Employee.city, EmployeeSkills.skill " +
                               "FROM [Employee] " +
                               "JOIN [EmployeeSkills] ON Employee.employee_id = EmployeeSkills.employee_id " +
                               "WHERE Employee.employee_id = @EmployeeID";

            string connectionString = ConfigurationManager.ConnectionStrings["EmployeesConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@EmployeeID", employeeID);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                employeeGridView.DataSource = dt;
                employeeGridView.DataBind();
            }
        }
        protected void EmployeeGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            employeeGridView.EditIndex = e.NewEditIndex;
            BindEmployeeData();
        }

        protected void EmployeeGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            employeeGridView.EditIndex = -1;
            BindEmployeeData();
        }

        protected void EmployeeGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = employeeGridView.Rows[e.RowIndex];
            string employeeID = employeeGridView.DataKeys[e.RowIndex].Values["employee_id"].ToString();
            string firstName = (row.FindControl("firstNameTextBox") as TextBox).Text;
            string lastName = (row.FindControl("lastNameTextBox") as TextBox).Text;
            string email = (row.FindControl("emailTextBox") as TextBox).Text;
            string mobileNumber = (row.FindControl("mobileNumberTextBox") as TextBox).Text;
            string dob = (row.FindControl("dobTextBox") as TextBox).Text;
            string address = (row.FindControl("addressTextBox") as TextBox).Text;
            string country = (row.FindControl("countryTextBox") as TextBox).Text;
            string city = (row.FindControl("cityTextBox") as TextBox).Text;
            string skill = (row.FindControl("skillTextBox") as TextBox).Text;

            string connectionString = ConfigurationManager.ConnectionStrings["EmployeesConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("UPDATE Employee SET first_name = @FirstName, last_name = @LastName, email = @Email, mobile_number = @MobileNumber, dob = @DOB, address = @Address, country = @Country, city = @City WHERE employee_id = @EmployeeID", con);
                cmd.Parameters.AddWithValue("@FirstName", firstName);
                cmd.Parameters.AddWithValue("@LastName", lastName);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@MobileNumber", mobileNumber);
                cmd.Parameters.AddWithValue("@DOB", dob);
                cmd.Parameters.AddWithValue("@Address", address);
                cmd.Parameters.AddWithValue("@Country", country);
                cmd.Parameters.AddWithValue("@City", city);
                cmd.Parameters.AddWithValue("@EmployeeID", employeeID);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            // Update the skills for the employee
            UpdateEmployeeSkills(employeeID, skill);

            employeeGridView.EditIndex = -1;
            BindEmployeeData();
        }

        protected void UpdateEmployeeSkills(string employeeID, string skill)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["EmployeesConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmdDelete = new SqlCommand("DELETE FROM EmployeeSkills WHERE employee_id = @EmployeeID", con);
                cmdDelete.Parameters.AddWithValue("@EmployeeID", employeeID);
                con.Open();
                cmdDelete.ExecuteNonQuery();

                if (!string.IsNullOrEmpty(skill))
                {
                    SqlCommand cmdInsert = new SqlCommand("INSERT INTO EmployeeSkills (employee_id, skill) VALUES (@EmployeeID, @Skill)", con);
                    cmdInsert.Parameters.AddWithValue("@EmployeeID", employeeID);
                    cmdInsert.Parameters.AddWithValue("@Skill", skill);
                    cmdInsert.ExecuteNonQuery();
                }
            }
        }

    }
}
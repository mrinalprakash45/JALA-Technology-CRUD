using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Jala_Technologies
{
    public partial class Read : System.Web.UI.Page
    {
        public string Conn_String = "Data Source=MRINAL;Initial Catalog=Employees;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set the initial search field type to "text"
                searchField.Attributes["type"] = "text";
            }
        }

        protected void searchOption_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Reset the search field value when the search option changes
            searchField.Text = string.Empty;

            if (searchOption.SelectedValue == "dob")
            {
                searchField.Attributes["type"] = "date";
            }
            else
            {
                searchField.Attributes["type"] = "text";
            }
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            string selectedOption = searchOption.SelectedValue;
            string searchValue = searchField.Text;

            if (selectedOption == "name")
            {
                string query = "SELECT Employee.employee_id, Employee.first_name, Employee.last_name, Employee.email, Employee.mobile_number, Employee.date_of_birth, Employee.gender, Employee.address, Employee.country, Employee.city, EmployeeSkills.skill " +
                               "FROM [Employee] " +
                               "JOIN [EmployeeSkills] ON Employee.employee_id = EmployeeSkills.employee_id " +
                               "WHERE Employee.first_name = @FirstName";

                using (SqlConnection conn = new SqlConnection(Conn_String))
                {
                    using (SqlCommand command = new SqlCommand(query, conn))
                    {
                        command.Parameters.AddWithValue("@FirstName", searchValue);

                        conn.Open();

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                

                                // Bind the DataTable to the GridView
                                GridView1.DataSource = reader;
                                GridView1.DataBind();

                                // Hide the not found message
                                notFoundLabel.Visible = false;
                            }
                            else
                            {
                                // Data not found, display message
                                GridView1.DataSource = null;
                                GridView1.DataBind();

                                // Show the not found message
                                notFoundLabel.Visible = true;
                            }
                        }
                    }
                }
            }
            else if (selectedOption == "number")
            {
                // Search by number logic
                string query = "SELECT Employee.employee_id, Employee.first_name, Employee.last_name, Employee.email, Employee.mobile_number, Employee.date_of_birth, Employee.gender, Employee.address, Employee.country, Employee.city, EmployeeSkills.skill " +
                       "FROM [Employee] " +
                       "JOIN [EmployeeSkills] ON Employee.employee_id = EmployeeSkills.employee_id " +
                       "WHERE Employee.mobile_number = @MobileNumber";

                using (SqlConnection conn = new SqlConnection(Conn_String))
                {
                    using (SqlCommand command = new SqlCommand(query, conn))
                    {
                        command.Parameters.AddWithValue("@MobileNumber", searchValue);

                        conn.Open();

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                // Bind the DataTable to the GridView
                                GridView1.DataSource = reader;
                                GridView1.DataBind();

                                // Hide the not found message
                                notFoundLabel.Visible = false;
                            }
                            else
                            {
                                // Data not found, display message
                                GridView1.DataSource = null;
                                GridView1.DataBind();

                                // Show the not found message
                                notFoundLabel.Visible = true;
                            }
                        }
                    }
                }
            }
            else if (selectedOption == "dob")
            {
                // Search by date of birth logic
                string query = "SELECT Employee.employee_id, Employee.first_name, Employee.last_name, Employee.email, Employee.mobile_number, Employee.date_of_birth, Employee.gender, Employee.address, Employee.country, Employee.city, EmployeeSkills.skill " +
                               "FROM [Employee] " +
                               "JOIN [EmployeeSkills] ON Employee.employee_id = EmployeeSkills.employee_id " +
                               "WHERE CONVERT(date, Employee.date_of_birth) = @DateOfBirth";

                using (SqlConnection conn = new SqlConnection(Conn_String))
                {
                    using (SqlCommand command = new SqlCommand(query, conn))
                    {
                        DateTime dob;
                        if (DateTime.TryParse(searchValue, out dob))
                        {
                            command.Parameters.AddWithValue("@DateOfBirth", dob.Date);

                            conn.Open();

                            using (SqlDataReader reader = command.ExecuteReader())
                            {
                                if (reader.HasRows)
                                {
                                    // Bind the DataTable to the GridView
                                    GridView1.DataSource = reader;
                                    GridView1.DataBind();

                                    // Hide the not found message
                                    notFoundLabel.Visible = false;
                                }
                                else
                                {
                                    // Data not found, display message
                                    GridView1.DataSource = null;
                                    GridView1.DataBind();

                                    // Show the not found message
                                    notFoundLabel.Visible = true;
                                }
                            }
                        }
                        else
                        {
                            // Invalid date format entered by the user
                            // Handle the error or display a message to the user
                        }
                    }
                
                }
            }
        }
    }
}

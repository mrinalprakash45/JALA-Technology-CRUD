using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace Jala_Technologies
{
    public partial class Create : System.Web.UI.Page
    {
        public string Conn_String = "Data Source=MRINAL;Initial Catalog=Employees;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            successMessage.Text = "";
        }
        protected void SaveButton_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(Conn_String);
            conn.Open();

            try
            {
                string emailValue = email.Text.ToString();

                // Check if the record already exists
                string checkQuery = "SELECT COUNT(*) FROM [Employee] WHERE email = @Email";
                SqlCommand checkCommand = new SqlCommand(checkQuery, conn);
                checkCommand.Parameters.AddWithValue("@Email", emailValue);
                int count = (int)checkCommand.ExecuteScalar();

                if (count > 0)
                {
                    // Record already exists
                    successMessage.Text = "Record already exists with the given email address.";
                    return;
                }
                else
                {
                    string q = "Insert into [Employee](first_name, last_name, email, mobile_number, date_of_birth, gender, address, country, city) values('" + firstName.Text.ToString() + "','" + lastName.Text.ToString() + "','" + email.Text.ToString() + "'," + mobileNumber.Text.ToString() + ",'" + dob.Text.ToString() + "','" + gender.SelectedValue + "','" + address.Text.ToString() + "','" + country.SelectedItem.Value + "','" + city.SelectedItem.Value + "')";
                    SqlCommand command = new SqlCommand(q, conn);
                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        // Data inserted successfully
                        int employeeID = GetLastInsertedEmployeeID(conn);
                        foreach (ListItem skillItem in skills.Items)
                        {
                            if (skillItem.Selected)
                            {
                                string insertSkillQuery = "INSERT INTO [EmployeeSkills](employee_id, skill) VALUES (@employeeID, @skill)";
                                SqlCommand insertSkillCommand = new SqlCommand(insertSkillQuery, conn);
                                insertSkillCommand.Parameters.AddWithValue("@employeeID", employeeID);
                                insertSkillCommand.Parameters.AddWithValue("@skill", skillItem.Value);
                                insertSkillCommand.ExecuteNonQuery();
                            }
                        }
                        successMessage.Text = "Data inserted successfully! Employee ID: " + employeeID;
                    }
                    else
                    {
                        // Data insertion failed
                        successMessage.Text = "Failed to insert data!";
                    }
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }
        private int GetLastInsertedEmployeeID(SqlConnection conn)
        {
            int lastInsertedID = 0;

            string query = "SELECT IDENT_CURRENT('Employee')";

            SqlCommand command = new SqlCommand(query, conn);
            object result = command.ExecuteScalar();

            if (result != null && int.TryParse(result.ToString(), out lastInsertedID))
            {
                return lastInsertedID;
            }

            return 0;
        }
        protected void CancelButton_Click(object sender, EventArgs e)
        {
            firstName.Text = string.Empty;
            lastName.Text = string.Empty;
            email.Text = string.Empty;
            mobileNumber.Text = string.Empty;
            dob.Text = string.Empty;
            gender.ClearSelection();
            address.Text = string.Empty;
            country.ClearSelection();
            city.ClearSelection();
            skills.ClearSelection();
        }
    }
}
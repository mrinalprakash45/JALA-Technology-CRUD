using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Jala_Technologies
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Login_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Value;
            string password = txtPassword.Value;

            // Perform authentication logic here (e.g., check against a database, validate credentials)

            // Example validation: hardcoded values for demonstration purposes
            if (username == "training@jalaacademy.com" && password == "jobprogram")
            {
                // Redirect to the home page or a different page upon successful login
                Response.Redirect("Home.aspx");
            }
            else
            {
                // Display an error message or perform other actions for failed login attempts
                // For example:
                // lblErrorMessage.Text = "Invalid username or password";
            }
        }
    }
}
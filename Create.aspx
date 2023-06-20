<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="Jala_Technologies.Create" %>

<!DOCTYPE html>
<html>
<head>
    <title>Employee Registration</title>
    <style>
        .form-group {
            margin-bottom: 10px;
        }
        label {
            display: inline-block;
            width: 150px;
        }
        input[type="text"],
        input[type="email"],
        input[type="tel"],
        textarea {
            width: 300px;
            padding: 5px;
        }
        input[type="radio"],
        input[type="checkbox"] {
            margin-right: 5px;
        }
        .button-container {
            margin: 50px;
            
        }
        .button-container button {
            padding: 5px 10px;
            margin-right: 10px;
        }
        .button-container button.save {
            background-color: green;
            color: white;
            padding: 50px;
        }
        .button-container button.cancel {
            background-color: red;
            color: white;
        }
        #cancelButton
        {
            margin-left: 50px;
        }
    </style>
    <script>
        // Initialize date picker for Date of Birth field
        window.addEventListener("DOMContentLoaded", function () {
            var dobField = document.getElementById('<%= dob.ClientID %>');
            dobField.type = "text";
            dobField.addEventListener("focus", function () {
                this.type = "date";
            });
            dobField.addEventListener("blur", function () {
                if (this.value === "") {
                    this.type = "text";
                }
            });
        });
    </script>
</head>
<body>
    <h1>Employee Registration</h1>
    <form id="registrationForm" runat="server">
        <div class="form-group">
            <label for="firstName">First Name:</label>
            <asp:TextBox ID="firstName" runat="server" Required="true"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="firstName" Display="Dynamic" ErrorMessage="Please enter your First Name" ForeColor="Red">*</asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <label for="lastName">Last Name:</label>
            <asp:TextBox ID="lastName" runat="server" Required="true"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="lastName" Display="Dynamic" ErrorMessage="Please enter your Last Name" ForeColor="Red">*</asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <asp:TextBox ID="email" runat="server" TextMode="Email" Required="true"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="email" Display="Dynamic" ErrorMessage="Please enter the Email" ForeColor="Red">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" Display="Dynamic" ErrorMessage="Please enter a valid email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
        </div>
        <div class="form-group">
            <label for="mobileNumber">Mobile Number:</label>
            <asp:TextBox ID="mobileNumber" runat="server" Required="true"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="mobileNumber" Display="Dynamic" ErrorMessage="Please enter the Mobile Number" ForeColor="Red">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="mobileNumber" Display="Dynamic" ErrorMessage="Please enter a correct Mobile Number" ForeColor="Red" ValidationExpression="^[789]\d{9}$">*</asp:RegularExpressionValidator>
        </div>
        <div class="form-group">
            <label for="dob">Date of Birth:</label>
            <asp:TextBox ID="dob" runat="server" TextMode="Date" Required="true"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="dob" Display="Dynamic" ErrorMessage="Please enter the Date of Birth" ForeColor="Red">*</asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <label>Gender:</label>
            <asp:RadioButtonList ID="gender" runat="server" Required="true">
                <asp:ListItem Text="Male" Value="male"></asp:ListItem>
                <asp:ListItem Text="Female" Value="female"></asp:ListItem>
            </asp:RadioButtonList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="gender" Display="Dynamic" ErrorMessage="Please select a Gender" ForeColor="Red">*</asp:RequiredFieldValidator>
        </div>
<div class="form-group">
    <label for="address">Address:</label>
    <asp:TextBox ID="address" runat="server" TextMode="MultiLine" Required="true"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="address" Display="Dynamic" ErrorMessage="Please enter the Address" ForeColor="Red">*</asp:RequiredFieldValidator>
</div>
<div class="form-group">
    <label for="country">Country:</label>
    <asp:DropDownList ID="country" runat="server" Required="true">
        <asp:ListItem Text="Select Country" Value=""></asp:ListItem>
        <asp:ListItem Text="Country 1" Value="country1"></asp:ListItem>
        <asp:ListItem Text="Country 2" Value="country2"></asp:ListItem>
        <asp:ListItem Text="Country 3" Value="country3"></asp:ListItem>
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="country" Display="Dynamic" ErrorMessage="Please select a Country" ForeColor="Red">*</asp:RequiredFieldValidator>
</div>
<div class="form-group">
    <label for="city">City:</label>
    <asp:DropDownList ID="city" runat="server" Required="true">
        <asp:ListItem Text="Select City" Value=""></asp:ListItem>
        <asp:ListItem Text="City 1" Value="city1"></asp:ListItem>
        <asp:ListItem Text="City 2" Value="city2"></asp:ListItem>
        <asp:ListItem Text="City 3" Value="city3"></asp:ListItem>
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="city" Display="Dynamic" ErrorMessage="Please select a City" ForeColor="Red">*</asp:RequiredFieldValidator>
</div>
<div class="form-group">
    <label>Other City:</label>
    <asp:CheckBox ID="otherCity" runat="server" />
</div>
<div class="form-group">
    <label>Skills:</label>
    <asp:CheckBoxList ID="skills" runat="server" Required="true">
        <asp:ListItem Text="AWS" Value="AWS"></asp:ListItem>
        <asp:ListItem Text="DevOps" Value="DevOps"></asp:ListItem>
        <asp:ListItem Text="Full Stack Developer" Value="Full Stack Developer"></asp:ListItem>
        <asp:ListItem Text="Middleware" Value="Middleware"></asp:ListItem>
        <asp:ListItem Text="QA-Automation" Value="QA-Automation"></asp:ListItem>
        <asp:ListItem Text="Web Services" Value="Web Services"></asp:ListItem>
    </asp:CheckBoxList>
    
</div>
        <div class="button-container">
            <asp:Button ID="saveButton" runat="server" Text="Save" CssClass="save" OnClick="SaveButton_Click" BackColor="Green" BorderColor="Black" Font-Bold="True" ForeColor="White" Height="36px" Width="150px" />
            <asp:Button ID="cancelButton" runat="server" Text="Cancel" CssClass="cancel" OnClick="CancelButton_Click" BackColor="Red" BorderColor="Black" Font-Bold="True" ForeColor="White" Height="36px" Width="150px" />
        </div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" BackColor="Silver" Font-Size="Larger" ForeColor="Red" />
        <div class="form-group">
            <asp:Label ID="successMessage" runat="server" CssClass="success-message" />
        </div>
    </form>
</body>
</html>

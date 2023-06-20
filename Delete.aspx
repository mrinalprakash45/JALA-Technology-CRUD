<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Delete.aspx.cs" Inherits="Jala_Technologies.Delete" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:GridView ID="employeeGridView" runat="server" AutoGenerateColumns="False" OnRowDeleting="EmployeeGridView_RowDeleting" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" OnSelectedIndexChanged="employeeGridView_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
    <Columns>
        <asp:BoundField DataField="employee_id" HeaderText="Employee ID" ReadOnly="true" />
        <asp:BoundField DataField="first_name" HeaderText="First Name" />
        <asp:BoundField DataField="last_name" HeaderText="Last Name" />
        <asp:BoundField DataField="email" HeaderText="Email" />
        <asp:BoundField DataField="mobile_number" HeaderText="Mobile Number" />
        <asp:BoundField DataField="date_of_birth" HeaderText="Date of Birth" />
        <asp:BoundField DataField="gender" HeaderText="Gender" />
        <asp:BoundField DataField="address" HeaderText="Address" />
        <asp:BoundField DataField="country" HeaderText="Country" />
        <asp:BoundField DataField="city" HeaderText="City" />
        <asp:BoundField DataField="skill" HeaderText="Skill" />
        <asp:CommandField ShowDeleteButton="true" ButtonType="Button" />
    </Columns>
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <SortedAscendingCellStyle BackColor="#FAFAE7" />
        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
        <SortedDescendingCellStyle BackColor="#E1DB9C" />
        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
</asp:GridView>
    </form>
</body>
</html>

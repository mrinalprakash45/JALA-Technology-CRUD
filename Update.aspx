<%@ Page Language="C#" CodeBehind="Update.aspx.cs" Inherits="Jala_Technologies.Update" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h2>Update Employee Details</h2>
    <form id="form1" runat="server">
        <div class="form-group">
            <label for="employeeId">Employee ID:</label>
            <asp:TextBox ID="employeeId" runat="server"></asp:TextBox>
            <asp:Button ID="searchButton" runat="server" Text="Search" OnClick="SearchButton_Click" CssClass="search" />
        </div>
        <hr />
        <asp:GridView ID="employeeGridView" runat="server" AutoGenerateColumns="False" OnRowEditing="EmployeeGridView_RowEditing" OnRowCancelingEdit="EmployeeGridView_RowCancelingEdit" OnRowUpdating="EmployeeGridView_RowUpdating" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
            <Columns>
                <asp:BoundField DataField="employee_id" HeaderText="Employee ID" ReadOnly="true" />
                <asp:TemplateField HeaderText="First Name">
                    <ItemTemplate>
                        <asp:Label ID="firstNameLabel" runat="server" Text='<%# Eval("first_name") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="firstNameTextBox" runat="server" Text='<%# Bind("first_name") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                    <asp:TemplateField HeaderText="Last Name">
                    <ItemTemplate>
                        <asp:Label ID="lastNameLabel" runat="server" Text='<%# Eval("last_name") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="lastNameTextBox" runat="server" Text='<%# Bind("last_name") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email">
                    <ItemTemplate>
                        <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Mobile Number">
                    <ItemTemplate>
                        <asp:Label ID="mobileNumberLabel" runat="server" Text='<%# Eval("mobile_number") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="mobileNumberTextBox" runat="server" Text='<%# Bind("mobile_number") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date of Birth">
                    <ItemTemplate>
                        <asp:Label ID="dobLabel" runat="server" Text='<%# Eval("date_of_birth") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="dobTextBox" runat="server" Text='<%# Bind("date_of_birth") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address">
                    <ItemTemplate>
                        <asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Country">
                    <ItemTemplate>
                        <asp:Label ID="countryLabel" runat="server" Text='<%# Eval("country") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="countryTextBox" runat="server" Text='<%# Bind("country") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="City">
                    <ItemTemplate>
                        <asp:Label ID="cityLabel" runat="server" Text='<%# Eval("city") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="cityTextBox" runat="server" Text='<%# Bind("city") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Skill">
                    <ItemTemplate>
                        <asp:Label ID="skillLabel" runat="server" Text='<%# Eval("skill") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="skillTextBox" runat="server" Text='<%# Bind("skill") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                
                <asp:CommandField ShowEditButton="true" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
    </form>
</body>
</html>
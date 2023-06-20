<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Read.aspx.cs" Inherits="Jala_Technologies.Read" %>

<!DOCTYPE html>
<html>
<head>
    <title>Search Page</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#searchOption").change(function () {
                var selectedOption = $(this).val();
                if (selectedOption === "dob") {
                    $("#searchField").attr("type", "date");
                } else {
                    $("#searchField").attr("type", "text");
                }
            });
        });
    </script>
    <style type="text/css">
        .auto-style1 {
            width: 150px;
        }
        table
        {
            margin: 100px;
        }
    </style>
</head>
<body>
    <form id="searchForm" runat="server">
        <div>
            <label for="searchOption">Search Option:</label>
            <asp:DropDownList ID="searchOption" runat="server" AutoPostBack="true" OnSelectedIndexChanged="searchOption_SelectedIndexChanged">
                <asp:ListItem Text="Search by Name" Value="name"></asp:ListItem>
                <asp:ListItem Text="Search by Number" Value="number"></asp:ListItem>
                <asp:ListItem Text="Search by Date of Birth" Value="dob"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div>
            <label for="searchField">Search Value:</label>
            <asp:TextBox ID="searchField" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="searchButton" runat="server" Text="Search" OnClick="searchButton_Click" BackColor="Black" BorderColor="White" Font-Bold="True" ForeColor="White" />
        </div>
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="employee_id">
                <Columns>
                    <asp:BoundField DataField="employee_id" HeaderText="employee_id" InsertVisible="False" ReadOnly="True" SortExpression="employee_id" />
                    <asp:BoundField DataField="first_name" HeaderText="first_name" SortExpression="first_name" />
                    <asp:BoundField DataField="last_name" HeaderText="last_name" SortExpression="last_name" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:BoundField DataField="mobile_number" HeaderText="mobile_number" SortExpression="mobile_number" />
                    <asp:BoundField DataField="date_of_birth" HeaderText="date_of_birth" SortExpression="date_of_birth" />
                    <asp:BoundField DataField="gender" HeaderText="gender" SortExpression="gender" />
                    <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                    <asp:BoundField DataField="country" HeaderText="country" SortExpression="country" />
                    <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                    <asp:BoundField DataField="skill" HeaderText="skill" SortExpression="skill" />
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
            </asp:GridView>
            
        </div>
        <asp:Label ID="notFoundLabel" runat="server" Text="The data you entered is not found." Visible="False" Font-Bold="True" Font-Size="XX-Large" ForeColor="Red"></asp:Label>
    </form>
</body>
</html>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCustomer.aspx.cs" Inherits="lkhassignment.ViewCustomer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="cust_id" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="cust_id" HeaderText="cust_id" ReadOnly="True" SortExpression="cust_id" />
                <asp:BoundField DataField="cust_username" HeaderText="cust_username" SortExpression="cust_username" />
                <asp:BoundField DataField="cust_password" HeaderText="cust_password" SortExpression="cust_password" />
                <asp:BoundField DataField="cust_full_name" HeaderText="cust_full_name" SortExpression="cust_full_name" />
                <asp:BoundField DataField="cust_tel_no" HeaderText="cust_tel_no" SortExpression="cust_tel_no" />
                <asp:BoundField DataField="cust_email" HeaderText="cust_email" SortExpression="cust_email" />
                <asp:BoundField DataField="cust_address" HeaderText="cust_address" SortExpression="cust_address" />
                <asp:BoundField DataField="cust_join_date" HeaderText="cust_join_date" SortExpression="cust_join_date" />
                <asp:BoundField DataField="cust_dob" HeaderText="cust_dob" SortExpression="cust_dob" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [customer]"></asp:SqlDataSource>
    
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/DriverMenu.aspx">Back To Menu</asp:HyperLink>
    
    </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewDriver.aspx.cs" Inherits="lkhassignment.ViewDriver" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="driver_id" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="driver_id" HeaderText="driver_id" ReadOnly="True" SortExpression="driver_id" />
                <asp:BoundField DataField="driver_username" HeaderText="driver_username" SortExpression="driver_username" />
                <asp:BoundField DataField="driver_password" HeaderText="driver_password" SortExpression="driver_password" />
                <asp:BoundField DataField="driver_full_name" HeaderText="driver_full_name" SortExpression="driver_full_name" />
                <asp:BoundField DataField="driver_ic_no" HeaderText="driver_ic_no" SortExpression="driver_ic_no" />
                <asp:BoundField DataField="driver_tel_no" HeaderText="driver_tel_no" SortExpression="driver_tel_no" />
                <asp:BoundField DataField="driver_email" HeaderText="driver_email" SortExpression="driver_email" />
                <asp:BoundField DataField="driver_address" HeaderText="driver_address" SortExpression="driver_address" />
                <asp:BoundField DataField="driver_hire_date" HeaderText="driver_hire_date" SortExpression="driver_hire_date" />
                <asp:BoundField DataField="driver_dob" HeaderText="driver_dob" SortExpression="driver_dob" />
                <asp:BoundField DataField="driver_role" HeaderText="driver_role" SortExpression="driver_role" />
                <asp:BoundField DataField="driver_taxi_company" HeaderText="driver_taxi_company" SortExpression="driver_taxi_company" />
                <asp:BoundField DataField="driver_license_expiry_date" HeaderText="driver_license_expiry_date" SortExpression="driver_license_expiry_date" />
                <asp:BoundField DataField="driver_taxi_plate_no" HeaderText="driver_taxi_plate_no" SortExpression="driver_taxi_plate_no" />
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
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [driver]"></asp:SqlDataSource>
    
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/DriverMenu.aspx">Back To Menu</asp:HyperLink>
    
    </div>
    </form>
</body>
</html>

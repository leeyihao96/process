<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerReport.aspx.cs" Inherits="lkhassignment.CustomerReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 140px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Report<br />
        <br />
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">Type Of Report</td>
                <td>:<asp:DropDownList ID="ddlType" runat="server" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                    <asp:ListItem>Please select your report type.</asp:ListItem>
                    <asp:ListItem Value="Customer Monthly Summary Report">Customer Monthly Summary Report</asp:ListItem>
                    <asp:ListItem>Customer Yearly Summary Report</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lblLabelYear" runat="server" Text="Year" Visible="False"></asp:Label>
                </td>
                <td><asp:DropDownList ID="ddlYear" runat="server" DataSourceID="SqlDataSource2" DataTextField="Column1" DataValueField="Column1" Visible="False">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT YEAR(cust_join_date) from customer order by YEAR(cust_join_date) ASC;"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lblLabelMonth" runat="server" Text="Month" Visible="False"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlMonth" runat="server" DataSourceID="SqlDataSource1" DataTextField="Column1" DataValueField="Column1" Visible="False">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT MONTH(cust_join_date) from customer order by MONTH(cust_join_date) ASC"></asp:SqlDataSource>
                </td>
            </tr>
            </table>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnView" runat="server" OnClick="btnView_Click" Text="View" />
        <asp:Label ID="lblStatus" runat="server"></asp:Label>
        <br />
        <asp:Label ID="lblTitle" runat="server" Font-Size="XX-Large"></asp:Label>
        <asp:Label ID="lblYearOrMonth" runat="server" Font-Size="XX-Large"></asp:Label>
        <asp:GridView ID="GridView2" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
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
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/DriverMenu.aspx">Back To Menu</asp:HyperLink>
        <br />
    
    </div>
    </form>
</body>
</html>

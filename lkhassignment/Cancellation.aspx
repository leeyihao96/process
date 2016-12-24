<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cancellation.aspx.cs" Inherits="lkhassignment.Cancellation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style5 {
            width: 366px;
        }
        .auto-style6 {
            width: 442px;
        }
        .auto-style7 {
            width: 442px;
            height: 23px;
        }
        .auto-style8 {
            width: 409px;
        }
        .auto-style9 {
            width: 409px;
            height: 23px;
        }
        .auto-style10 {
            width: 693px;
            height: 23px;
        }
    </style>
</head>
<body style="height: 595px">
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" style="font-weight: 700; text-decoration: underline; font-size: large" Text="My Reservation Record"></asp:Label>
        <br />
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanging="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
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
        <br />
    
        <asp:Label ID="Label2" runat="server" style="font-weight: 700; text-decoration: underline; font-size: large" Text="Selected Record"></asp:Label>
        <br />
        <table style="width: 699px">
            <tr>
                <td class="auto-style8">Reservation ID&nbsp;&nbsp; :</td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBox1" runat="server" Enabled="False"></asp:TextBox>
                </td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td class="auto-style8">Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :</td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBox2" runat="server" Enabled="False"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">Time&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :</td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBox3" runat="server" Enabled="False"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">Pickup Location&nbsp;:</td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBox4" runat="server" Enabled="False"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9">Destination&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :</td>
                <td class="auto-style7">
                    <asp:TextBox ID="TextBox5" runat="server" Enabled="False"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    &nbsp;</td>

            </tr>
            <tr>
                <td class="auto-style8"></td>
                <td class="auto-style6">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Cancel Reservation" Width="132px" />
                </td>
                <td class="auto-style5">
                    &nbsp;</td>
                
            </tr>
        </table>
        <table>
            <tr>
                <td class="auto-style10">
                    &nbsp;</td>
            </tr>
        </table>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [locationName] FROM [Location]"></asp:SqlDataSource>
        <br />
    
    </div>
    </form>
</body>
</html>
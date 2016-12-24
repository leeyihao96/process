<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReservationRecord.aspx.cs" Inherits="lkhassignment.ReservationRecord" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 142px;
        }
        .auto-style2 {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" style="font-weight: 700; text-decoration: underline; font-size: large" Text="Reservation Record"></asp:Label>
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
    <div>
    
        <br />
        <span class="auto-style2">Save favourite Location</span><table style="width: 377px">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label2" runat="server" Text="Location"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True"></asp:TextBox>
                </td>    
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label3" runat="server" Text="Destination"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" ReadOnly="True"></asp:TextBox>
                </td>  
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Button ID="Button2" runat="server" Text="View Favourite" OnClick="Button2_Click" />
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Save" />
                </td> 
            </tr>
        </table>
        <hr />
        <asp:Label ID="Label4" runat="server"></asp:Label>
        <br />
&nbsp;</div>
    </form>
</body>
</html>


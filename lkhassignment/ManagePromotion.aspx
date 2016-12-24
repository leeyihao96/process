<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManagePromotion.aspx.cs" Inherits="lkhassignment.ManagePromotion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
     <div> 
    
       
        <table style="width:100%;">
            <tr>
                <td>Promotion ID</td>
                <td>:</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="promotionId" DataValueField="promotionId" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    </asp:DropDownList>
&nbsp;
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Promotion]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>Promotion Description</td>
                <td>:</td>
                <td>
                    <textarea id="txtDesc" cols="20" name="S1" rows="2" runat="server"></textarea></td>
            </tr>
            <tr>
                <td>Promotion Date From</td>
                <td>:</td>
                <td>
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px" OnSelectionChanged="Calendar1_SelectionChanged">
                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                        <NextPrevStyle VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#808080" />
                        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                        <SelectorStyle BackColor="#CCCCCC" />
                        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <WeekendDayStyle BackColor="#FFFFCC" />
                    </asp:Calendar>
                &nbsp;<asp:TextBox ID="txtCalendar1" runat="server"></asp:TextBox>
&nbsp;</td>
            </tr>
            <tr>
                <td>Promotion Date Until</td>
                <td>:</td>
                <td>
                    <asp:Calendar ID="Calendar2" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px" OnSelectionChanged="Calendar2_SelectionChanged">
                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                        <NextPrevStyle VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#808080" />
                        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                        <SelectorStyle BackColor="#CCCCCC" />
                        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <WeekendDayStyle BackColor="#FFFFCC" />
                    </asp:Calendar>
                &nbsp;<asp:TextBox ID="txtCalendar2" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Promotion Status</td>
                <td>:</td>
                <td>
                    <asp:TextBox ID="txtStatus" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
   

        
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Create" />
&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Update" OnClick="Button2_Click" />
&nbsp;&nbsp;
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Clear" />
&nbsp;
        <asp:Label ID="lblMssg" runat="server"></asp:Label>
   &nbsp;</div>
    </form>
</body>
</html>

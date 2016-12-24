<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Email.aspx.cs" Inherits="lkhassignment.Email" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
    <div>
    
&nbsp;&nbsp;&nbsp;
            
    &nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddlPaymentID" runat="server" DataSourceID="SqlDataSource1" DataTextField="paymentId" DataValueField="paymentId">
        </asp:DropDownList>
&nbsp;
    
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Send Email" />
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server"></asp:Label>
    
    &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Payment]"></asp:SqlDataSource>
&nbsp;<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <br />
            
    <br />
        <asp:Label ID="lblTime" runat="server"></asp:Label>
            <br />
<asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="1000">
        </asp:Timer>
<br />
        </ContentTemplate>
        </asp:UpdatePanel>
    
    </div>
    </form>
</body>
</html>

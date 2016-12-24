<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="lkhassignment.menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1>Welcome to EzCab</h1>
        <p>&nbsp;</p>
        <p>
            <asp:Button ID="Button1" runat="server" Height="45px" OnClick="Button1_Click" style="margin-top: 0px" Text="Customer Login or Sign up" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Height="42px" OnClick="Button2_Click" Text="Staff Login" />
        </p>
        </div>
    </form>
</body>
</html>

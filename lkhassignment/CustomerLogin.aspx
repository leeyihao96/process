<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerLogin.aspx.cs" Inherits="lkhassignment.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 80px;
        }
        .auto-style2 {
            width: 906px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Customer
    
        Login<br />
        <br />
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">Username&nbsp;&nbsp;&nbsp; </td>
                <td class="auto-style2">
                    :<asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername" ErrorMessage="Please enter your username." ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Password&nbsp;&nbsp;&nbsp; </td>
                <td class="auto-style2">
                    :<asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please enter your password." ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
        <asp:Label ID="lblDisplay" runat="server"></asp:Label>
        <br />
        Need to create a new account?
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/CustomerSignUp.aspx">Sign up</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/CustomerForgotPassword.aspx">I forgot my password</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Menu.aspx">Go Back to Menu</asp:HyperLink>
    
    </div>
    </form>
</body>
</html>

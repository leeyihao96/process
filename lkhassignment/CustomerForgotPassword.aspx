<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerForgotPassword.aspx.cs" Inherits="lkhassignment.forgotpassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 95px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Forgot Password<br />
        Please enter your username and email address.<br />
        Username:&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername" ErrorMessage="Please enter your username." ForeColor="#FF3300"></asp:RequiredFieldValidator>
        <br />
        Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter valid email." ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/CustomerLogin.aspx">Back To Menu</asp:HyperLink>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSubmit" runat="server" OnClick="Button1_Click" style="height: 26px" Text="Submit" />
        <br />
        <br />
        <asp:Label ID="lblDisplay" runat="server"></asp:Label>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnNext" runat="server" Text="Next" OnClick="btnNext_Click" Visible="False" />
    
    
        
            <br />
    
    <div id="hide" style="visibility:hidden">
        
            <table style="width:100%;">
                <tr>
                    <td class="auto-style1">To</td>
                    <td>:<asp:TextBox ID="txtTo" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">From</td>
                    <td>:<asp:TextBox ID="txtFrom" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Subject</td>
                    <td>:<asp:TextBox ID="txtSubject" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Body</td>
                    <td>:<asp:TextBox ID="txtBody" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Username2</td>
                    <td>:<asp:TextBox ID="txtUsername2" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Password</td>
                    <td>:<asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table></div>
        </div>
    </form>
</body>
</html>

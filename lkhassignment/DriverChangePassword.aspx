<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DriverChangePassword.aspx.cs" Inherits="lkhassignment.DriverChangePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 160px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Driver
    
        Change Password<br />
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">Username</td>
                <td>:<asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUsername" ErrorMessage="Please enter username." ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Old Password</td>
                <td>:<asp:TextBox ID="txtOld" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOld" ErrorMessage="Please enter your old password" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">New Password</td>
                <td>:<asp:TextBox ID="txtNew" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtOld" ControlToValidate="txtNew" ErrorMessage="Please enter different password with Old Password." Operator="NotEqual" ForeColor="#FF3300"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Confirm New Password</td>
                <td>:<asp:TextBox ID="txtConfirm" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txtNew" ControlToValidate="txtConfirm" ErrorMessage="Please enter the same entry as New Password." ForeColor="#FF3300"></asp:CompareValidator>
                </td>
            </tr>
        </table>
    
    </div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/DriverMenu.aspx">Back To Menu</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnChangePassword" runat="server" OnClick="btnChangePassword_Click" Text="Change Password" />
        <asp:Label ID="lblDisplay" runat="server"></asp:Label>
        <asp:Label ID="lblCount" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>

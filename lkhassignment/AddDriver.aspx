<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddDriver.aspx.cs" Inherits="lkhassignment.AddDriver" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 143px;
        }
    </style>
        <script src="jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="jquery.dynDateTime.min.js" type="text/javascript"></script>
<script src="calendar-en.min.js" type="text/javascript"></script>
<link href="calendar-blue.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=txtDOB.ClientID %>").dynDateTime({
            showsTime: false,
            ifFormat: "%Y/%m/%d %H:%M",
            daFormat: "%l;%M %p, %e %m, %Y",
            align: "BR",
            electric: false,
            singleClick: false,
            displayArea: ".siblings('.dtcDisplayArea')",
            button: ".next()"
        });
    });
</script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=txtExpiry.ClientID %>").dynDateTime({
            showsTime: false,
            ifFormat: "%Y/%m/%d %H:%M",
            daFormat: "%l;%M %p, %e %m, %Y",
            align: "BR",
            electric: false,
            singleClick: false,
            displayArea: ".siblings('.dtcDisplayArea')",
            button: ".next()"
        });
    });
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Add Driver<asp:Label ID="lblDriverId" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblDriverRole" runat="server" Visible="False"></asp:Label>
        <br />
        <br />
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">Username</td>
                <td>:<asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtUsername" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Password</td>
                <td>:<asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtPassword" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Retype Password</td>
                <td>:<asp:TextBox ID="txtRetypePassword" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" ControlToCompare="txtPassword" ControlToValidate="txtRetypePassword" ForeColor="#FF3300"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Full Name</td>
                <td>:<asp:TextBox ID="txtFullName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtFullName" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">IC Number</td>
                <td>:<asp:TextBox ID="txtICNo" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtICNo" ErrorMessage="RequiredFieldValidator" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtICNo" ErrorMessage="Please enter digit number only." ForeColor="#FF3300" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Contact Number</td>
                <td>:<asp:TextBox ID="txtTelNo" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtICNo" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtTelNo" ErrorMessage="Please enter digit number only." ForeColor="#FF3300" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Email</td>
                <td>:<asp:TextBox ID="txtEmail" runat="server" MaxLength="30"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter valid email address." ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Home Addres</td>
                <td>:<asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtAddress" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Taxi Company</td>
                <td>:<asp:TextBox ID="txtTaxiCompany" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtTaxiCompany" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Taxi Plate Number</td>
                <td>:<asp:TextBox ID="txtTaxiPlateNumber" runat="server" MaxLength="7"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtTaxiPlateNumber" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtTaxiPlateNumber" ErrorMessage="Please enter alphabet and numeric only." ForeColor="#FF3300" ValidationExpression="^[a-zA-Z][a-zA-Z0-9]*$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Date Of Birth</td>
                <td>
                    <asp:TextBox ID="txtDOB" runat="server" OnTextChanged="txtDOB_TextChanged"></asp:TextBox>
                    <img src="calender.png" />
                    <asp:Label ID="lblDOB" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">License Expiry Date</td>
                <td>
                    <asp:TextBox ID="txtExpiry" runat="server" OnTextChanged="txtExpiry_TextChanged"></asp:TextBox>
                    <img src="calender.png" />
                    <asp:Label ID="lblExpiry" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            </table>
    
    </div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/DriverMenu.aspx">Back To Menu</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnAddDriver" runat="server" OnClick="btnAddDriver_Click" Text="Add Driver" />
        <asp:Label ID="lblInsertStatus" runat="server"></asp:Label>
    </form>
</body>
</html>

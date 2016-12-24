<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateDriver.aspx.cs" Inherits="lkhassignment.UpdateDriver" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 137px;
        }
        .auto-style2 {
            width: 575px;
        }
    </style>
    <script src="jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="jquery.dynDateTime.min.js" type="text/javascript"></script>
<script src="calendar-en.min.js" type="text/javascript"></script>
<link href="calendar-blue.css" rel="stylesheet" type="text/css" />
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
<body style="width: 1321px; height: 460px">
    <form id="form1" runat="server">
    <div>
    
        Update Driver<br />
        <br />
        <table style="width: 59%;">
            <tr>
                <td class="auto-style1">Driver Username</td>
                <td class="auto-style2">:<asp:DropDownList ID="ddlUsername" runat="server" DataSourceID="SqlDataSource1" DataTextField="driver_username" DataValueField="driver_username">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [driver_username] FROM [driver]"></asp:SqlDataSource>
                    <asp:Button ID="btnRetrieve" runat="server" Text="Retrieve" OnClick="btnRetrieve_Click" />
                    <asp:Label ID="lblDisplay" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Full Name</td>
                <td class="auto-style2">:<asp:TextBox ID="txtFullName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Contact Number</td>
                <td class="auto-style2">:<asp:TextBox ID="txtTelNo" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Email Address</td>
                <td class="auto-style2">:<asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Home Address</td>
                <td class="auto-style2">:<asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Taxi Company</td>
                <td class="auto-style2">:<asp:TextBox ID="txtTaxiCompany" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Taxi Plate Number</td>
                <td class="auto-style2">:<asp:TextBox ID="txtPlateNo" runat="server" MaxLength="7"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">License Expiry Date</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtExpiry" runat="server" OnTextChanged="txtExpiry_TextChanged"></asp:TextBox>
                    <img src="calender.png" />
                    <asp:Label ID="lblExpiry" runat="server" EnableTheming="True"></asp:Label>
                </td>
            </tr>
        </table>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/DriverMenu.aspx">Back To Menu</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
    
    </div>
    </form>
</body>
</html>

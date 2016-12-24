<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentForm.aspx.cs" Inherits="lkhassignment.PaymentForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
        }
        .auto-style2 {
            width: 209px;
        }
        .auto-style3 {
            height: 23px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Payment Form" style="font-weight: 700; text-decoration: underline; font-size: xx-large"></asp:Label>
        <table style="width: 642px;border: solid" >
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Text="Pick up location :"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblloc" runat="server"></asp:Label>
                </td>
                
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label3" runat="server" Text="Destination :"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lbldest" runat="server"></asp:Label>
                </td>
                
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label4" runat="server" Text="Distances :"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblkm" runat="server"></asp:Label>
                    km</td>
                
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label5" runat="server" Text="Estimated Charges :"></asp:Label>
                    </td>
                <td class="auto-style3">
                    RM
                    <asp:Label ID="lblamount" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button2" runat="server" Text="Cancel" OnClick="Button2_Click" />
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Proceed to Payment" OnClick="Button1_Click" />
                </td>
            </tr>
        </table>
    <div class="auto-style1">
    
    </div>
    </form>
</body>
</html>

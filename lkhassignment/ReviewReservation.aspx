<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReviewReservation.aspx.cs" Inherits="lkhassignment.ReviewReservation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style5 {
            width: 4323px;
        }

        .auto-style6 {
            width: 143px;
        }

        .auto-style9 {
            width: 1901px;
        }

        .auto-style10 {
            width: 239px;
        }

        .auto-style11 {
            width: 796px;
        }

        .auto-style12 {
            width: 949px;
        }
    </style>
</head>
<body style="height: 100%;">
    <form id="form1" runat="server">
        <div>
            <h1>Review & Submit Reservation</h1>
            Please review reservation information before submitting.
            <br />
            <br />
            <table style="width: 100%;">
                <tr>
                    <td>
                        Selected Payment
                        <br />
                        <br />
                        <asp:Label ID="lblCardType" runat="server" Text=""></asp:Label>
                        :(<asp:Label ID="lblCard" runat="server" Text=""></asp:Label>
                        )<asp:Label ID="lblCardNumber" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            </table>
        <table style="width: 100%; height: 100%">
            <tr>
                <td>
                    <table style="width: 100%; height: 100%">
                        <tr>
                            <td class="auto-style5">Navigation</td>
                            <td class="auto-style9">&nbsp;</td>
                            <td class="auto-style10">Total (RM)</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">
                                <asp:Label ID="lblNavigation" runat="server" Text=""></asp:Label></td>
                            <td class="auto-style9">&nbsp;</td>
                            <td style="text-align: right" class="auto-style10">
                                <asp:Label ID="lblAmount" runat="server" Text=""></asp:Label></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table style="width: 100%; height: 100%">
                        <tr>
                            <td class="auto-style11">&nbsp;</td>
                            <td>
                                <table style="width: 100%; height: 100%">
                                    <tr>
                                        <td class="auto-style12">Subtotal:</td>
                                        <td style="text-align: right" class="auto-style6">
                                            <asp:Label ID="lblSubTotal" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
<%--                                    <tr>
                                        <td class="auto-style12">Tax:</td>
                                        <td style="text-align: right" class="auto-style6">

                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style12">Company Fee:</td>
                                        <td style="text-align: right" class="auto-style6">

                                        </td>
                                    </tr>--%>
                                    <tr>
                                        <td class="auto-style12">Total:</td>
                                        <td style="text-align: right" class="auto-style6">
                                            <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
            <br />
            <br />
            <div id="confirm" style="text-align:right">
                <asp:Button ID="btnConfirm" runat="server" Text="Confirm Payment" OnClick="btnConfirm_Click" />
            </div>
        </div>
    </form>
</body>
</html>

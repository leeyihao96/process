<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentMethod.aspx.cs" Inherits="lkhassignment.PaymentMethod" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .textBox {
            height: 50px;
        }

        .DropDown {
            height: 100%;
        }

        .auto-style2 {
            width: 2px;
        }

        .auto-style3 {
            width: 250px;
        }

        .auto-style4 {
            width: 600px;
        }

        .auto-style7 {
            width: 600px;
        }

        .auto-style15 {
            width: 400px;
        }

        .auto-style17 {
            width: 500px;
        }

        .auto-style18 {
            width: 500px;
            height: 25px;
        }

        .auto-style19 {
            width: 2px;
            height: 25px;
        }

        .auto-style20 {
            width: 400px;
            height: 25px;
        }
    </style>



    <script type="text/javascript">
        function cardValidation_ClientValidate(sender, e) {
            var patt = /^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|3[47][0-9]{13})$/g;
            var card = $("input[name*='txtCardNumber']").val();
            var isValid = patt.test(card);

            if (isValid) {
                Label1.Text = "credit card number is valid.";
            }
            else {
                Label1.Text = "credit card number is invalid.";
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Payment</h1>
            <asp:HiddenField ID="RESERVATION_ID" runat="server" />
            <asp:HiddenField ID="RESERVATION_DATE" runat="server" />
            <asp:HiddenField ID="RESERVATION_TIME" runat="server" />
            <asp:HiddenField ID="RESERVATION_BEGINNING" runat="server" />
            <asp:HiddenField ID="RESERVATION_DESTINATION" runat="server" />
            <asp:HiddenField ID="RESERVATION_AMOUNT" runat="server" />
            <br />
            <br />
            <table style="width: 100%;">
                <tr>
                    <td>Payment ID :
                        <asp:Label ID="lblPaymentId" runat="server" Text=""></asp:Label>
                    </td>
                    <td style="text-align: right">Date :
                        <asp:Label ID="lblPaymentDate" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <table>
                <tr>
                    <td>Reservation ID :</td>       
                    <td><asp:Label ID="lblReservationId" runat="server" Text=""></asp:Label></td>             
                </tr>
                <tr>
                    <td>Reservation Date : </td>
                    <td><asp:Label ID="lblReservationDate" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>Reservation Time : </td>
                    <td><asp:Label ID="lblReservationTime" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>Reservation Pick Up Address : </td>
                    <td><asp:Label ID="lblPickUpAddress" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>Reservation Destination : </td>
                    <td><asp:Label ID="lblDestination" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>Reservation Amount : </td>
                    <td><asp:Label ID="lblAmount" runat="server" Text=""></asp:Label></td>
                </tr>
            </table>
            <br />
            <br />
            Please choose a payment method
            <br />
            <br />
            <table>
                <tr>
                    <td>
                        <asp:RadioButton ID="rbPayPal" runat="server" Enabled="false" Text="PayPal" AutoPostBack="true" OnCheckedChanged="rbPayPal_CheckedChanged"/>
                        &nbsp;
                        <asp:LinkButton ID="lbPaypalWork" runat="server" PostBackUrl="https://www.paypal.com/webapps/mpp/paypal-popup">

                            <asp:Image ID="imgPayPal" runat="server" ImageUrl="~/pp_cc_mark_37x23.jpg" />What is PayPal?
                        </asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RadioButton ID="rbCard" runat="server" AutoPostBack="true" Text="Credit Card / Debit Card" OnCheckedChanged="rbCard_CheckedChanged" />&nbsp;
                        <asp:Image ID="imgMasterCard" runat="server" ImageUrl="~/mastercard-badge.png" Width="66" Height="40" />&nbsp;<asp:Image ID="imgVisa" runat="server" ImageUrl="~/visa-badge.png" Width="66" Height="40" />&nbsp;<asp:Image ID="migAmEx" runat="server" ImageUrl="~/ae-badge.png" Width="66" Height="40" /></td>
                </tr>
            </table>
            <br />
            <br />
            <asp:Panel ID="panelCard" runat="server" Visible="false" CssClass="card">
                <table>
                    <tr>
                        <td class="auto-style4">
                            <table>
                                <tr>
                                    <td class="auto-style17">Card Type</td>
                                    <td class="auto-style2">:</td>
                                    <td class="auto-style15">
                                        <asp:RadioButtonList ID="rblCardType" runat="server" RepeatDirection="Horizontal" AutoPostBack="True">
                                            <asp:ListItem Value="Credit">Credit&nbsp;&nbsp;&nbsp;</asp:ListItem>
                                            <asp:ListItem>Debit</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                    <td class="auto-style15">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" colspan="4">Full name on card</td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" colspan="4">
                                        <asp:TextBox Font-Size="16" CssClass="textBox" ID="txtCardName" runat="server" Width="200px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <asp:RequiredFieldValidator ID="rfvEmptyCardName" runat="server" ErrorMessage="The card name is required." ControlToValidate="txtCardName" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style18">Card Number</td>
                                    <td class="auto-style19"></td>
                                    <td class="auto-style20">Card Security Code</td>
                                    <td class="auto-style20"></td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">
                                        <asp:TextBox Font-Size="16" CssClass="textBox" ID="txtCardNumber" runat="server" Width="200px" OnTextChanged="txtCardNumber_TextChanged"></asp:TextBox>
                                        <asp:Image ID="imgCard" runat="server" Width="66" Height="40" />
                                    </td>
                                    <td class="auto-style2"></td>
                                    <td class="auto-style15">
                                        <asp:TextBox Font-Size="16" CssClass="textBox" ID="txtSecurityCode" runat="server" Width="45px"></asp:TextBox>
                                    </td>
                                    <td class="auto-style15">
                                        <asp:LinkButton ID="LinkButton1" runat="server">What is this ?</asp:LinkButton></td>
                                </tr>
                                <tr>
                                    <td class="auto-style17">
                                        <asp:RequiredFieldValidator CssClass="card" ID="rfvEmptyCardNumber" runat="server" ErrorMessage="The card number is required." ControlToValidate="txtCardNumber" ForeColor="Red">*</asp:RequiredFieldValidator>
                                        <asp:CustomValidator ID="rcvCardNumber" runat="server" ErrorMessage="The card number is invalid" ForeColor="Red" ControlToValidate="txtCardNumber" ClientValidationFunction="cardValidation_ClientValidate" OnServerValidate="cardValidation_ServerValidate">*</asp:CustomValidator>
                                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                    </td>
                                    <td class="auto-style2">&nbsp;</td>
                                    <td class="auto-style15">
                                        <asp:RequiredFieldValidator CssClass="card" ID="rfvEmptySecurityCode" runat="server" ErrorMessage="The card security code is required." ControlToValidate="txtSecurityCode" ForeColor="Red">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revSecurityCode" runat="server" ErrorMessage="The card security code must be a number." ControlToValidate="txtSecurityCode" ValidationExpression="\d{3,4}" ForeColor="Red">*</asp:RegularExpressionValidator>
                                    </td>
                                    <td class="auto-style15">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" colspan="4">Expiration Date:
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style17" colspan="4">
                                        <asp:DropDownList Font-Size="18" CssClass="DropDown" ID="ddlCardExpDateMonth" runat="server"></asp:DropDownList>
                                        &nbsp;
                                        /
                                        &nbsp;
                                        <asp:DropDownList Font-Size="18" CssClass="DropDown" ID="ddlCardExpDateYear" runat="server"></asp:DropDownList></td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <asp:Label ID="lblExpiryDate" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td class="auto-style7">
                            <asp:Panel ID="panelError" runat="server">
                                <table>
                                    <tr>
                                        <td>Below are the following error.</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:ValidationSummary ID="vsCardError" runat="server" CssClass="card" DisplayMode="List" ForeColor="Red" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <br />
            <br />
            <br />
            <div style="text-align: center">
                <asp:Button ID="btnProceed" runat="server" Text="Proceed" OnClick="btnProceed_Click" Visible="false" />&nbsp;
                <div id="myContainer" runat="server" visible="true"></div>
                <asp:Button ID="btnBack" runat="server" Text="Back to Reservation" />
            </div>
        </div>
    </form>
                <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
            <script src="https://code.jquery.com/jquery.js"></script>

            <!-- Include all compiled plugins (below), or include individual files as needed -->
            <script src="js/bootstrap.min.js"></script>

            <script>
                window.paypalCheckoutReady = function () {
                    paypal.checkout.setup('lzxorochi@gmail.com', {
                        container: 'myContainer',
                        environment: 'sandbox'
                    });
                }
            </script>

            <script async src="//www.paypalobjects.com/api/checkout.js"></script>
</body>
</html>

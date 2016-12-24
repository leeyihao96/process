<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentCanceled.aspx.cs" Inherits="lkhassignment.PaymentCanceled" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            text-align:center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Payment Cancelled
        <br />
            <br />
            You are Redirected to <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Home Page</asp:LinkButton>.
        </div>
    </form>
</body>
</html>

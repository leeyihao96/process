<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentSuccessful.aspx.cs" Inherits="lkhassignment.PaymentSuccessful" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Confirmation</h1>
        <br />
        <br />
        Thank you! You reservation is done by the following details.
        <br />
        <br />
        <asp:DetailsView ID="DVPayment" runat="server" Height="50px" Width="125px" DataSourceID="SqlDataSource1" AutoGenerateRows="False">
            <Fields>
                <asp:BoundField DataField="reservationId" HeaderText="reservationId" SortExpression="reservationId" />
                <asp:BoundField DataField="driver_taxi_plate_no" HeaderText="driver_taxi_plate_no" SortExpression="driver_taxi_plate_no" />
                <asp:BoundField DataField="pickupAddress" HeaderText="pickupAddress" SortExpression="pickupAddress" />
                <asp:BoundField DataField="Destination" HeaderText="Destination" SortExpression="Destination" />
                <asp:BoundField DataField="ScheduleId" HeaderText="ScheduleId" SortExpression="ScheduleId" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT driver.driver_taxi_plate_no, driver.driver_name, Reservation. [pickupAddress], Reservation.[Destination] FROM Payment INNER JOIN Reservation ON Payment.reservationId = Reservation.ReservationId INNER JOIN Schedule ON Reservation.ScheduleId = Schedule.scheduleId INNER JOIN driver ON Schedule.driverId = driver.driver_id WHERE (Payment.paymentId = @paymentId)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="paymentId" SessionField="paymentId" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        T<br />
        <br />
        An reservation receipt has generated and sent to <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label> . Please check your email for the payment details.
    </div>
    </form>
</body>
</html>

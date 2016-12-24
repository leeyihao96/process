<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reservation.aspx.cs" Inherits="lkhassignment.Reservation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 23px;
        }
        .auto-style2 {
            height: 23px;
            width: 158px;
        }
        .auto-style3 {
            width: 158px;
        }
        .auto-style4 {
            width: 325px;
        }
        .auto-style5 {
            width: 198px;
        }
        .auto-style6 {
            height: 26px;
        }
        .auto-style7 {
            width: 158px;
            height: 192px;
        }
        .auto-style8 {
            height: 192px;
        }
    </style>
</head>
<body style="height: 749px">
    <form id="form1" runat="server">
    <div style="height: 732px">
    <asp:Label ID="Label5" runat="server" Text="Taxi Reservation Form" style="font-weight: 700; text-decoration: underline; font-size: x-large"></asp:Label>
        <table style="width: 814px" >
            
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label1" runat="server" Text="Pick up Location :"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:Label ID="Label2" runat="server" Text="Destination :"></asp:Label>
                </td>
                
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:DropDownList ID="ddlloc" runat="server" DataSourceID="SqlDataSource1" DataTextField="locationName" DataValueField="locationName">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList ID="ddldest" runat="server" DataSourceID="SqlDataSource1" DataTextField="locationName" DataValueField="locationName">
                    </asp:DropDownList>
                </td>
                
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="Label3" runat="server" Text="Pick up Date :"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:Calendar ID="Calendar1" runat="server" ondayrender="Calendar2_DayRender" SelectedDate="<%# DateTime.Today %>" ></asp:Calendar>
                </td>
                
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Pick up Time :"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                    </asp:DropDownList>:
                    <asp:DropDownList ID="DropDownList2" runat="server">
                        <asp:ListItem>00</asp:ListItem>
                        <asp:ListItem>01</asp:ListItem>
                        <asp:ListItem>02</asp:ListItem>
                        <asp:ListItem>03</asp:ListItem>
                        <asp:ListItem>04</asp:ListItem>
                        <asp:ListItem>05</asp:ListItem>
                        <asp:ListItem>06</asp:ListItem>
                        <asp:ListItem>07</asp:ListItem>
                        <asp:ListItem>08</asp:ListItem>
                        <asp:ListItem>09</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                        <asp:ListItem>13</asp:ListItem>
                        <asp:ListItem>14</asp:ListItem>
                        <asp:ListItem>15</asp:ListItem>
                        <asp:ListItem>16</asp:ListItem>
                        <asp:ListItem>17</asp:ListItem>
                        <asp:ListItem>18</asp:ListItem>
                        <asp:ListItem>19</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>21</asp:ListItem>
                        <asp:ListItem>22</asp:ListItem>
                        <asp:ListItem>23</asp:ListItem>
                        <asp:ListItem>24</asp:ListItem>
                        <asp:ListItem>25</asp:ListItem>
                        <asp:ListItem>26</asp:ListItem>
                        <asp:ListItem>27</asp:ListItem>
                        <asp:ListItem>28</asp:ListItem>
                        <asp:ListItem>29</asp:ListItem>
                        <asp:ListItem>30</asp:ListItem>
                        <asp:ListItem>31</asp:ListItem>
                        <asp:ListItem>32</asp:ListItem>
                        <asp:ListItem>33</asp:ListItem>
                        <asp:ListItem>34</asp:ListItem>
                        <asp:ListItem>35</asp:ListItem>
                        <asp:ListItem>36</asp:ListItem>
                        <asp:ListItem>37</asp:ListItem>
                        <asp:ListItem>38</asp:ListItem>
                        <asp:ListItem>39</asp:ListItem>
                        <asp:ListItem>40</asp:ListItem>
                        <asp:ListItem>41</asp:ListItem>
                        <asp:ListItem>42</asp:ListItem>
                        <asp:ListItem>43</asp:ListItem>
                        <asp:ListItem>44</asp:ListItem>
                        <asp:ListItem>45</asp:ListItem>
                        <asp:ListItem>46</asp:ListItem>
                        <asp:ListItem>47</asp:ListItem>
                        <asp:ListItem>48</asp:ListItem>
                        <asp:ListItem>49</asp:ListItem>
                        <asp:ListItem>50</asp:ListItem>
                        <asp:ListItem>51</asp:ListItem>
                        <asp:ListItem>52</asp:ListItem>
                        <asp:ListItem>53</asp:ListItem>
                        <asp:ListItem>54</asp:ListItem>
                        <asp:ListItem>55</asp:ListItem>
                        <asp:ListItem>56</asp:ListItem>
                        <asp:ListItem>57</asp:ListItem>
                        <asp:ListItem>58</asp:ListItem>
                        <asp:ListItem>59</asp:ListItem>
                    </asp:DropDownList>
<asp:DropDownList ID="ddlAmPm" runat="server">
   <asp:ListItem Selected="True">AM</asp:ListItem>
   <asp:ListItem Selected="False">PM</asp:ListItem>
</asp:DropDownList>
                </td>
                
            </tr>
            <tr>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [locationName] FROM [Location]"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Confirm" OnClick="Button1_Click" />
                </td>
            </tr>
        </table>

        <asp:Label ID="lblError" runat="server" style="color: #FF0000"></asp:Label>

        <hr />
  <div id="div1" runat="server" visible="false">      
<asp:Label ID="Label15" runat="server" style="text-decoration: underline; font-size: large; font-weight: 700;" Text="Select a taxi"></asp:Label></div>
        <table style="width: 816px; height: 276px;" >
            <tr>
                <td class="auto-style4">
                    <div id="divTaxiLists" runat="server" visible="false">
                        
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Width="270px" OnSelectedIndexChanging="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
</div>
                </td>
                
                <td>
                    <div id="divTaxiLists2" runat="server" visible="false">
                    <asp:Label ID="Label6" runat="server" Text="Your selection" style="text-decoration: underline; font-weight: 700"></asp:Label>
                    <table style="width: 437px">
                        <tr>
                            <td class="auto-style5">
                                <asp:Label ID="Label7" runat="server" Text="Pick up Location"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>   
                        </tr>
                        <tr>
                            <td class="auto-style5">
                                <asp:Label ID="Label8" runat="server" Text="Destination"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox2" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>  
                        </tr>
                        <tr>
                            <td class="auto-style5">
                                <asp:Label ID="Label9" runat="server" Text="Pick up Date"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox3" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>   
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label10" runat="server" Text="Pick up Time"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox4" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>

                                <asp:Label ID="Label14" runat="server" Text="ID"></asp:Label>

                            </td>
                            <td>
                                <asp:TextBox ID="TextBox8" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style6">
                                <asp:Label ID="Label11" runat="server" Text="Plate Number"></asp:Label>
                            </td>
                            <td class="auto-style6">
                                <asp:TextBox ID="TextBox5" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label12" runat="server" Text="Status"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox6" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label13" runat="server" Text="Taxi Company"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox7" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Button ID="Button2" runat="server" Text="Confirm" OnClick="Button2_Click" />
                            </td>
                        </tr>
                        
                    </table>
                        </div>
                </td>
                
            </tr>
           
        </table>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Schedule.scheduleId AS ID, Driver.driver_taxi_plate_no AS PlateNum, Schedule.status AS Status, driver.driver_taxi_company AS Company  FROM driver INNER JOIN Schedule ON driver.driver_id = Schedule.driverId WHERE (Schedule.status = 'Available')"></asp:SqlDataSource>
        </div>
    
    </form>
    </body>
</html>
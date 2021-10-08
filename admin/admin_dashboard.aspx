

<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="admin_dashboard.aspx.cs" Inherits="admin_dashboard" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="page-container" style="margin-top:0px">
        <div>
            <div class="mother-grid-inner">
                <!--inner block start here-->
                <div class="inner-block">
                    <!--market updates updates-->
                    <div class="market-updates">
                        <div class="col-md-4 market-update-gd">
                            <div class="market-update-block clr-block-1">
                                <div class="col-md-8 market-update-left">
                                    <h3>
                                        <asp:Label ID="lbluser" runat="server" Text=""></asp:Label>
                                    </h3>
                                    <h4>Registered User</h4>
                                   <%-- <p>Other hand, we denounce</p>--%>
                                </div>
                                <div class="col-md-4 market-update-right">
                                    <i class="fa fa-file-text-o"></i>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="col-md-4 market-update-gd">
                            <div class="market-update-block clr-block-2">
                                <div class="col-md-8 market-update-left">
                                    <h3>
                                        <asp:Label ID="lbldown" runat="server" Text=""></asp:Label></h3>
                                    <h4>Question Paper and Notes Downloaded</h4>
                                   <%-- <p>Other hand, we denounce</p>--%>
                                </div>
                                <div class="col-md-4 market-update-right">
                                    <i class="glyphicon glyphicon-download-alt"></i>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="col-md-4 market-update-gd">
                            <div class="market-update-block clr-block-3">
                                <div class="col-md-8 market-update-left">
                                    <h3>
                                        <asp:Label ID="lblcontact" runat="server" Text=""></asp:Label>
                                    </h3>
                                    <h4>Contacts</h4>
                                   <%-- <p>Other hand, we denounce</p>--%>
                                </div>
                                <div class="col-md-4 market-update-right">
                                    <i class="fa fa-envelope-o"></i>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                       <%-- <div class="clearfix"></div>--%>
                    </div>
                    <!--market updates end here-->
                    <!--mainpage chit-chating-->
                  

                 
                    <div class="chit-chat-layer1" >
                                
                                <div class="col-md-6 chit-chat-layer1-left" style="overflow:auto;width:50%;height:385px">
                                    <div class="work-progres" style="width:600px">

                                        <div class="chit-chat-heading">
                                            Tutors Registered
                                        </div>
                                        <div class="table-responsive">
                                             <asp:Repeater ID="rpttutor" runat="server" >
                           <ItemTemplate>
                                            <table class="table table-hover" style="background-color:#FFEBCD	">
                                                <thead>
                                                    <tr>
                                                      <th style="background-color:#E9967A	"></th>
                                                        <th style="background-color:#E9967A	">State</th>
                                                        <th style="background-color:#E9967A	">City</th>

                                                        <th style="background-color:#E9967A	">Qualification</th>
                                                        <th style="background-color:#E9967A	">No. of Teachers</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>1</td>
                                                        <td>
                                                            <asp:Label ID="State" runat="server" Text='<%# Eval("tutor_state") %>' /></td>
                                                        <td>
                                                            <asp:Label ID="City" runat="server" Text='<%# Eval("tutor_city") %>' /></td>

                                                        <td>
                                                            <asp:Label ID="Qualification" runat="server" Text='<%# Eval("tutor_qualification") %>' /></td>
                                                        <td>
                                                            <asp:Label ID="No_tutors" runat="server" Text='<%# Eval("no_tutors") %>' /></td>
                                                    </tr>

                                                </tbody>
                                            </table>
                                </ItemTemplate>
                    </asp:Repeater>
                                            <div style="margin-left:auto;background-color:#E9967A">
                                                <asp:Label ID="lbltotal" runat="server" Text="" Font-Bold="true"></asp:Label>
                                            </div>
                                        </div>
                                   
                                         </div>
                                </div>
                           <%-- <div class="clearfix"></div>--%>
                           </div>
                   
                         
                    <div class="col-md-6 chit-chat-layer1-rit" style="overflow:auto;width:50%;height:385px">
                        <div class="geo-chart">
                            <section id="charts1" class="charts">
                                <div class="wrapper-flex"  style="overflow:auto;width:600px;height:350px">

                      
                        
                               
                <asp:Chart ID="Chart1" runat="server"  BackColor="0, 192, 192" BackGradientStyle="LeftRight" BackImageTransparentColor="White" BackSecondaryColor="White" Width="500px" >
                    <Series>
                        <asp:Series Name="Series1"  MarkerBorderColor="Yellow"  ShadowColor="ActiveCaptionText" ShadowOffset="5" XValueMember="Year1" YValueMembers="Download1" LegendText="Board Papers"></asp:Series>
                         <asp:Series Name="Series2"  MarkerBorderColor="Green" ShadowColor="ActiveCaptionText" ShadowOffset="5" XValueMember="Year2" YValueMembers="Download2" LegendText="Mock Papers"></asp:Series>
                        <asp:Series Name="Series3"  MarkerBorderColor="Wheat" ShadowColor="ActiveCaptionText" ShadowOffset="5" XValueMember="Year3" YValueMembers="Download3" LegendText="Notes"></asp:Series>
                    </Series>
                    <Legends>
                        <asp:Legend Title="Downloads">
                        </asp:Legend>
                    </Legends>
                    <Titles>
                        <asp:Title Docking="Bottom" Text="Download Report Yearly"  >

                        </asp:Title>
                    </Titles>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1" BackColor="Teal" BackGradientStyle="DiagonalLeft" BorderColor="White" BorderDashStyle="Solid" BorderWidth="4" ShadowColor="Black" ShadowOffset="12">
                             <AxisY InterlacedColor="White" IsLabelAutoFit="False" LineDashStyle="NotSet">
                            <MajorGrid LineColor="White" />
                            <MinorGrid LineColor="White" />
                            <LabelStyle Font="Arial Narrow, 9.75pt, style=Bold" />
                        </AxisY>
                        <AxisX IsLabelAutoFit="False" LineColor="White">
                            <MajorGrid LineColor="White" />
                            <LabelStyle Font="Arial Narrow, 9.75pt, style=Bold" />
                        </AxisX>
                        <Position Height="94" Width="94" X="3" Y="3" />
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
        </div>
                                  </section>
                    </div>
 <%-- <div class="clearfix"></div>--%>

         </div>
                <!--main page chit chating end here-->
                <!--main page chart start here-->
              <%--  <div class="main-page-charts">
                    <div class="main-page-chart-layer1">
                        <div class="col-md-6 chart-layer1-left">
                            <div class="glocy-chart">
                                <div class="span-2c">
                                    <h3 class="tlt">Sales Analytics</h3>
                                    <canvas id="bar" height="300" width="400" style="width: 400px; height: 300px;"></canvas>
                                    <script>
                                        var barChartData = {
                                            labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "jul"],
                                            datasets: [
                                                {
                                                    fillColor: "#FC8213",
                                                    data: [65, 59, 90, 81, 56, 55, 40]
                                                },
                                                {
                                                    fillColor: "#337AB7",
                                                    data: [28, 48, 40, 19, 96, 27, 100]
                                                }
                                            ]

                                        };
                                        new Chart(document.getElementById("bar").getContext("2d")).Bar(barChartData);

                                    </script>
                                </div>
                            </div>
                        </div>--%>

                        <%--<div class="col-md-6 chart-layer1-right">
                            <div class="user-marorm">
                                <div class="malorum-top">
                                </div>
                                <div class="malorm-bottom">
                                    <span class="malorum-pro"></span>
                                    <h4>unde omnis iste</h4>
                                    <h2>Melorum</h2>
                                    <p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising.</p>
                                    <ul class="malorum-icons">
                                        <li><a href="#"><i class="fa fa-facebook"></i>
                                            <div class="tooltip"><span>Facebook</span></div>
                                        </a></li>
                                        <li><a href="#"><i class="fa fa-twitter"></i>
                                            <div class="tooltip"><span>Twitter</span></div>
                                        </a></li>
                                     <li><a href="#"><i class="fa fa-google-plus"></i>
                                            <div class="tooltip"><span>Google</span></div>
                                        </a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>--%>
                      <%--  <asp:Calendar ID="Calendar1" runat="server" OnVisibleMonthChanged="Calendar1_VisibleMonthChanged"></asp:Calendar>
                      --%>
                   <%--  <div class="clearfix"></div>--%>
                        <div class="chit-chat-layer1" style="overflow:auto;width:50%;height:385px" >
                                
                                <div class="col-md-6 chit-chat-layer1-left" style="overflow:auto;width:600px;height:385px">
                                    <div class="work-progres" style="width:600px">
                                        
                                        <div class="chit-chat-heading">
                                            Feedbacks
                                        </div>

               <asp:GridView ID="gvr_feed" runat="server" AutoGenerateColumns="False"  OnPageIndexChanging="gvr_feed_PageIndexChanging" style="text-align:center;" CellPadding="4" HeaderStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Height="50px" AllowPaging="True" PageSize="4"  >
                       <HeaderStyle ForeColor="black" Font-Bold="True" BackColor=" 	#CD5C5C	" HorizontalAlign="Center" BorderWidth="3px"></HeaderStyle> 
                                            <Columns>
                                                <asp:BoundField DataField="user_email" HeaderText="Email" SortExpression="user_email" ItemStyle-HorizontalAlign="center" ItemStyle-Width="20%"  ItemStyle-BackColor="#FFE4C4"/>
                                                <asp:BoundField DataField="user_msg" HeaderText="Message" SortExpression="user_msg" ItemStyle-HorizontalAlign="center" ItemStyle-Width="20%" ItemStyle-BackColor="#FFE4C4"/>
                                            </Columns>
                                        </asp:GridView>
                                      
                                       
                                      </div>
                                    </div>
                            <div class="clearfix"></div>
                            </div>

                    <div class="chit-chat-layer1"style="overflow:auto;width:600px;margin-left:600px;margin-top:-600px">
                       <div class="col-md-6 chit-chat-layer1-rit" style="overflow:auto;width:600px;height:385px">
                           <div class="wrapper-flex"  style="overflow:auto;width:600px;height:350px">     
                                     <div class="chit-chat-heading">
                                            Contacts
                                        </div>
                                    <asp:GridView ID="gvr_contact" runat="server" AutoGenerateColumns="False"  OnPageIndexChanging="gvr_contact_PageIndexChanging" style="text-align:center;" CellPadding="4" HeaderStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Height="50px" AllowPaging="True" PageSize="4"  Height="100%" >
                       <HeaderStyle ForeColor="black" Font-Bold="True" BackColor="#808080" HorizontalAlign="Center" BorderWidth="3px"></HeaderStyle> 
                                        <Columns>
                                            <asp:BoundField DataField="user_name" HeaderText="Name" SortExpression="user_name" ItemStyle-HorizontalAlign="center" ItemStyle-Width="20%"   ItemStyle-Height="50px" ItemStyle-BackColor="#FFB6C1"/>
                                            <asp:BoundField DataField="user_email" HeaderText="Email" SortExpression="user_email" ItemStyle-HorizontalAlign="center" ItemStyle-Width="20%"  ItemStyle-Height="50px" ItemStyle-BackColor="#FFB6C1" />
                                        <asp:BoundField DataField="user_message" HeaderText="Message" SortExpression="user_message" ItemStyle-HorizontalAlign="center" ItemStyle-Width="20% "  ItemStyle-Height="50px" ItemStyle-BackColor="#FFB6C1" />
                                        </Columns>
                                    </asp:GridView>
                                   
                                    </div>
                               <div class="clearfix"></div>
                           </div>
                        </div>
                        </div>

    </div>
                    
                </div>
                <!--main page chart layer2-->
               <%-- <div class="chart-layer-2">

                    <div class="col-md-6 chart-layer2-right">
                        <div class="prograc-blocks">
                            <!--Progress bars-->
                            <div class="home-progres-main">
                                <h3>Total Sales</h3>
                            </div>
                            <div class='bar_group'>
                                <div class='bar_group__bar thin' label='Rating' show_values='true' tooltip='true' value='343'></div>
                                <div class='bar_group__bar thin' label='Quality' show_values='true' tooltip='true' value='235'></div>
                                <div class='bar_group__bar thin' label='Amount' show_values='true' tooltip='true' value='550'></div>
                                <div class='bar_group__bar thin' label='Farming' show_values='true' tooltip='true' value='456'></div>
                            </div>
                            <script src="js/bars.js"></script>

                            <!--//Progress bars-->
                        </div>
                    </div>
                    <div class="col-md-6 chart-layer2-left">
                        <div class="content-main revenue">
                            <h3>Total Revenue</h3>
                            <canvas id="radar" height="300" width="300" style="width: 300px; height: 300px;"></canvas>
                            <script>
                                var radarChartData = {
                                    labels: ["", "", "", "", "", "", ""],
                                    datasets: [
                                        {
                                            fillColor: "rgba(104, 174, 0, 0.83)",
                                            strokeColor: "#68ae00",
                                            pointColor: "#68ae00",
                                            pointStrokeColor: "#fff",
                                            data: [65, 59, 90, 81, 56, 55, 40]
                                        },
                                        {
                                            fillColor: "rgba(236, 133, 38, 0.82)",
                                            strokeColor: "#ec8526",
                                            pointColor: "#ec8526",
                                            pointStrokeColor: "#fff",
                                            data: [28, 48, 40, 19, 96, 27, 100]
                                        }
                                    ]

                                };
                                new Chart(document.getElementById("radar").getContext("2d")).Radar(radarChartData);
                            </script>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>--%>

                <!--climate start here-->
               <%-- <div class="climate">
                    <div class="col-md-4 climate-grids">
                        <div class="climate-grid1">
                            <div class="climate-gd1-top">
                                <div class="col-md-6 climate-gd1top-left">
                                    <h4>Aprill 6-wed</h4>
                                    <h3>12:30<span class="timein-pms">PM</span></h3>
                                    <p>Humidity:</p>
                                    <p>Sunset:</p>
                                    <p>Sunrise:</p>
                                </div>
                                <div class="col-md-6 climate-gd1top-right">
                                    <span class="clime-icon">
                                        <figure class="icons">
                                            <canvas id="partly-cloudy-day" width="64" height="64"></canvas>
                                        </figure>
                                        <script>
                                            var icons = new Skycons({ "color": "#fff" }),
                                                 list = [
                                                   "clear-night", "partly-cloudy-day",
                                                   "partly-cloudy-night", "cloudy", "rain", "sleet", "snow", "wind",
                                                   "fog"
                                                 ],
                                                 i;

                                            for (i = list.length; i--;)
                                                icons.set(list[i], list[i]);

                                            icons.play();
                                        </script>
                                    </span>
                                    <p>88%</p>
                                    <p>5:40PM</p>
                                    <p>6:30AM</p>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="climate-gd1-bottom">
                                <div class="col-md-4 cloudy1">
                                    <h4>Hongkong</h4>
                                    <figure class="icons">
                                        <canvas id="sleet" width="58" height="58"></canvas>
                                    </figure>
                                    <script>
                                        var icons = new Skycons({ "color": "#fff" }),
                                             list = [
                                               "clear-night", "clear-day",
                                               "partly-cloudy-night", "cloudy", "rain", "sleet", "snow", "wind",
                                               "fog"
                                             ],
                                             i;

                                        for (i = list.length; i--;)
                                            icons.set(list[i], list[i]);

                                        icons.play();
                                    </script>
                                    <h3>10c</h3>
                                </div>
                                <div class="col-md-4 cloudy1">
                                    <h4>UK</h4>
                                    <figure class="icons">
                                        <canvas id="cloudy" width="58" height="58"></canvas>
                                    </figure>
                                    <script>
                                        var icons = new Skycons({ "color": "#fff" }),
                                             list = [
                                               "clear-night", "cloudy",
                                               "partly-cloudy-night", "cloudy", "rain", "sleet", "snow", "wind",
                                               "fog"
                                             ],
                                             i;

                                        for (i = list.length; i--;)
                                            icons.set(list[i], list[i]);

                                        icons.play();
                                    </script>
                                    <h3>6c</h3>
                                </div>
                                <div class="col-md-4 cloudy1">
                                    <h4>USA</h4>
                                    <figure class="icons">
                                        <canvas id="snow" width="58" height="58"></canvas>
                                    </figure>
                                    <script>
                                        var icons = new Skycons({ "color": "#fff" }),
                                             list = [
                                               "clear-night", "clear-day",
                                               "partly-cloudy-night", "cloudy", "rain", "sleet", "snow", "wind",
                                               "fog"
                                             ],
                                             i;

                                        for (i = list.length; i--;)
                                            icons.set(list[i], list[i]);

                                        icons.play();
                                    </script>
                                    <h3>10c</h3>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 climate-grids">
                        <div class="climate-grid2">
                            <span class="shoppy-rate">
                                <h4>$180</h4>
                            </span>
                            <ul>
                                <li><i class="fa fa-credit-card"></i></li>
                                <li><i class="fa fa-usd"></i></li>
                            </ul>
                        </div>
                        <div class="shoppy">
                            <h3>Those Who Hate Shopping?</h3>
                        </div>
                    </div>
                    <div class="col-md-4 climate-grids">
                        <div class="climate-grid3">
                            <div class="popular-brand">
                                <div class="col-md-6 popular-bran-left">
                                    <h3>Popular</h3>
                                    <h4>Brand of this month</h4>
                                    <p>Duis aute irure  in reprehenderit.</p>
                                </div>
                                <div class="col-md-6 popular-bran-right">
                                    <h3>Polo</h3>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="popular-follow">
                                <div class="col-md-6 popular-follo-left">
                                    <p>Lorem ipsum dolor sit amet, adipiscing elit.</p>
                                </div>
                                <div class="col-md-6 popular-follo-right">
                                    <h4>Follower</h4>
                                    <h5>2892</h5>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>--%>
                <!--climate end here-->
           
            <!--inner block end here-->

<%--        </div>
    </div>--%>
   <%-- </div>--%>
    </div>
</asp:Content>


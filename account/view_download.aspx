<%@ Page Title="" Language="C#" MasterPageFile="~/account/account_master.master" AutoEventWireup="true" CodeFile="view_download.aspx.cs" Inherits="account_view_download" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <!--slider menu-->
    <div class="sidebar-menu" style="background-color:black;width:15%;height:730px">
		  	<div class="logo"> <a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a> <a href="#"> <span id="logo" ></span> 
			      <!--<img id="logo" src="" alt="Logo"/>--> 
			  </a> </div>		  
		    <div class="menu"style="background-color:black">
		      <ul id="menu" >
		        <li id="menu-home" ><a href="account_user.aspx"><i class="fa fa-tachometer"></i><span>Dashboard</span></a></li>
		        <li><a href="user_profile.aspx"><i class="fa fa-book nav_icon"></i><span>Profile</span><span class="fa fa-angle-right" style="float: right"></span></a>
		          <%--<ul>
		            <li><a href="admin_insert_class.aspx">Insert Class</a></li>
		            <li><a href="admin_insert_lang.aspx">Insert Language</a></li>	
                      <li><a href="admin_insert_content.aspx">Insert Content</a></li>	            
		          </ul>--%>
                   
                
		        </li>
                 

		        <li id="menu-comunicacao" ><a href="user_edit.aspx"><i class="fa fa-book nav_icon"></i><span>Settings</span><span class="fa fa-angle-right" style="float: right"></span></a>
		         <%-- <ul >
		            <li ><a href="view_user.aspx">View User</a>		              
		            </li>
		            <li ><a href="view_tutor.aspx">View Tutor</a></li>
		            
		          </ul>--%>
		        </li>
                   
		          <li><a href="view_download"><i class="fa fa-book nav_icon"></i><span>View Downloads</span><span class="fa fa-angle-right" style="float: right"></span></a>
                      
                 <%-- <ul>
                      <li><a href="question_board.aspx">Question Papers</a></li>
                      <li><a href="question_mock.aspx">Mock Papers</a></li>
                      <li><a href="question_mock.aspx">Notes</a></li>
                  </ul>--%>
		       </li>
                   
                  <%--<li><a href="~/website/index.aspx"><i ></i><span>--%>
                  <br />
                      <asp:LinkButton ID="LinkButton1" class="fa fa-book nav_icon" style="float: initial; text-align:center ; color:white;font-size:medium" runat="server" OnClick="LinkButton1_Click">  Logout</asp:LinkButton><%--</span>--%>
                  <%--</a>
                  </li>
 --%>                 <%--<li>
		          <ul id="menu-academico-sub" >
		          	 <li id="menu-academico-boletim" ><a href="login.html">Login</a></li>
		            <li id="menu-academico-avaliacoes" ><a href="signup.html">Sign Up</a></li>		           
		          </ul>
		        </li>--%>
		        
		        <%--<li><a href="charts.html"><i class="fa fa-bar-chart"></i><span>Charts</span></a></li>
		        <li><a href="#"><i class="fa fa-envelope"></i><span>Mailbox</span><span class="fa fa-angle-right" style="float: right"></span></a>
		        	 <ul id="Ul1" >
			            <li id="Li2" ><a href="inbox.html">Inbox</a></li>
			            <li id="Li3" ><a href="inbox-details.html">Compose email</a></li>
		             </ul>
		        </li>
		         <li><a href="#"><i class="fa fa-cog"></i><span>System</span><span class="fa fa-angle-right" style="float: right"></span></a>
		         	 <ul id="Ul2" >
			            <li id="Li4" ><a href="404.html">404</a></li>
			            <li id="Li5" ><a href="blank.html">Blank</a></li>
		             </ul>
		         </li>
		         <li><a href="#"><i class="fa fa-shopping-cart"></i><span>E-Commerce</span><span class="fa fa-angle-right" style="float: right"></span></a>
		         	<ul id="Ul3" >
			            <li id="Li6" ><a href="product.html">Product</a></li>
			            <li id="Li7" ><a href="price.html">Price</a></li>
		             </ul>
		         </li>
		      </ul>--%>
                  </ul>
		    </div>
	 </div>
	<div class="clearfix"> </div>
<!--slide bar menu end here-->
    <div style="margin-left:20%;height:435px;text-align:center;margin-right:10%;margin-top:10%">
    <asp:GridView ID="gvr_view" runat="server" AutoGenerateColumns="False" OnPageIndexChanging="gvr_view_PageIndexChanging" AllowPaging="true" PageSize="4" style="text-align:center;" CellPadding="4" HeaderStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Height="50px" GridLines="Both" Height="300px" margin-top="10%">
        <HeaderStyle ForeColor="black" Font-Bold="True" BackColor=" #33cc99" HorizontalAlign="Center" BorderWidth="3px"></HeaderStyle>
                    
        <Columns>
            <asp:BoundField DataField="file_name" HeaderText="File Name" SortExpression="file_name" ItemStyle-HorizontalAlign="center" ItemStyle-Width="20%" />
            <asp:BoundField DataField="category" HeaderText="Category" SortExpression="category" ItemStyle-HorizontalAlign="center" ItemStyle-Width="20%" />
            <asp:BoundField DataField="download" HeaderText="No of Downloads" SortExpression="download" ItemStyle-HorizontalAlign="center" ItemStyle-Width="20%" />
        </Columns>
     </asp:GridView>
   </div>
</asp:Content>


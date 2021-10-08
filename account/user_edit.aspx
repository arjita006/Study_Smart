<%@ Page Title="" Language="C#" MasterPageFile="~/account/account_master.master" AutoEventWireup="true" CodeFile="user_edit.aspx.cs" Inherits="account_user_edit" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

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
		          <li><a href="view_download.aspx"><i class="fa fa-book nav_icon"></i><span>View Downloads</span><span class="fa fa-angle-right" style="float: right"></span></a>
                  <%--<ul>
                      <li><a href="question_board.aspx">Question Papers</a></li>
                      <li><a href="question_mock.aspx">Mock Papers</a></li>
                      <li><a href="question_mock.aspx">Notes</a></li>
                  </ul>--%>
		       </li>
                 <%-- <li><a href="~/website/index.aspx"><i class="fa fa-book nav_icon"></i><span>--%>
                       <br />
                      <asp:LinkButton ID="LinkButton1" class="fa fa-book nav_icon" style="float: initial; text-align:center ; color:white;font-size:medium" runat="server" OnClick="LinkButton1_Click">  Logout</asp:LinkButton><%--</a>
                  </li>--%>
                  <%--<li>
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
     <div class="login-page">
    <div class="login-main">  	
    	 <div class="login-head">
				<h1>Profile</h1>
			</div>
			<div class="login-block">
                <asp:Label ID="lbluser" runat="server" Text="Name"></asp:Label>
                 <asp:TextBox ID="txtuser" runat="server" ReadOnly="True"></asp:TextBox>
                

                <asp:Label ID="lblemail" runat="server" Text="Email"></asp:Label>
                <asp:TextBox ID="txtemail" runat="server" ReadOnly="True"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtemail"></asp:RegularExpressionValidator>
                <asp:Label ID="lblpass" runat="server" Text="Password"></asp:Label>
                <asp:TextBox ID="txtpass" runat="server" TextMode="Password"></asp:TextBox>
                <asp:Label ID="lblphone" runat="server" Text="Phone Number"></asp:Label>
                <asp:TextBox ID="txtphone" runat="server" MaxLength="10"></asp:TextBox>
                <asp:Label ID="lblcity" runat="server" Text="City"></asp:Label>
                <asp:TextBox ID="txtcity" runat="server" ></asp:TextBox>
                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtcity" ValidChars="qwertyuioplkjhgfdsazxcvbnmQWERTYUIOPLKJHGFDSAZXCVBNM"></cc1:FilteredTextBoxExtender>

                <asp:Label ID="lblstate" runat="server" Text="State"></asp:Label>
                <asp:TextBox ID="txtstate" runat="server"></asp:TextBox>
                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtstate" ValidChars="qwertyuioplkjhgfdsazxcvbnmQWERTYUIOPLKJHGFDSAZXCVBNM"></cc1:FilteredTextBoxExtender>

                <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                <br />
                <br />
                <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" />
                <asp:Label ID="lblmsg1" runat="server" Text=""></asp:Label>
					<%--<input type="text" name="email" placeholder="Email" required="">
					<input type="password" name="password" class="lock" placeholder="Password">
					<div class="forgot-top-grids">
						<div class="forgot-grid">
							<ul>
								<li>
									<input type="checkbox" id="brand1" value="">
									<label for="brand1"><span></span>Remember me</label>
								</li>
							</ul>
						</div>
						<div class="forgot">
							<a href="#">Forgot password?</a>
						</div>
						<div class="clearfix"> </div>
					</div>
					<input type="submit" name="Sign In" value="Login">	
					<h3>Not a member?<a href="signup.html"> Sign up now</a></h3>				
					<h2>or login with</h2>
					<div class="login-icons">
						<ul>
							<li><a href="#" class="facebook"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#" class="twitter"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#" class="google"><i class="fa fa-google-plus"></i></a></li>						
						</ul>
					</div>
				</form>
				<h5><a href="index.html">Go Back to Home</a></h5>--%>
			</div>
      </div>
     </div>
</asp:Content>


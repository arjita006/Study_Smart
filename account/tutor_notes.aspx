<%@ Page Title="" Language="C#" MasterPageFile="~/account/account_master.master" AutoEventWireup="true" CodeFile="tutor_notes.aspx.cs" Inherits="account_tutor_notes" %>

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
		        <li id="menu-home" ><a href="account_tutor.aspx"><i class="fa fa-tachometer"></i><span>Dashboard</span></a></li>
		        <li><a href="tutor_profile.aspx"><i class="fa fa-book nav_icon"></i><span>Profile</span><span class="fa fa-angle-right" style="float: right"></span></a>
		          <%--<ul>
		            <li><a href="admin_insert_class.aspx">Insert Class</a></li>
		            <li><a href="admin_insert_lang.aspx">Insert Language</a></li>	
                      <li><a href="admin_insert_content.aspx">Insert Content</a></li>	            
		          </ul>--%>
		        </li>
		        <li id="menu-comunicacao" ><a href="tutor_edit.aspx"><i class="fa fa-book nav_icon"></i><span>Settings</span><span class="fa fa-angle-right" style="float: right"></span></a>
		         <%-- <ul >
		            <li ><a href="view_user.aspx">View User</a>		              
		            </li>
		            <li ><a href="view_tutor.aspx">View Tutor</a></li>
		            
		          </ul>--%>
		        </li>
		          <li><a href="#"><i class="fa fa-book nav_icon"></i><span>Upload</span><span class="fa fa-angle-right" style="float: right"></span></a>
                  <ul>
                      <li><a href="tutor_question.aspx">Question Papers</a></li>
                      <li><a href="tutor_mockpaper.aspx">Mock Papers</a></li>
                      <li><a href="tutor_notes.aspx">Notes</a></li>
                  </ul>
		       </li>
                   <li><a href="tutor_viewupload.aspx"><i class="fa fa-book nav_icon"></i><span>View Upload</span><span class="fa fa-angle-right" style="float: right"></span></a>
                

		       </li>
                  <br />
                      <asp:LinkButton ID="LinkButton1" class="fa fa-book nav_icon" style="float: initial; text-align:center ; color:white;font-size:medium" runat="server" OnClick="LinkButton1_Click">  Logout</asp:LinkButton>
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
				<h1>Notes</h1>
			</div>
			<div class="login-block">
				 <div>
					<%--<input type="text" name="email" placeholder="Email" required="">--%>
              
                     <div style="margin-bottom:20px">
                     

                     <asp:label ID="lblclass" runat="server" text="Select Class" Font-Bold="true" ForeColor="Black" CssClass="form-control" BackColor="#68AE00" ></asp:label>
                         <br />

                     <asp:dropdownlist ID="ddlclass" runat="server" CssClass="form-control"></asp:dropdownlist>
                         <br />
                     <asp:label  ID="lbllang" runat="server" text="Select Language" Font-Bold="true" ForeColor="Black" CssClass="form-control" BackColor="#68AE00" ></asp:label>
                         <br />
                     <asp:dropdownlist ID="ddllang" runat="server" CssClass="form-control"></asp:dropdownlist>
                    
                         <br />
                     <asp:label ID="lblnotesname" runat="server" text="Name of the topic" Font-Bold="true" ForeColor="Black" CssClass="form-control" BackColor="#68AE00" ></asp:label>
                         <br />
                     <asp:textbox ID="txtnotesname" runat="server" CssClass="form-control"></asp:textbox>
<cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtnotesname" ValidChars="qwertyuioplkjhgfdsazxcvbnmQWERTYUIOPLKJHGFDSAZXCVBNM    "></cc1:FilteredTextBoxExtender>
                         <br />
                     <asp:label ID="lblnotesfile" runat="server" text="Select File" Font-Bold="true" ForeColor="Black" CssClass="form-control" BackColor="#68AE00" ></asp:label>
                         <br />
                     <asp:fileupload ID="FileUpload1" runat="server"></asp:fileupload>
                         <asp:Label ID="lblmsg" runat="server" Text="" Visible="false"></asp:Label>
                         <br />
                          <asp:Label ID="lblpaperimage" runat="server" Text="Select Image" Font-Bold="true" ForeColor="Black" CssClass="form-control" BackColor="#68AE00" ></asp:Label>
                         <br />
                         <asp:FileUpload ID="FileUpload2" runat="server" />
                         <asp:Label ID="lblmsg1" runat="server" Text="" Visible="false"></asp:Label>
                         <br />
                     <%--<asp:label ID="lblpaperyear" runat="server" text="Label" CssClass="form-control"></asp:label>
                     <asp:textbox ID="txtpaperyear" runat="server"></asp:textbox>--%>
					<%--<input type="password" name="password" class="lock" placeholder="Password">--%>
					<div class="forgot-top-grids">
						<%--<div class="forgot-grid">
							<ul>
								<li>
									<input type="checkbox" id="brand1" value="">
									<label for="brand1"><span></span>Remember me</label>
								</li>
							</ul>
						</div>--%>
						<%--<div class="forgot">
							<a href="#">Forgot password?</a>
						</div>
						<div class="clearfix"> </div>
					</div>--%>
                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click"  />
<br />
                         <asp:Label ID="lblmssg" runat="server"></asp:Label>
                        </div>
					<%--<input type="submit" name="Sign In" value="Login">	--%>
				<%--	<h3>Not a member?<a href="signup.html"> Sign up now</a></h3>				
					<h2>or login with</h2>--%>
					<%--<div class="login-icons">
						<ul>
							<li><a href="#" class="facebook"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#" class="twitter"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#" class="google"><i class="fa fa-google-plus"></i></a></li>						
						</ul>
					</div>--%>
		<div>		
      
                     <br />
    </div></div>
                     </div>
                </div>
        </div>
         </div>
</asp:Content>


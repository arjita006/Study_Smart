<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="notes.aspx.cs" Inherits="notes" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="login-page">
    <div class="login-main">  	
    	 <div class="login-head">
				<h1>Notes</h1>
			</div>
			<div class="login-block">
				 <div>
					<%--<input type="text" name="email" placeholder="Email" required="">--%>
              
                     <div style="margin-bottom:20px">
                     

                     <asp:label ID="lblclass" runat="server" text="Select Class" Font-Bold="true" ForeColor="Black" CssClass="form-control" BackColor="#68AE00"></asp:label>
                         <br />
                     <asp:dropdownlist ID="ddlclass" runat="server" CssClass="form-control"></asp:dropdownlist>
                         <br />
                     <asp:label  ID="lbllang" runat="server" text="Select Language" Font-Bold="true" ForeColor="Black" CssClass="form-control" BackColor="#68AE00"></asp:label>
                         <br />
                     <asp:dropdownlist ID="ddllang" runat="server" CssClass="form-control"></asp:dropdownlist>
                    <br />

                     <asp:label ID="lblnotesname" runat="server" text="Name of the topic" Font-Bold="true" ForeColor="Black" CssClass="form-control" BackColor="#68AE00"></asp:label>
                         <br />
                     <asp:textbox ID="txtnotesname" runat="server" CssClass="form-control"></asp:textbox>
                         <br />
                         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtnotesname" ValidChars="QWERTYUIOPASDFGHJKLZXCVBNMmnbvcxzlkjhgfdsapoiuytrewq ,."></cc1:FilteredTextBoxExtender>
                     <asp:label ID="lblnotesfile" runat="server" text="Select File" Font-Bold="true" ForeColor="Black" CssClass="form-control" BackColor="#68AE00"></asp:label>
                         <br />
                     <asp:fileupload ID="FileUpload1" runat="server"></asp:fileupload>
                         <br />
                         <asp:Label ID="lblmsg" runat="server"  Visible="false" ForeColor="Red"></asp:Label>
                         <br />
                          <asp:Label ID="lblpaperimage" runat="server" Text="Select Image" Font-Bold="true" ForeColor="Black" CssClass="form-control" BackColor="#68AE00"></asp:Label>
                         <br />
                         <asp:FileUpload ID="FileUpload2" runat="server" />
                         <br />
                         <asp:Label ID="lblmsg1" runat="server" Visible="false"  ForeColor="Red"></asp:Label>
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
    </div>
                         </div>
                     </div>
                </div>
        </div>
        </div>
    c
</asp:Content>


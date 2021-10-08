<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="user_registeration.aspx.cs" Inherits="user_registeration" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="login-page">
    <div class="login-main">  	
    	 <div class="login-head">
				<h1>Registeration</h1>
			</div>
			<div class="login-block">
                <asp:Label ID="lbluser" runat="server" Text="Name"></asp:Label>
                 <asp:TextBox ID="txtuser" runat="server"></asp:TextBox>
                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtuser" ValidChars="qwertyuioplkjhgfdsazxcvbnmMNBVCXZLKJHGFDSAPOIUYTREWQ ."></cc1:FilteredTextBoxExtender>
                <asp:Label ID="lblemail" runat="server" Text="Email"></asp:Label>
                <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtemail"></asp:RegularExpressionValidator>
                <asp:Label ID="lblpass" runat="server" Text="Password"></asp:Label>
                <asp:TextBox ID="txtpass" runat="server" TextMode="Password"></asp:TextBox>
                <asp:Label ID="lblphone" runat="server" Text="Phone Number"></asp:Label>
                <asp:TextBox ID="txtphone" runat="server"></asp:TextBox>
                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtphone" ValidChars="1234567890"></cc1:FilteredTextBoxExtender>
                <asp:Label ID="lblcity" runat="server" Text="City"></asp:Label>
                <asp:TextBox ID="txtcity" runat="server"></asp:TextBox>
                 <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtcity" ValidChars="qwertyuioplkjhgfdsazxcvbnmMNBVCXZLKJHGFDSAPOIUYTREWQ ."></cc1:FilteredTextBoxExtender>
                <asp:Label ID="lblstate" runat="server" Text="State"></asp:Label>
                <asp:TextBox ID="txtstate" runat="server"></asp:TextBox>
                 <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtstate" ValidChars="qwertyuioplkjhgfdsazxcvbnmMNBVCXZLKJHGFDSAPOIUYTREWQ ."></cc1:FilteredTextBoxExtender>
                <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                <br />
                <br />
                <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" />
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
<!--inner block end here-->
</asp:Content>


<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_login.aspx.cs" Inherits="Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Study Smart</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Shoppy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<!--js-->
<script src="js/jquery-2.1.1.min.js"></script> 
<!--icons-css-->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!--Google Fonts-->
<link href='//fonts.googleapis.com/css?family=Carrois+Gothic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Work+Sans:400,500,600' rel='stylesheet' type='text/css'>
<!--static chart-->

</head>
<body>
   
    <div style="margin-top:-4%">
   
<div class="login-page">
    <div class="login-main">  	
    	 <div class="login-head">
				<h1>Login</h1>
			</div>
			<%--<div class="logiLogin"</h1>
			</div>--%>
			<div class="loginLogin"
			</div>
			<div class="login-block">
				<form runat="server">
                    <asp:TextBox ID="txtEmail" runat="server" class="user" placeholder="Email" required=""></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Incorrect Email Address" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="txtPass" runat="server" class="lock" placeholder="Password" required="" TextMode="Password" ></asp:TextBox>
                    
                    <asp:Button ID="btnsubmit" runat="server" Text="Login" OnClick="btnsubmit_Click"/>
                    <asp:Label ID="lblmssg" runat="server" Text=""></asp:Label>
                  

                    <%--<input type="submit" name="Sign In" value="Login">	--%>
				</form>
			</div>
      </div>
</div>
<!--inner block end here-->
<!--copy rights start here-->
        <br />
        <br />
        <br />
        <br />

<div class="copyrights">
	 <p>© 2019 Study Smart. All Rights Reserved | Developed by Arpita And Arjita

<!--scrolling js-->
		<script src="js/jquery.nicescroll.js"></script>
		<script src="js/scripts.js"></script>
		<!--//scrolling js-->
<script src="js/bootstrap.js"> </script>
<!-- mother grid end here-->


    </div>
   
</body>
</html>

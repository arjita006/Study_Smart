<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="admin_insert_lang.aspx.cs" Inherits="admin_insert_lang" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
       
    <div class="login-page">
    <div class="login-main">  	
    	 <div class="login-head">
				<h1>Insert Language</h1>
			</div>
			<div class="login-block">
				

					<%--<input type="text" name="email" placeholder="Email" required="">--%>
                    <asp:Label ID="lblname" runat="server" Text="Language Name" Font-Bold="true" ForeColor="Black" CssClass="form-control" BackColor="#68AE00"></asp:Label>
                <br />
                    <%--<input type="password" name="password" class="lock" placeholder="Password">--%>
                         <asp:TextBox ID="txtname" runat="server" placeholder="Enter Language"  CssClass="form-control"></asp:TextBox>
                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtname" ValidChars="qwertyuioplkjhgfdsazxcvbnmQWERTYUIOPLKJHGFDSAZXCVBNM ,."></cc1:FilteredTextBoxExtender>
                <br />
                     <asp:Label ID="lblstatus" runat="server" Text="Language Status" Font-Bold="true" ForeColor="Black" CssClass="form-control" BackColor="#68AE00"></asp:Label>
                <br />
                     <asp:DropDownList ID="ddlstatus" runat="server" CssClass="form-control">
                </asp:DropDownList>
                    <br />
                     <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
                    <%--<div class="forgot-top-grids">
						<div class="forgot-grid">
							<ul>
								<li>
									<input type="checkbox" id="brand1" value="">
									<label for="brand1"><span></span>Remember me</label>
								</li>
							</ul>
						</div>--%>						<%--<div class="forgot">
							<a href="#">Forgot password?</a>
						</div>
						<div class="clearfix"> </div>
					</div>
					0<input type="submit" name="Sign In" value="Login">	
					<h3>Not a member?<a href="signup.html"> Sign up now</a></h3>				
					<h2>or login with</h2>
					<div class="login-icons">
						<ul>
							<li><a href="#" class="facebook"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#" class="twitter"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#" class="google"><i class="fa fa-google-plus"></i></a></li>						
						</ul>
					</div>--%>
                <asp:Label ID="lblmssg" runat="server"></asp:Label>
                <br />
               

                 <asp:Label ID="lblsearch" runat="server" Text="Enter Id" Font-Bold="true" ForeColor="Black" CssClass="form-control" BackColor="#68AE00"></asp:Label>
                    <br />
                <asp:TextBox ID="txtsearch" runat="server" placeholder="Enter the Language Id to search" ></asp:TextBox>
               <br />
                <asp:Button ID="btnsearch" runat="server" Text="Search" OnClick="btnsearch_Click" />
                <br />
                <asp:Label ID="lblmsg2" runat="server" Text=""></asp:Label>
                <br />
                <br />
                <asp:GridView ID="gvr_lang" runat="server" AutoGenerateColumns="False" DataKeyNames="lang_id" OnRowEditing="gvr_lang_RowEditing" OnRowUpdating="gvr_lang_RowUpdating" OnRowDeleting="gvr_lang_RowDeleting" OnRowCancelingEdit="gvr_lang_RowCancelingEdit" AllowPaging="True" OnPageIndexChanging="gvr_lang_PageIndexChanging" PageSize="4" OnSorting="gvr_lang_Sorting" AllowSorting="true" Width="100%" Height="100%">
                    <Columns>
                        <asp:BoundField DataField="lang_id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="lang_id" />
                        <asp:BoundField DataField="lang_name" HeaderText="Language Name" SortExpression="lang_name" />
                        <asp:BoundField DataField="lang_status" HeaderText="Language Status" SortExpression="lang_status" />
                        <asp:BoundField DataField="entry_date" HeaderText="Entry Date" SortExpression="entry_date" />
                        <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                        <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
                    </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectConnectionString3 %>" SelectCommand="SELECT * FROM [language2]"></asp:SqlDataSource>
                <%--	<h5><a href="index.html">Go Back to Home</a></h5>--%>
			</div>
      </div>
</div>
<!--inner block end here-->
<!--copy rights start here-->
</asp:Content>


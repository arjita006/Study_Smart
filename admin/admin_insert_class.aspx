<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="admin_insert_class.aspx.cs" Inherits="admin_insert_class" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <div class="login-page">
    <div class="login-main">  	
    	 <div class="login-head">
				<h1>Insert Class</h1>
			</div>
			<div class="login-block">
				 <div>
					<%--<input type="text" name="email" placeholder="Email" required="">--%>
              
                     <div style="margin-bottom:20px">
                     <asp:Label ID="lblclass" runat="server" Text="Class Name" Font-Bold="true" ForeColor="Black" CssClass="form-control" BackColor="#68AE00" ></asp:Label></div>
                     <br />
                     <asp:TextBox ID="txtclass" runat="server" placeholder="Enter Class"  CssClass="form-control"></asp:TextBox>
                     <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Class Name" ControlToValidate="txtclass" ValidationExpression="^[0-9]"></asp:RegularExpressionValidator>--%>
					<%--<input type="password" name="password" class="lock" placeholder="Password">--%>
					<%--<div class="forgot-top-grids">--%>
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
                        <br />
                        
                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" CssClass="form-control" />
                         <asp:Label ID="lblmssg" runat="server"></asp:Label>
                        
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
		

                     <br />
    <asp:Label ID="lblsearch" runat="server" Text="Enter Id" Font-Bold="true" ForeColor="Black" CssClass="form-control" BackColor="#68AE00"></asp:Label>
                    <br />
                     <asp:TextBox ID="txtsearch" runat="server" placeholder="Enter class Id to search" CssClass="form-control" ></asp:TextBox>
        
                     <asp:Button ID="btnsearch" runat="server" Text="Search" OnClick="btnsearch_Click" CssClass="form-control" />
            <br />
                     <asp:Label ID="lblmssg2" runat="server" Text=""></asp:Label>
                     <br />
            
                     <asp:GridView ID="gvr_class" runat="server" AutoGenerateColumns="False" DataKeyNames="class_id" OnRowUpdating="gvr_class_RowUpdating" OnRowEditing="gvr_class_RowEditing" OnRowCancelingEdit="gvr_class_RowCancelingEdit" OnRowDeleting="gvr_class_RowDeleting" OnPageIndexChanging="gvr_class_PageIndexChanging" AllowSorting="true" OnSorting="gvr_class_Sorting" AllowPaging="true" PageSize="4" Width="100%" Height="70%">
                         <Columns>
                             <asp:BoundField DataField="class_id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="class_id" >
                             <HeaderStyle Font-Size="12px" />
                             </asp:BoundField>
                             <asp:BoundField DataField="class_name" HeaderText="Class Name" SortExpression="class_name" >
                             <HeaderStyle Font-Size="12px" />
                             </asp:BoundField>
                             <asp:BoundField DataField="entry_date" HeaderText="Entry Date" SortExpression="entry_date" ReadOnly="true" >
                             <HeaderStyle Font-Size="12px" />
                             </asp:BoundField>
                             <asp:CommandField HeaderText="Edit" ShowEditButton="True" >
                             <HeaderStyle Font-Size="12px" />
                             </asp:CommandField>
                             <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" >
                             <HeaderStyle Font-Size="12px" />
                             </asp:CommandField>
                         </Columns>
                         <PagerSettings Mode="NextPrevious" />
                     </asp:GridView>
				     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectConnectionString2 %>" SelectCommand="SELECT [class_id], [class_name], [entry_date] FROM [class]"></asp:SqlDataSource>
				<%--<h5><a href="index.html">Go Back to Home</a></h5>--%>
			</div>
                          
    </div>
                         
                       </div>
                 </div>
<%--</div>--%>
<!--inner block end here-->
<!--copy rights start here-->
</asp:Content>


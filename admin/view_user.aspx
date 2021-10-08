<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="view_user.aspx.cs" Inherits="view_user" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <%-- <div class="login-page">
    <div class="login-main">  	
    	 <div class="login-head">
				<h1>Insert Class</h1>
			</div>
			<div class="login-block">--%>
     
     <div class="login-page">
    <div class="login-main">  	
    	 <div class="login-head">
				<h1>Users</h1>
			</div>
			<div class="login-block">
				 <div>
				
              
                     <div style="margin-bottom:20px">
                         <asp:Label ID="lbltext" runat="server" Text="Enter the ID" Font-Bold="true" ForeColor="Black" CssClass="form-control" BackColor="#68AE00"></asp:Label>
                         <br />

                         <asp:TextBox ID="txtsearch" runat="server" CssClass="form-control" placeholder="Enter the user Id to search"></asp:TextBox>
                             <br />
                         <asp:Button ID="btnsearch" runat="server" Text="Search" CssClass="form-control" OnClick="btnsearch_Click" />
                         <br />
                          <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                         <asp:Panel ID="Panel1" runat="server" Height="400px" Width="450px" ScrollBars="Auto">
                         <asp:GridView ID="gvr_user" runat="server" AutoGenerateColumns="False" DataKeyNames="user_id" OnRowCancelingEdit="gvr_user_RowCancelingEdit" OnRowDeleting="gvr_user_RowDeleting" OnRowEditing="gvr_user_RowEditing" OnRowUpdating="gvr_user_RowUpdating" CssClass="table table-responsive table-hover" AllowPaging="true" PageSize="4" OnPageIndexChanging="gvr_user_PageIndexChanging" AllowSorting="true" OnSorting="gvr_user_Sorting" Width="100%" Height="70%" >
                             <Columns>
                                 <asp:BoundField DataField="user_id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="user_id" />
                                 <asp:BoundField DataField="user_name" HeaderText="Name" SortExpression="user_name" />
                                 <asp:BoundField DataField="user_email" HeaderText="Email" SortExpression="user_email" />
                                 <asp:BoundField DataField="user_password" HeaderText="Password" SortExpression="user_password" />
                                 <asp:BoundField DataField="user_phno" HeaderText="Phone no." SortExpression="user_phno" />
                                 <asp:BoundField DataField="user_city" HeaderText="City" SortExpression="user_city" />
                                 <asp:BoundField DataField="user_state" HeaderText="State" SortExpression="user_state" />
                                 <asp:BoundField DataField="user_datetime" HeaderText="DateTime" SortExpression="user_datetime" />
                                 <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                                 <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
                             </Columns>
                             <PagerSettings Mode="NextPrevious" />
                         </asp:GridView>
                             </asp:Panel>
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectConnectionString5 %>" SelectCommand="SELECT * FROM [user_registeration]"></asp:SqlDataSource>
                     </div>
                     </div>
                
		</div>
         </div>
         </div>
</asp:Content>


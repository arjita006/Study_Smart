<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="view_contact_us.aspx.cs" Inherits="about_us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <%-- <div class="login-page">
    <div class="login-main">  	
    	 <div class="login-head">
				<h1>Insert Class</h1>
			</div>
			<div class="login-block">--%>
     <div class="form-horizontal">
        <div class="signup-page-main">
            <div class="signup-main">
                <div class="signup-head">
                    <h1>User</h1>
                </div>
                <div class="signup-block">
                    </div>
			
                     <div style="margin-bottom:20px">
                         <asp:TextBox ID="txtsearch" runat="server" CssClass="form-control"></asp:TextBox>
                         <br />
                         <asp:Button ID="btnsearch" runat="server" Text="Search" CssClass="form-control" OnClick="btnsearch_Click" />
                         <br />
                         <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                         <br />
                         <br />
                         <asp:Panel ID="Panel1" runat="server" Height="400px" Width="400px" ScrollBars="Horizontal">
                         <asp:GridView ID="gvr_about" runat="server" AutoGenerateColumns="False" DataKeyNames="contact_id"  OnRowCancelingEdit="gvr_about_RowCancelingEdit" OnRowDeleting="gvr_about_RowDeleting" OnRowEditing="gvr_about_RowEditing" OnRowUpdating="gvr_about_RowUpdating" AllowPaging="true" AllowSorting="true" OnPageIndexChanging="gvr_about_PageIndexChanging" OnSorting="gvr_about_Sorting" PageSize="4">
                             <Columns>
                                 <asp:BoundField DataField="contact_id" HeaderText="Id" SortExpression="contact_id" />
                                 <asp:BoundField DataField="user_name" HeaderText="Name" SortExpression="user_name" />
                                 <asp:BoundField DataField="user_email" HeaderText="Email" SortExpression="user_email" />
                                 <asp:BoundField DataField="user_message" HeaderText="Message" SortExpression="user_message" />
                                 <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                                 <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
                             </Columns>
                             </asp:GridView>

                             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectConnectionString1 %>" SelectCommand="SELECT * FROM [tbl_content]"></asp:SqlDataSource>

                             </asp:Panel>
                         	 <div>
				
                                       </div>
                     </div>
                
		</div>
         </div>
         </div>
              
</asp:Content>


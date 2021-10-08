<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="view_tutor.aspx.cs" Inherits="view_tutor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      
     <div class="login-page">
    <div class="login-main">  	
    	 <div class="login-head">
				<h1>Tutors</h1>
			</div>
			<div class="login-block">
				 <div>
				
              
                     <div style="margin-bottom:20px">
                          <asp:Label ID="lbltext" runat="server" Text="Enter the ID" Font-Bold="true" ForeColor="Black" CssClass="form-control" BackColor="#68AE00"></asp:Label>
                         <br />
                         <asp:TextBox ID="txtsearch" runat="server"  CssClass="form-control"  placeholder="Enter the tutor Id to search"></asp:TextBox>
                         <br />
                         <asp:Button ID="btnsearch" runat="server" Text="Search"  Font-Bold="true" ForeColor="Black" CssClass="form-control" OnClick="btnsearch_Click" />
                         <br />
                         <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                         <br />
                         <asp:Panel ID="Panel1" runat="server"  Height="400px" Width="450px" ScrollBars="Both">
                         <asp:GridView ID="gvr_tutor" runat="server" AutoGenerateColumns="False" DataKeyNames="tutor_id" OnRowCancelingEdit="gvr_tutor_RowCancelingEdit" OnRowDeleting="gvr_tutor_RowDeleting" OnRowEditing="gvr_tutor_RowEditing" OnRowUpdating="gvr_tutor_RowUpdating" AllowPaging="true" AllowSorting="true" PageSize="4" OnPageIndexChanging="gvr_tutor_PageIndexChanging" OnSorting="gvr_tutor_Sorting" Width="100%" Height="70%" >
                             <Columns>
                                 <asp:BoundField DataField="tutor_id" HeaderText="tutor_id" InsertVisible="False" ReadOnly="True" SortExpression="tutor_id" />
                                 <asp:BoundField DataField="tutor_name" HeaderText="tutor_name" SortExpression="tutor_name" />
                                 <asp:BoundField DataField="tutor_email" HeaderText="tutor_email" SortExpression="tutor_email" />
                                 <asp:BoundField DataField="tutor_password" HeaderText="tutor_password" SortExpression="tutor_password" />
                                 <asp:BoundField DataField="tutor_phno" HeaderText="tutor_phno" SortExpression="tutor_phno" />
                                 <asp:BoundField DataField="tutor_address" HeaderText="tutor_address" SortExpression="tutor_address" />
                                 <asp:BoundField DataField="tutor_city" HeaderText="tutor_city" SortExpression="tutor_city" />
                                 <asp:BoundField DataField="tutor_state" HeaderText="tutor_state" SortExpression="tutor_state" />
                                 <asp:BoundField DataField="entry_date" HeaderText="entry_date" SortExpression="entry_date" />
                                 <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                                 <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
                             </Columns>
                             
                         </asp:GridView>
                             </asp:Panel>
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectConnectionString5 %>" SelectCommand="SELECT * FROM [tutor_registeration]"></asp:SqlDataSource>
                     </div></div></div></div></div>
</asp:Content>


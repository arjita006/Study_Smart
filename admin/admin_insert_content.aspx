<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="admin_insert_content.aspx.cs" Inherits="admin_insert_content" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
    <div class="form-horizontal">
        <div class="signup-page-main">
            <div class="signup-main">
                <div class="signup-head">
                    <h1>Insert Content</h1>
                </div>
                <div class="signup-block">

                    <%--<input type="text" name="email" placeholder="Email" required="">--%>
                    <asp:Label ID="lblclass" runat="server" Text="Select Class" Font-Bold="true" ForeColor="Black" CssClass="form-control" BackColor="#68AE00"></asp:Label>
                  <br />
                    <asp:DropDownList ID="ddlclass" runat="server" CssClass="form-control" >
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:Label ID="lbllang" runat="server" Text="Select Language" Font-Bold="true" ForeColor="Black" CssClass="form-control" BackColor="#68AE00"></asp:Label>
                    <br />
                    <asp:DropDownList ID="ddllanguage" runat="server" CssClass="form-control" >
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:Label ID="lblchapter" runat="server" Text="Chapter Name" Font-Bold="true" ForeColor="Black" CssClass="form-control" BackColor="#68AE00"></asp:Label>
                    <br />
                    <asp:TextBox ID="txtchapter" runat="server" ></asp:TextBox>
                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtchapter" ValidChars="qwerrtyuioplkjhgfdasazxcvbbnmQWERTYUIOPASDFGHJKLMNBVCXZ ,."></cc2:FilteredTextBoxExtender>
                   <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="txtchapter" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <br />--%>
                    <asp:Label ID="lbltopic" runat="server" Text="Topic Name" Font-Bold="true" ForeColor="Black" CssClass="form-control" BackColor="#68AE00"></asp:Label>
                    <br />
                    <asp:TextBox ID="txttopic" runat="server" ></asp:TextBox>
                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txttopic" ValidChars="qwerrtyuioplkjhgfdasazxcvbbnmQWERTYUIOPLKJHGFDSAZXCVBNM ,."></cc2:FilteredTextBoxExtender>
                    <br />
                    <br />
                    <asp:Label ID="lblans" runat="server" Text="Answer" Font-Bold="true" ForeColor="Black" CssClass="form-control" BackColor="#68AE00"></asp:Label>
                   <%-- <asp:TextBox ID="txtanswer" runat="server" TextMode="MultiLine" CssClass="form-control" ></asp:TextBox>--%>
                    <br />
                    <cc1:Editor ID="txtanswer" runat="server" />
                    
                    <br />
                    <br />
                    <asp:Label ID="lblimage" runat="server" Text="Image" Font-Bold="true" ForeColor="Black" CssClass="form-control" BackColor="#68AE00"></asp:Label>
                    <br />
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <asp:Image ID="Image1" runat="server" />
                     <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                    <br />
                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" />
                    <asp:Label ID="lblmssg" runat="server" Text=""></asp:Label>
                    <asp:Label ID="hiddenlbl" runat="server" Visible="false"></asp:Label>
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
					</div>--%
				<%--<h5><a href="index.html">Go Back to Home</a></h5>\--%>
                </div>
                <asp:Label ID="Label1" runat="server" Text="Enter the Id" Font-Bold="true" ForeColor="Black" CssClass="form-control" BackColor="#68AE00"></asp:Label>
                <br />
                <asp:TextBox ID="txtsearch" runat="server" CssClass="form-control" placeholder="Enter the content Id to search"></asp:TextBox>
                <br>
                <asp:Button ID="btnsearch" runat="server" Text="Search" CssClass="form-control" OnClick="btnsearch_Click"/>
                
                <asp:Label ID="lblmssg2" runat="server" Text=""></asp:Label>
                <br />
                <br />
                <asp:Panel ID="Panel1" runat="server" Height="500px" Width="450px" ScrollBars="Horizontal">
                    <asp:GridView ID="gvr_content" runat="server" AutoGenerateColumns="False" DataKeyNames="content_id" OnRowCancelingEdit="gvr_content_RowCancelingEdit" OnRowUpdating="gvr_content_Updating1" OnRowEditing="gvr_content_RowEditing" OnRowDeleting="gvr_content_RowDeleting" CssClass="table table-responsive table-hover" AllowPaging="true" PageSize="4" AllowSorting="true"  OnPageIndexChanging="gvr_content_PageIndexChanging" OnSorting="gvr_content_Sorting">
                        <Columns>
                            <asp:BoundField DataField="content_id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="content_id" />
                            <asp:BoundField DataField="class_id" HeaderText="Class Id" SortExpression="class_id" />
                            <asp:BoundField DataField="lang_id" HeaderText="Language Id" SortExpression="lang_id" />
                            <asp:BoundField DataField="chapter_name" HeaderText="Chapter Name" SortExpression="chapter_name" />
                            <asp:BoundField DataField="topic_name" HeaderText="Topic Name" SortExpression="topic_name" />
                            <asp:BoundField DataField="answer" HeaderText="Answer" SortExpression="answer" />
                            <asp:BoundField DataField="entry_date" HeaderText="Entry Date" SortExpression="entry_date" />
                            <asp:TemplateField HeaderText="Image">
                                <EditItemTemplate>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#"data:image;base64,"+Convert.ToBase64String((byte[])Eval("image"))%>' />
                                      <asp:FileUpload ID="FileUpload2" runat="server" />
                                   
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Img1" runat="server" Width="100px" Height="100px" ImageUrl='<%#"data:image;base64,"+Convert.ToBase64String((byte[])Eval("image"))%>' />
                                   
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField HeaderText="Edit" ShowEditButton="True" ShowHeader="True" />
                            <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ShowHeader="True" />
                        </Columns>
                        <PagerSettings Mode="NextPrevious" />
                    </asp:GridView>
                    &nbsp;</asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>


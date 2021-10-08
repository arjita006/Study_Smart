<%@ Page Title="" Language="C#" MasterPageFile="~/website/website_master.master" AutoEventWireup="true" CodeFile="viewquestionpaper.aspx.cs" Inherits="website_viewquestionpaper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  

    <div class="containr">
        <table style="width:100%;">
        <tr><td style="width:20%">
    <asp:Panel ID="Panel1" runat="server" style="width:60px;padding-bottom:20px">
        <table style="border:solid black;width:400px;background-color:#f1f1f2; box-shadow: 10px 10px 5px #888888;">
                    <tr >
                <td colspan="3" style="width:200px; background-color:#33cc99;font-size:larger;font-weight:400">SORT BY
                    
                    <asp:RadioButtonList ID="rdldownload1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rdldownload1_SelectedIndexChanged" Font-Bold="false">
                        <asp:ListItem >Most Downloaded</asp:ListItem>
                        <asp:ListItem>Recently Uploaded</asp:ListItem>
                    </asp:RadioButtonList></td>
                               </tr>
            </table>
          </asp:Panel>
             <asp:Panel ID="Panel2" runat="server" style="width:60px;padding-bottom:20px">
        <table style="border:solid black;width:400px;background-color:#f1f1f2; box-shadow: 10px 10px 5px #888888;">
                <tr >
                <td colspan="3" style="width:200px; background-color:#33cc99">CLASS
                    <asp:RadioButtonList ID="rdlclass" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rdlclass_SelectedIndexChanged" Font-Size="Larger">
                       
                    </asp:RadioButtonList></td>
             </tr>
            </table>
            </asp:Panel>
             <asp:Panel ID="Panel3" runat="server" style="width:60px;padding-bottom:20px">
        <table style="border:solid black;width:400px;background-color:#f1f1f2; box-shadow: 10px 10px 5px #888888;">

            <tr >
                <td colspan="3" style="width:200px;background-color:#33cc99">LANGUAGE
                <asp:RadioButtonList ID="rdllanguage" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rdllanguage_SelectedIndexChanged"  >
                       
                    </asp:RadioButtonList></td>
             </tr>
           

        </table>
    </asp:Panel>
            </td>
        <td style="width:60%">
            <div style="margin-left:100px;width:auto;height:500px;overflow:auto;">
              

     
                <asp:GridView ID="gvr_question" runat="server" AutoGenerateColumns="False" OnPageIndexChanging="gvr_question_PageIndexChanging" AllowPaging="true" PageSize="4" style="text-align:center;" CellPadding="4" HeaderStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Height="50px" GridLines="Both">
                       <HeaderStyle ForeColor="black" Font-Bold="True" BackColor=" #33cc99" HorizontalAlign="Center" BorderWidth="3px"></HeaderStyle>
                    <Columns>
                         <asp:TemplateField HeaderText="Image" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center">
                             <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" Width="100px" Height="100px" ImageUrl='<%#"data:image;base64,"+Convert.ToBase64String((byte[])Eval("paper_image"))%>' />
                                </ItemTemplate>
                             </asp:TemplateField>
       <asp:BoundField DataField="paper_name" HeaderText="Paper Name"  SortExpression="paper_name" ItemStyle-HorizontalAlign="center" ItemStyle-Width="20%" />
       <asp:BoundField DataField="paper_year" HeaderText="Paper Year" SortExpression="paper_year" ItemStyle-HorizontalAlign="center" ItemStyle-Width="20%" />
       <asp:BoundField DataField="class_name" HeaderText="Class Name" SortExpression="class_name" ItemStyle-HorizontalAlign="center" ItemStyle-Width="20%"/>
       <asp:BoundField DataField="lang_name" HeaderText="Language Name" SortExpression="lang_name" ItemStyle-HorizontalAlign="center" ItemStyle-Width="20%"/>
                      

                        <asp:TemplateField HeaderText="Download">
            <ItemTemplate >
              
                <a href="viewquestionpaper.aspx?paper=<%# Eval("paper_file") %>&id=<%#Eval("paper_id") %>"> Download</a>
            </ItemTemplate>
        </asp:TemplateField>
                    </Columns>
                   <PagerSettings Mode="Numeric" />
                     
                </asp:GridView>
                <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" SelectCommand="SELECT [paper_name], [paper_image], [paper_year], [class_name], [lang_name] FROM [question_board1]"></asp:SqlDataSource>--%>
            </div>
                </td></tr>

    </table>
    </div>
       

</asp:Content>


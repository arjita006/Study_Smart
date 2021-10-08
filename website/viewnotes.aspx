<%@ Page Title="" Language="C#" MasterPageFile="~/website/website_master.master" AutoEventWireup="true" CodeFile="viewnotes.aspx.cs" Inherits="website_viewnotes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <table style="width:100%">
        <tr><td style="width:20%">
    <asp:Panel ID="Panel1" runat="server" style="width:60px;padding-bottom:20px">
        <table style="border:solid black;width:400px;background-color:#f1f1f2; box-shadow: 10px 10px 5px #888888;">
                    <tr >
                <td colspan="3" style="width:200px;background-color:#33cc99">SORT BY
                    <asp:RadioButtonList ID="rdldownload1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rdldownload1_SelectedIndexChanged">
                        <asp:ListItem>Most Downloaded</asp:ListItem>
                        <asp:ListItem>Recently Uploaded</asp:ListItem>
                        
                    </asp:RadioButtonList></td>
                               </tr>
            </table>
          </asp:Panel>
             <asp:Panel ID="Panel2" runat="server" style="width:60px;padding-bottom:20px">
        <table style="border:solid black;width:400px;background-color:#f1f1f2; box-shadow: 10px 10px 5px #888888;">
                <tr >
                <td colspan="3" style="width:200px;background-color:#33cc99">CLASS
                    <asp:RadioButtonList ID="rdlclass" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rdlclass_SelectedIndexChanged">
                       
                    </asp:RadioButtonList></td>
             </tr>
            </table>
            </asp:Panel>
             <asp:Panel ID="Panel3" runat="server" style="width:60px;padding-bottom:20px">
        <table style="border:solid black;width:400px;background-color:#f1f1f2; box-shadow: 10px 10px 5px #888888;">

            <tr >
                <td colspan="3" style="width:200px;background-color:#33cc99">LANGUAGE
                <asp:RadioButtonList ID="rdllanguage" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rdllanguage_SelectedIndexChanged" >
                       
                    </asp:RadioButtonList></td>
             </tr>
           

        </table>
    </asp:Panel>
            </td>
        <td style="width:60%">
            <div style="margin-left:100px;width:auto;height:500px;overflow:auto">
      <%--<asp:repeater ID="repeater1" runat="server" >
        <ItemTemplate>
            <table style="margin-left:700px;border:solid black;width:500px;height:25px; background-color:#f1f1f2; box-shadow: 10px 10px 5px #888888;overflow:auto">
                <tr><td rowspan="5" style="width:200px"><asp:Image ID="Image1" align="center" runat="server" Height="90" Width="90" ImageUrl='<%#"data:image;base64,"+Convert.ToBase64String((byte[])Eval("notes_image"))%>' style="height:200px;width:200px"/> </td>
                    <td style="width:200px">Name:<asp:Label ID="Name" runat="server" align="center" Text='<%# Eval("notes_name") %>'/></td></tr>
               <%-- <tr><td style="width:200px">Year:<asp:Label ID="Description" runat="server" Text='<%# Eval("m_paper_year") %>' /></td></tr>--%>
                <%--<tr><td style="width:200px">Class: <asp:Label ID="Class" runat="server" Text='<%# Eval("class_name") %>' /></td></tr>
                <tr><td style="width:200px">Language: <asp:Label ID="Label1" runat="server" Text='<%# Eval("lang_name") %>' /></td></tr>
                 <tr style="border-bottom:solid black"><td style="width:200px">
                     <a href="viewnotes.aspx?paper=<%# Eval("notes_file") %>&id=<%#Eval("notes_id") %>">Download</a>
 

                    </td></tr>
            </table>
        </ItemTemplate>
        
        </asp:repeater>--%>
                 <asp:GridView ID="gvr_notes" runat="server" AutoGenerateColumns="False" OnPageIndexChanging="gvr_notes_PageIndexChanging" AllowPaging="true" PageSize="4" style="text-align:center;" CellPadding="4" HeaderStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Height="50px" GridLines="Both" Width="100%">
                       <HeaderStyle ForeColor="black" Font-Bold="True" BackColor=" #33cc99" HorizontalAlign="Center" BorderWidth="3px"></HeaderStyle>
                    <Columns>
                         <asp:TemplateField HeaderText="Image" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center">
                             <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" Width="100px" Height="100px" ImageUrl='<%#"data:image;base64,"+Convert.ToBase64String((byte[])Eval("notes_image"))%>' />
                                </ItemTemplate>
                             </asp:TemplateField>
       <asp:BoundField DataField="notes_name" HeaderText="Notes Name"  SortExpression="notes_name" ItemStyle-HorizontalAlign="center" ItemStyle-Width="20%" />
       <%--<asp:BoundField DataField="notes_year" HeaderText="Notes Year" SortExpression="notes_year" ItemStyle-HorizontalAlign="center" ItemStyle-Width="20%" />--%>
       <asp:BoundField DataField="class_name" HeaderText="Class Name" SortExpression="class_name" ItemStyle-HorizontalAlign="center" ItemStyle-Width="20%"/>
       <asp:BoundField DataField="lang_name" HeaderText="Language Name" SortExpression="lang_name" ItemStyle-HorizontalAlign="center" ItemStyle-Width="20%"/>
                        <%--<asp:CommandField HeaderText="Download" ShowEditButton="True" ShowHeader="True" >
                        <a href="viewquestionpaper.aspx?paper=<%# Eval("paper_file") %>&id=<%#Eval("paper_id") %>"></a>--%>
                           <%-- </asp:CommandField>--%>
                        <asp:TemplateField HeaderText="Download">
            <ItemTemplate >
              
                <a href="viewnotes.aspx?paper=<%# Eval("notes_file") %>&id=<%#Eval("notes_id") %>"> Download</a>
            </ItemTemplate>
        </asp:TemplateField>
                    </Columns>
                   <PagerSettings Mode="Numeric" />
                     
                </asp:GridView>
    </div>
                </td></tr>

    </table>
    
        <%--  </asp:DataList>
         --%>
   
</asp:Content>


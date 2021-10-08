<%@ Page Title="" Language="C#" MasterPageFile="~/website/website_master.master" AutoEventWireup="true" CodeFile="viewmockpaper.aspx.cs" Inherits="website_viewmockpaper" %>

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
                    </asp:RadioButtonList>
                    

                </td>
                               </tr>
            </table>
          </asp:Panel>
             <asp:Panel ID="Panel2" runat="server" style="width:60px;padding-bottom:20px">
        <table style="border:solid black;width:400px;background-color:#f1f1f2; box-shadow: 10px 10px 5px #888888;">
                <tr >
                <td colspan="3" style="width:200px; background-color:#33cc99">CLASS
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
     

                <asp:GridView ID="gvr_mock" runat="server" AutoGenerateColumns="False" OnPageIndexChanging="gvr_mock_PageIndexChanging" AllowPaging="true" PageSize="4" style="text-align:center;" CellPadding="4" HeaderStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Height="50px" GridLines="Both">
                       <HeaderStyle ForeColor="black" Font-Bold="True" BackColor=" #33cc99" HorizontalAlign="Center" BorderWidth="3px"></HeaderStyle>
                    <Columns>
                         <asp:TemplateField HeaderText="Image" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center">
                             <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" Width="100px" Height="100px" ImageUrl='<%#"data:image;base64,"+Convert.ToBase64String((byte[])Eval("m_paper_img"))%>' />
                                </ItemTemplate>
                             </asp:TemplateField>
       <asp:BoundField DataField="m_paper_name" HeaderText="Paper Name"  SortExpression="m_paper_name" ItemStyle-HorizontalAlign="center" ItemStyle-Width="20%" />
       <asp:BoundField DataField="m_paper_year" HeaderText="Paper Year" SortExpression="m_paper_year" ItemStyle-HorizontalAlign="center" ItemStyle-Width="20%" />
       <asp:BoundField DataField="class_name" HeaderText="Class Name" SortExpression="class_name" ItemStyle-HorizontalAlign="center" ItemStyle-Width="20%"/>
       <asp:BoundField DataField="lang_name" HeaderText="Language Name" SortExpression="lang_name" ItemStyle-HorizontalAlign="center" ItemStyle-Width="20%"/>
                       

                        <asp:TemplateField HeaderText="Download">
            <ItemTemplate >
              
                <a href="viewmockpaper.aspx?paper=<%# Eval("m_paper_file") %>&id=<%#Eval("m_paper_id") %>"> Download</a>
            </ItemTemplate>
        </asp:TemplateField>
                    </Columns>
                   <PagerSettings Mode="Numeric" />
                     
                </asp:GridView>
            </div>
                </td></tr>

    </table>
    
     

</asp:Content>


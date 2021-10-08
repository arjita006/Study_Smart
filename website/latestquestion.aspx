<%@ Page Title="" Language="C#" MasterPageFile="~/website/website_master.master" AutoEventWireup="true" CodeFile="latestquestion.aspx.cs" Inherits="website_latestquestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin-left:390px; margin-top:50px;width:500px;height:250px;overflow:auto">
     <%-- <asp:repeater ID="repeater1" runat="server" >
        <ItemTemplate>
            <table style="margin-left:350px;border:solid black;width:500px;height:25px; background-color:#f1f1f2; box-shadow: 10px 10px 5px #888888;overflow:auto">
                <tr><td rowspan="5" style="width:200px">
                   <asp:Image ID="Image1" align="center" runat="server" Height="90" Width="90" ImageUrl='<%#"data:image;base64,"+Convert.ToBase64String((byte[])Eval("paper_image"))%>' style="height:200px;width:200px"/> </td>
                    <td style="width:200px">Name:<asp:Label ID="Name" runat="server" align="center" Text='<%# Eval("paper_name") %>'/></td></tr>
                <tr><td style="width:200px">Year:<asp:Label ID="Description" runat="server" Text='<%# Eval("paper_year") %>' /></td></tr>
                <tr><td style="width:200px">Class: <asp:Label ID="Class" runat="server" Text='<%# Eval("class_name") %>' /></td></tr>
                <tr><td style="width:200px">Language: <asp:Label ID="Label1" runat="server" Text='<%# Eval("lang_name") %>' /></td></tr>
                 <tr style="border-bottom:solid black"><td style="width:200px">
                     <a href="viewnotes.aspx?paper=<%# Eval("paper_file") %>&id=<%#Eval("paper_id") %>">Download</a>
 

                    </td></tr>
            </table>
        </ItemTemplate>
        
        </asp:repeater>--%>
         <asp:GridView ID="gvr_latestquestion" runat="server" AutoGenerateColumns="False" OnPageIndexChanging="gvr_latestquestion_PageIndexChanging" AllowPaging="true" PageSize="4" style="text-align:center;" CellPadding="4" HeaderStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Height="50px" GridLines="Both" Width="100%">
                       <HeaderStyle ForeColor="black" Font-Bold="True" BackColor=" #33cc99" HorizontalAlign="Center" BorderWidth="3px"></HeaderStyle>
                    <Columns>
                         <asp:TemplateField HeaderText="Image" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center">
                             <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" Width="100px" Height="100px" ImageUrl='<%#"data:image;base64,"+Convert.ToBase64String((byte[])Eval("paper_image"))%>' />
                                </ItemTemplate>
                             </asp:TemplateField>
      <%-- <asp:BoundField DataField="m_paper_name" HeaderText="Paper Name"  SortExpression="m_paper_name" ItemStyle-HorizontalAlign="center" ItemStyle-Width="20%" />
       <asp:BoundField DataField="m_paper_year" HeaderText="Paper Year" SortExpression="m_paper_year" ItemStyle-HorizontalAlign="center" ItemStyle-Width="20%" />--%>
       <asp:BoundField DataField="class_name" HeaderText="Class Name" SortExpression="class_name" ItemStyle-HorizontalAlign="center" ItemStyle-Width="20%"/>
       <asp:BoundField DataField="lang_name" HeaderText="Language Name" SortExpression="lang_name" ItemStyle-HorizontalAlign="center" ItemStyle-Width="20%"/>
                        <%--<asp:CommandField HeaderText="Download" ShowEditButton="True" ShowHeader="True" >
                        <a href="viewquestionpaper.aspx?paper=<%# Eval("paper_file") %>&id=<%#Eval("paper_id") %>"></a>--%>
                           <%-- </asp:CommandField>--%>
                        <asp:TemplateField HeaderText="Download" ItemStyle-Width="20%">
            <ItemTemplate >
              
                <a href="latestquestion.aspx?paper=<%# Eval("paper_file") %>&id=<%#Eval("paper_id") %>"> Download</a>
            </ItemTemplate>
        </asp:TemplateField>
                    </Columns>
                   <PagerSettings Mode="Numeric" />
                     
                </asp:GridView>
    </div>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/website/website_master.master" AutoEventWireup="true" CodeFile="viewcontent.aspx.cs" Inherits="website_viewcontent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="height:900px;width:100%;padding:2px;" >
        <tr>
        <td  style="border:solid;background-color:black;width:20%">
           <asp:Panel ID="Panel1" runat="server" style="height:100%; width: 100%;">
            <%--<asp:LinkButton ID="LinkButton1" runat="server" ForeColor="White" Font-Size="Larger">LinkButton</asp:LinkButton>--%>
        </asp:Panel>
            </td>
            
        
            <td style="width:60%">
        <asp:Panel ID="Panel2" runat="server" Style="height: 100%; width: 100%; padding-bottom: 20px; margin-right: 300px;border:solid;">
            <div class="grid_3 grid_5 agile">
                <%--<h3 style="height:100px;width:500px;text-align:center;margin-left:400px">Wells</h3>--%>

                <asp:Repeater ID="repeater1" runat="server"  >
                    <ItemTemplate>
                        <div class="well" style="height:auto; width: 100%; text-align: center; border-width:0px;background-color:white">
                            <%--		There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration--%>
                            <ul class="well" style="list-style-type: none;border-width:0px;background-color:white;text-align:left">
                                <li>
                                  <h3 style="font-family:Arial,BATAVIA;font-size:50px;font-weight:300">  <%#Eval("topic_name") %></h3>
                                </li>
                                <li style="font-family:Arial,BATAVIA;font-size:30px;font-weight:100">
                                    <%#Eval("answer") %>
                                </li>
                                <li>
                                    <asp:Image ID="Image1" align="center" runat="server" Height="90" Width="90" ImageUrl='<%#"data:image;base64,"+Convert.ToBase64String((byte[])Eval("image"))%>' style="height:200px;width:200px"/>
                                </li>
                            </ul>
                        </div>

                    </ItemTemplate>
                </asp:Repeater>

            </div>
        </asp:Panel>
                </td>
           
           <td style="width:20%">
               <div style="margin-left:50px;width:100%;height:100%;margin-top:70px">
        <asp:Panel ID="Panel3" runat="server">
            <br />
            <div style="text-align:center">
            <asp:LinkButton ID="lnkbtn9" runat="server" Font-Size="Medium"  OnClick="lkbtn9_Click" ForeColor="#ef5734" Font-Bold="true">Class 9</asp:LinkButton></div>
            <br />
            <br />
            <div style="text-align:center">
             <asp:LinkButton ID="lnkbtn10" runat="server" Font-Size="Medium" OnClick="lkbtn10_Click"  ForeColor="#ef5734" Font-Bold="true">Class 10</asp:LinkButton></div>
            <br />
            <br />
            <div style="text-align:center">
             <asp:LinkButton ID="lnkbtn11" runat="server" Font-Size="Medium"  OnClick="lkbtn11_Click"  ForeColor="#ef5734"  Font-Bold="true">Class 11</asp:LinkButton></div>
            <br />
            <br />
            <div style="text-align:center">
             <asp:LinkButton ID="lnkbtn12" runat="server" Font-Size="Medium"  OnClick="lkbtn12_Click"  ForeColor="#ef5734" Font-Bold="true">Class 12</asp:LinkButton></div>
            <br />
        </asp:Panel>
                   </div>
               </td>
            </tr>
         </table>
    <div>

    <div class="container" style="margin:1%;">
    <div class="row">
        <div class="col-lg-10" style="text-align:center">
            <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Feedback" OnClick="Button1_Click" />
               <%-- <asp:LinkButton ID="LinkButton1" runat="server" href="feedback.aspx" >Feedback</asp:LinkButton>
            --%></div>
      </div>
    </div>

    </div>
</asp:Content>


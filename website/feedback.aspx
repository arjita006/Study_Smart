<%@ Page Title="" Language="C#" MasterPageFile="~/website/website_master.master" AutoEventWireup="true" CodeFile="feedback.aspx.cs" Inherits="website_feedback" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%-- <style type="text/css">
.blankstar
{
background-image: url(images/blank_star.png);
width: 16px;
height: 16px;
}
.waitingstar
{
background-image: url(images/half_star.png);
width: 16px;
height: 16px;
}
.shiningstar
{
background-image: url(images/shining_star.png);
width: 16px;
height: 16px;
}
</style>--%>
  <div class="container">

        <div class="form-group" style="margin-left: 25%; background-color: #33cc99; width: 50%;height:500px">
            <div class="row">
                <div class="col-lg-8" style="text-align: center; margin-left: 15%;;margin-top:10%">
                    <font size="30%" color="#ef5734"> Feedback </font>
                </div>
            </div>
            <br />

            <div class="row">
                <div class="col-lg-8" style="margin-left: 15%">
                    <label class="sr-only" for="email">Name:</label>
                    <asp:TextBox ID="txtname" runat="server" class="form-control" placeholder="Enter your Name"></asp:TextBox>
                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" runat="server" TargetControlID="txtname" ValidChars="qwertyuioplkjhgfdsazxcvbnmMNBVCXZLKJHGFDSAPOIUYTREWQ ."></cc1:FilteredTextBoxExtender>

                </div>
            </div>
            </br>
          <div class="row">
              <div class="col-lg-8" style="margin-left: 15%">
                  <label class="sr-only" for="email">Email:</label>
                  <%--<input type="email" class="form-control" id="email" placeholder="Enter email"  name="email">--%>
                  <asp:TextBox ID="txtemail1" class="form-control" runat="server" placeholder="Enter your Email"></asp:TextBox>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Email address" ControlToValidate="txtemail1" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
              </div>
          </div>
            <%--<asp:Label ID="lblmessage" runat="server" Text="Message"></asp:Label>--%>
            <div class="row">
                <div class="col-lg-8" style="margin-left: 15%">
                    <label class="sr-only">Message:</label>
                    <asp:TextBox ID="txtmsg" Style="width:100%" class="form-control" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="5" placeholder="Your Message"></asp:TextBox>
                </div>

            </div>
            <br />
          
         <%--   <cc1:Rating ID="rate1" runat="server" StarCssClass="blankstar" CurrentRating="0" WaitingStarCssClass="waitingstar" FilledStarCssClass="shiningstar" EmptyStarCssClass="blankstar" OnChanged="rate1_Changed" ></cc1:Rating>--%>
            <%--<asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>--%>
           <%-- <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>--%>
             <%--<style type="text/css">
.blankstar
{
background-image: url(images/blank_star.png);
width: 16px;
height: 16px;
}
.waitingstar
{
background-image: url(images/half_star.png);
width: 16px;
height: 16px;
}
.shiningstar
{
background-image: url(images/shining_star.png);
width: 16px;
height: 16px;
}
</style>--%>
            
            <div class="row">
                <div class="col-lg-8" style="margin-left: 15%; margin-bottom: 5%;">
                    <asp:Button ID="Button1" class="btn btn-default" Style="background-color: #ef5734" runat="server" Text="Submit" OnClick="Button1_Click" />
                </div>
            </div>
        </div>
    </div>
    
</asp:Content>


<%@ Page Title="Recovery Password" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="RecoveryPassword.aspx.vb" Inherits="Trainee.RecoveryPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<fieldset class="changePassword">
<legend>Retrieve Password</legend>
<asp:Label id="Msg" runat="server" ForeColor="maroon" />
<table cellpadding="7">
   <tbody>
       <tr>
            <td>
                Username: <asp:Textbox id="UsernameTextBox" Columns="30" runat="server" AutoPostBack="True" />
                    <asp:RequiredFieldValidator id="UsernameRequiredValidator" runat="server"
                                                ControlToValidate="UsernameTextBox" ForeColor="red"
                                                Display="Static" ErrorMessage="Required" />
            </td>
       </tr>
       <tr>
            <td>
                Password Question: <b><asp:Label id="QuestionLabel" runat="server" /></b>
            </td>
        </tr>
        <tr>
            <td>
                Answer: <asp:TextBox id="AnswerTextBox" Columns="60" runat="server" Enabled="False" />
                  <asp:RequiredFieldValidator id="AnswerRequiredValidator" runat="server"
                                              ControlToValidate="AnswerTextBox" ForeColor="red"
                                              Display="Static" ErrorMessage="Required" Enabled="False" />
            </td>
       </tr>
       <tr>
        <td>
            <asp:Button id="ResetPasswordButton" Text="Reset Password" 
                      OnClick="ResetPassword_OnClick" runat="server" Enabled="False" />
        </td>
       </tr>
        </tbody>
    </table>
</fieldset>
</asp:Content>

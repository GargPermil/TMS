<%@ Page Title="Update Security Information" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="ChangeSecurityemail.aspx.vb" Inherits="Trainee.ChangeSecurityemail" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <h1>
      Update Security Information for
      <%=User.Identity.Name%>
    </h2>
    <asp:Label ID="Msg" ForeColor="maroon" runat="server" />
    <fieldset class="changePassword">
           <legend>Update Information</legend>
    <table cellpadding="3" border="0">
      <tr>
        <td>
          Password:</td>
        <td>
          <asp:TextBox ID="PasswordTextbox" runat="server" TextMode="Password" 
                Width="368px" /></td>
        <td>
          <asp:RequiredFieldValidator ID="OldPasswordRequiredValidator" runat="server" ControlToValidate="PasswordTextbox"
            ForeColor="red" Display="Static" ErrorMessage="Required" /></td>
      </tr>
      <tr>
      <td>E-mail Address:</td>
      <td><asp:TextBox id="EmailTextBox" MaxLength="128" Columns="30" runat="server" 
              Width="368px" /></td>
      <td><asp:RequiredFieldValidator id="EmailRequiredValidator" runat="server"
                                    ControlToValidate="EmailTextBox" ForeColor="red"
                                    Display="Static" ErrorMessage="Required" /></td>
      </tr>
      <tr>
        <td>
          New Password Question:</td>
        <td>
          <asp:TextBox ID="QuestionTextbox" MaxLength="256" runat="server" Width="368px" /></td>
        <td>
          <asp:RequiredFieldValidator ID="QuestionRequiredValidator" runat="server" ControlToValidate="QuestionTextbox"
            ForeColor="red" Display="Static" ErrorMessage="Required" /></td>
      </tr>
      <tr>
        <td>
          New Password Answer:</td>
        <td>
          <asp:TextBox ID="AnswerTextbox" MaxLength="128" runat="server" Width="368px" /></td>
        <td>
          <asp:RequiredFieldValidator ID="AnswerRequiredValidator" runat="server" ControlToValidate="AnswerTextbox"
            ForeColor="red" Display="Static" ErrorMessage="Required" /></td>
      </tr>
      <tr>
        <td>
        </td>
        <td>
          <asp:Button ID="ChangePasswordQuestionButton" Text="Change Password Question and Answer"
            OnClick="ChangePasswordQuestion_OnClick" runat="server" /></td>
      </tr>
    </table>
    </fieldset>
</asp:Content>

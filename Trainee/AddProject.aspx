<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master"
    CodeBehind="AddProject.aspx.vb" Inherits="Trainee.AddProject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <fieldset>
        <legend>Add Project</legend>
        <table cellspacing="5">
            <tr>
                <td>
                    Project Name
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" MaxLength="50"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please Enter Project Name"
                        ToolTip="Please Enter Project Name" ControlToValidate="TextBox1" ValidationGroup="Validation">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Project Name Properly."
                        ControlToValidate="TextBox1" ValidationGroup="Validation" ValidationExpression="([A-Za-z]+|\s)+">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Description
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" MaxLength="250"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Project Description"
                        ToolTip="Please Enter Project Description" ControlToValidate="TextBox2" ValidationGroup="Validation">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter Project Description Properly."
                        ControlToValidate="TextBox2" ValidationGroup="Validation" ValidationExpression="([A-Za-z]+|\s|\.)+">*</asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
        <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="Validation" runat="server" />
        <asp:Label ID="ErrorLabel" runat="server" /><br />
        <asp:Button ID="Submit1" runat="server" Text="Submit" ValidationGroup="Validation" />
        <asp:Button ID="Reset" runat="server" Text="Reset" />
    </fieldset>
</asp:Content>

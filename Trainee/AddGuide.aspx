<%@ Page Language="vb" Title="Add Guide" MasterPageFile="~/Site1.Master" AutoEventWireup="false" 
CodeBehind="AddGuide.aspx.vb" Inherits="Trainee.AddGuide1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ID="Content2">
    <fieldset>
        <legend>Add Guide</legend>
        <table cellspacing="5">
            <tr>
                <td>
                    Name
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" MaxLength="50"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please enter your name."
                        ToolTip="Please Enter Your Name" ControlToValidate="TextBox1" ValidationGroup="AddGuide">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Please enter your name properly."
                        ControlToValidate="TextBox1" ValidationExpression="([a-zA-Z])+\s([a-zA-z]+\s)?([a-zA-z])+" ValidationGroup="AddGuide">*
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Phone No.
                </td>
                <td>
                    <asp:TextBox ID="TextBox7" runat="server" MaxLength="10"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please enter your phone number."
                        ToolTip="Please Enter Your Phone Number" ControlToValidate="TextBox7" ValidationGroup="AddGuide">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Please enter your phone number properly."
                        ControlToValidate="TextBox7" ValidationExpression="^(\+?\d{1,4}[\s-])?(?!0+\s+,?$)\d{10}\s*,?$" ValidationGroup="AddGuide" >*
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    E-Mail
                </td>
                <td>
                    <asp:TextBox ID="TextBox8" runat="server" MaxLength="50"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please enter your E-Mail."
                        ToolTip="Please Enter Your E-Mail" ControlToValidate="TextBox8" ValidationGroup="AddGuide">*
                        </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter your E-Mail properly."
                        ControlToValidate="TextBox8" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="AddGuide">*
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    DOB (MM/DD/YY)
                </td>
                <td>
                    <asp:TextBox ID="TextBox10" runat="server" MaxLength="8"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Please enter your Date of Birth."
                        ToolTip="Please Enter Your Date of Birth" ControlToValidate="TextBox10" ValidationGroup="AddGuide">*
                        </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:CustomValidator ID="CustomValidator1" runat="server"  ErrorMessage="Please enter your Date of Birth properly." ControlToValidate="TextBox10"
                        ValidationGroup="AddGuide">*</asp:CustomValidator>
                </td>
            </tr>
        </table>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="AddGuide" />
        <asp:Label ID="ErrorLabel" runat="server" /><br />
        <asp:Button ID="Submit1" runat="server" Text="Submit" ValidationGroup="AddGuide" />
        <asp:Button ID="Reset" runat="server" Text="Reset" />
    </fieldset>
</asp:Content>

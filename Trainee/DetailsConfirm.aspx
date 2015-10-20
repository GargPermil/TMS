<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master"
    CodeBehind="DetailsConfirm.aspx.vb" Inherits="Trainee.DetailsConfirm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <fieldset>
        <legend>Enroll</legend>
        <table cellspacing="5">
            <tr>
                <td>
                    TraineeID
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" MaxLength="10"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please Enter your TraineeID"
                        ToolTip="Please Enter your TraineeID" ControlToValidate="TextBox1" ValidationGroup="Detail_View">*
                    </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="Detail_View"
                    ControlToValidate="TextBox1" ErrorMessage="Enter Trainee Id in Proper Format" ValidationExpression="\d{1,10}">*
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    DOB (MM/DD/YYYY)
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" MaxLength="10"></asp:TextBox>
                </td>
                <td>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Enter Date in Proper Format"
                        ToolTip="Enter Date in Proper Format" ControlToValidate="TextBox2" ValidationGroup="Detail_View">*
                    </asp:CustomValidator>
                </td>
            </tr>
            <%--<tr>
<td>Random Generated Number</td>
<td><asp:TextBox ID="TextBox3" runat="server" MaxLength="8"></asp:TextBox></td>
<td>
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Random Generated Number" ToolTip="Please Enter  Random Generated Number" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
</td>
</tr>--%>
        </table>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Detail_View" />
        <asp:Label ID="ErrorLabel" runat="server" ForeColor="Red" /><br />
        <asp:Button ID="Submit1" runat="server" Text="Submit" ValidationGroup="Detail_View" />
        <asp:Button ID="Reset" runat="server" Text="Reset" />
    </fieldset>
</asp:Content>

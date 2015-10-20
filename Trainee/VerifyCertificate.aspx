<%@ Page Title="Verify Certificate" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master"
    CodeBehind="VerifyCertificate.aspx.vb" Inherits="Trainee.VerifyCertificate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <fieldset>
    <legend><h1>Verify Certificate</h1></legend>
        <table cellpadding="5" cellspacing="5">
            <tr>
                <td>
                    <span>Certificate Ref No.</span>
                </td>
                <td>
                    <asp:TextBox ID="certino" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Certificate Reference Number"
                        ControlToValidate="certino" ValidationGroup="verifycertificate">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Certificate Reference Number properly."
                        ControlToValidate="certino" ValidationGroup="verifycertificate" ValidationExpression="\d+">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <span>Name</span>
                </td>
                <td>
                    <asp:TextBox ID="cername" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter name of trainee"
                        ControlToValidate="cername" ValidationGroup="verifycertificate">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter name of trainee properly."
                        ControlToValidate="cername" ValidationGroup="verifycertificate" ValidationExpression="([a-zA-Z])+\s([a-zA-z]+\s)?([a-zA-z])+">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <span>Course</span>
                </td>
                <td>
                    <asp:TextBox ID="cercourse" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter trainee's course"
                        ControlToValidate="cercourse" ValidationGroup="verifycertificate">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <span>Issue Date</span> (MM/DD/YY)
                </td>
                <td>
                    <asp:TextBox ID="cerdate" runat="server" MaxLength="8"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Issuing Date of Certificate"
                        ControlToValidate="cerdate" ValidationGroup="verifycertificate">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Verify" ValidationGroup="verifycertificate" />
                </td>
            </tr>
        </table>
    </fieldset>
    <div style="width: 100%; height: 150px">
        <asp:Panel ID="statuspan" runat="server" Visible="False">
            <h1>
                <asp:Label ID="Status" runat="server"></asp:Label></h1>
            <asp:Image ID="statusimg" runat="server" Width="100px" Height="100px" />
        </asp:Panel>
    </div>
</asp:Content>

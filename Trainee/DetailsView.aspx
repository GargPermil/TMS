<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master"
    CodeBehind="DetailsView.aspx.vb" Inherits="Trainee.DetailsView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <fieldset>
        <legend>Trainee Informations</legend>
        <div>
            <h1 style="margin-bottom: 0px; margin-top: 0;">
                <asp:Label ID="Name" runat="server" Text="Label"></asp:Label></h1>
            <div style="display: inline-block; width: 300px;">
                <asp:Label ID="Course" runat="server" Text="Label"></asp:Label>
                <br />
                <span>Guide : </span>
                <asp:Label ID="Guide" runat="server" Text="Label"></asp:Label>
            </div>
            <div style="display: inline-block; width: 300px;">
                <asp:Label ID="Univerity" runat="server" Text="Label"></asp:Label>
                <br />
                <asp:Label ID="Email" runat="server" Text="Label"></asp:Label>
            </div>
            <div style="display: inline-block; width: 300px;">
                <span>Status : </span>
                <asp:Label ID="Status" runat="server" Text="Label"></asp:Label>
                <br />
                <asp:Label ID="Duration" runat="server" Text="Label"></asp:Label>
                <br />
            </div>
            <div style="margin-top:10px;"><asp:Button ID="Button1" runat="server" Text="Button" /></div>
        </div>
    </fieldset>
    <asp:Panel ID="Panel1" runat="server">
        <fieldset>
            <legend>Project Details</legend>
            <div>
                <asp:Label ID="ProjectName" runat="server" Text="" Font-Bold="True"></asp:Label>
                <p>
                    <asp:Label ID="ProjectDesription" runat="server" Text=""></asp:Label></p>
            </div>
            <div>
                <asp:Label ID="ProjectName1" runat="server" Text="" Font-Bold="True"></asp:Label>
                <p>
                    <asp:Label ID="ProjectDesription1" runat="server" Text=""></asp:Label></p>
            </div>
            <div>
                <asp:Label ID="ProjectName2" runat="server" Text="" Font-Bold="True"></asp:Label>
                <p>
                    <asp:Label ID="ProjectDesription2" runat="server" Text=""></asp:Label></p>
            </div>
            <div>
                <asp:Label ID="ProjectName3" runat="server" Text="" Font-Bold="True"></asp:Label>
                <p>
                    <asp:Label ID="ProjectDesription3" runat="server" Text=""></asp:Label></p>
            </div>
        </fieldset>
    </asp:Panel>
    <%--<table>
<tr>
<td><asp:Label ID="StartDate" runat="server" Text="88/88/8888"></asp:Label></td>
<td>&nbsp;&nbsp;&nbsp; &nbsp</td>
<td>-</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp</td>
<td><asp:Label ID="TargetDate" runat="server" Text="88/888/8888"></asp:Label></td>
</tr>
</table>--%>
</asp:Content>

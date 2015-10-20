<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="AssignProject.aspx.vb" Inherits="Trainee.AssignProject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Assign Projects to Student</h1>
        <p>Select Student</p>
        <asp:DropDownList ID="DropDownList2" runat="server" 
        DataSourceID="SqlDataSource2" Height="25px" Width="185px" 
        DataTextField="Name" DataValueField="StudentID">
         </asp:DropDownList>
        <p>Select Project</p>
        <asp:DropDownList ID="DropDownList1" runat="server" 
        DataSourceID="SqlDataSource1" Height="25px" Width="185px" 
        DataTextField="ProjectName" DataValueField="ProjectID">
         </asp:DropDownList> <span style="margin-left:30px;">
             <a href="AddProject.aspx?ReturnUrl=1" style="text-decoration:none;">+</a></span>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT ProjectID,ProjectName FROM Project">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT StudentID, Name FROM Student">
    </asp:SqlDataSource>
    <p><asp:Label ID="ErrorLabel" runat="server" /></p>
    <asp:Button ID="Button1" runat="server" Text="Submit" />
</asp:Content>

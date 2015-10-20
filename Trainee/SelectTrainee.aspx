<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="SelectTrainee.aspx.vb" Inherits="Trainee.SelectTrainee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Select Trainee</h1>
    <fieldset>
    <legend>Select Trainee</legend>
    <asp:DropDownList ID="DropDownList1" runat="server" Height="22px" Width="299px" 
        DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="StudentID">
    </asp:DropDownList>
    <br/><br/><asp:Button ID="Button1" runat="server" Text="Submit" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [StudentID], [Name] FROM [Student]">
    </asp:SqlDataSource>
    </fieldset>
</asp:Content>

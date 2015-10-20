<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="Default1.aspx.vb" Inherits="Trainee.Default1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Welcome to <asp:Label runat="server" ID="UserName" /></h1>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" 
        BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
        CellPadding="3" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" 
                SortExpression="Name" />
            <asp:BoundField DataField="Course" HeaderText="Course" 
                SortExpression="Course" />
            <asp:BoundField DataField="Col" HeaderText="Col" 
                SortExpression="Col" />
            <asp:BoundField DataField="University" HeaderText="University" 
                SortExpression="University" />
            <asp:BoundField DataField="Duration" HeaderText="Duration" 
                SortExpression="Duration" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" 
                SortExpression="Phone" />
            <asp:BoundField DataField="Email" HeaderText="Email" 
                SortExpression="Email" />
            <asp:BoundField DataField="Guidance" HeaderText="Guidance" 
                SortExpression="Guidance" />
            <asp:BoundField DataField="Column1" HeaderText="Column1" 
                SortExpression="Column1" ReadOnly="True" />
        </Columns>
        <EmptyDataTemplate>
            No record Found
        </EmptyDataTemplate>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        SelectCommand="SELECT [Name], [Course], [Col], [University], [Duration], [Phone], [Email], [Guidance], convert(varchar,[DOB],101) FROM [Student]"></asp:SqlDataSource>
</asp:Content>

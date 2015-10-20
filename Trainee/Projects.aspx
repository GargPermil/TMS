<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="Projects.aspx.vb" Inherits="Trainee.Projets" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Projects</h1>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#999999" 
        BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" 
        GridLines="Vertical" DataKeyNames="ProjectID">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:CommandField ButtonType="Button" ShowEditButton="True" />
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
            <asp:BoundField DataField="ProjectID" HeaderText="ProjectID" 
                SortExpression="ProjectID" ReadOnly="True" />
            <asp:BoundField DataField="ProjectName" HeaderText="ProjectName" 
                SortExpression="ProjectName" />
            <asp:BoundField DataField="ProjectDescription" HeaderText="ProjectDescription" 
                SortExpression="ProjectDescription" />
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
        SelectCommand="SELECT * FROM [Project]"
        UpdateCommand="UPDATE [Project] Set [ProjectName]=@ProjectName,[ProjectDescription]=@ProjectDescription Where [ProjectID]=@ProjectID"
        DeleteCommand="Delete From Project Where ProjectID=@ProjectID">
            <UpdateParameters>
                <asp:Parameter Name="ProjectName" Type="String" />
                <asp:Parameter Name="ProjectDescription" Type="String" />
                <asp:Parameter Name="ProjectID" Type="String"   />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="ProjectID" Type="String" />
            </DeleteParameters>
        </asp:SqlDataSource>
</asp:Content>

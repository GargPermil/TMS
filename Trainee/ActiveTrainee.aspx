<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="ActiveTrainee.aspx.vb" Inherits="Trainee.ActiveTrainee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Active Trainee</h1>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
        BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
        CellPadding="3" DataSourceID="SqlDataSource1" ForeColor="Black" 
        GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" 
                SortExpression="ID" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Course" HeaderText="Course" 
                SortExpression="Course" />
            <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
            <asp:BoundField DataField="Col" HeaderText="Col" SortExpression="Col" />
            <asp:BoundField DataField="University" HeaderText="University" 
                SortExpression="University" />
            <asp:BoundField DataField="Duration" HeaderText="Duration" 
                SortExpression="Duration" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Guidance" HeaderText="Guidance" 
                SortExpression="Guidance" />
            <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" 
                ReadOnly="True" />
            <asp:BoundField DataField="JoinDate" HeaderText="JoinDate" 
                SortExpression="JoinDate" ReadOnly="True" />
            <asp:BoundField DataField="Period" HeaderText="Period" 
                SortExpression="Period" />
            <asp:BoundField DataField="EndDate" HeaderText="EndDate" 
                SortExpression="EndDate" ReadOnly="True" />
        </Columns>
        <EmptyDataTemplate>
            No Active Trainee
        </EmptyDataTemplate>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="Gray" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        SelectCommand="SELECT Student.StudentID as ID, Student.Name, Student.Course, Student.Year, Student.Col, Student.University, Student.Duration, Student.Phone, Student.Email, Student.Guidance, convert(varchar,Student.DOB,101) as DOB, convert(varchar,TraineeDuration.JoinDate,101) as JoinDate, TraineeDuration.Period, convert(varchar,TraineeDuration.EndDate,101) as EndDate FROM Student RIGHT OUTER JOIN TraineeDuration ON Student.StudentID = TraineeDuration.TraineeID WHERE (TraineeDuration.EndDate &gt; @ENDDATE)">
        <SelectParameters>
            <asp:Parameter Name="EndDate" DefaultValue="" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

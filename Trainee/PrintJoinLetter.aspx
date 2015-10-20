<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="PrintJoinLetter.aspx.vb" Inherits="Trainee.PrintJoinLetter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="margin-bottom:5px;">Print Letter</h1>
    <table cellspacing="10">
        <tbody>
            <tr>
                <td>
                    <p style="margin-bottom:0px; margin-top:0px">Select Date</p>
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" 
                        BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" 
                        Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="160px" 
                        ShowGridLines="True" Width="160px">
                        <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                        <OtherMonthDayStyle ForeColor="#CC9966" />
                        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                        <SelectorStyle BackColor="#FFCC66" />
                        <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" 
                        ForeColor="#FFFFCC" />
                        <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                    </asp:Calendar>
                    <asp:Label ID="ErrLabel" runat="server" Text=""></asp:Label>
                    <p><asp:Button ID="Button1" runat="server" Text="Submit" /></p>
                </td>
                <td>
                    <p style="margin-bottom:0px; margin-top:0px">List of Students</p>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                        AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
                        BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
                        DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Course" HeaderText="Course" 
                            SortExpression="Course" />
                            <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
                            <asp:BoundField DataField="Col" HeaderText="Col" SortExpression="Col" />
                            <asp:BoundField DataField="University" HeaderText="University" 
                            SortExpression="University" />
                            <asp:BoundField DataField="Duration" HeaderText="Duration" 
                            SortExpression="Duration" />
                            <asp:BoundField DataField="JoinDate" HeaderText="JoinDate" 
                            SortExpression="JoinDate" />
                            <asp:BoundField DataField="EndDate" HeaderText="EndDate" 
                            SortExpression="EndDate" />
                        </Columns>
                        <EmptyDataTemplate>
                            No Record Found
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
                        SelectCommand="SELECT Student.Name, Student.Course, Student.Year, Student.Col, Student.University, TraineeDuration.Period as Duration, TraineeDuration.JoinDate, TraineeDuration.EndDate FROM Student INNER JOIN TraineeDuration ON Student.StudentID = TraineeDuration.TraineeID WHERE (TraineeDuration.JoinDate = @Date)">
                        <SelectParameters>
                            <asp:Parameter Name="Date" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <p><asp:Button ID="Button2" runat="server" Text="Print" /></p>
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>

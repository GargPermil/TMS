<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master"
    CodeBehind="Search.aspx.vb" Inherits="Trainee.Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>
        Search</h2>
    <p>
        Search By :
        <br />
        <span>NAME : </span><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <span>Course : </span><asp:DropDownList ID="DropDownList1" runat="server" 
            DataSourceID="SqlDataSource2" DataTextField="Course" DataValueField="Course">
        </asp:DropDownList>
        <span>Year :</span><asp:TextBox ID="TextBox2" runat="server" Width="30px"></asp:TextBox>
        <span>College :</span><asp:TextBox ID="TextBox3" runat="server" Width="100px"></asp:TextBox>
        <span>University :</span><asp:TextBox ID="TextBox4" runat="server" Width="100px"></asp:TextBox>
        <span>Phone :</span><asp:TextBox ID="TextBox6" runat="server" Width="90px"></asp:TextBox><br />
        <span>E-Mail :</span><asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
        <span>Guidance :</span><asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
        <span>DOB :</span><asp:TextBox ID="TextBox9" runat="server" Width="59px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Search" />
    </p>
    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999"
        BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical"
        AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True"
        AllowSorting="True">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="StudentID" HeaderText="StudentID" SortExpression="StudentID" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Course" HeaderText="Course" SortExpression="Course" />
            <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
            <asp:BoundField DataField="Col" HeaderText="Col" SortExpression="Col" />
            <asp:BoundField DataField="University" HeaderText="University" SortExpression="University" />
            <asp:BoundField DataField="Duration" HeaderText="Duration" SortExpression="Duration" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Guidance" HeaderText="Guidance" SortExpression="Guidance" />
            <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" 
                ReadOnly="True" />
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
   <%-- convert(varchar,dob,103) as dobdate...........dd/mm/yyyy--%>
     <%--SelectCommand="SELECT * FROM [Student] WHERE (([Name] LIKE '%' + @Name + '%') OR ([Course] = @Course) OR ([Year] = @Year) OR ([Col] = @Col) OR ([University] LIKE '%' + @University + '%') OR ([Duration] = @Duration) OR ([Phone] = @Phone) OR ([Guidance] LIKE '%' + @Guidance + '%') OR ([DOB] = @DOB) OR ([Email] LIKE '%' + @Email + '%'))">--%>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT StudentID, Name, Course, Year, Col, University, Duration, Phone, Email, Guidance, Convert(varchar,DOB,103) as DOB FROM [Student]">
        <FilterParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="Name" PropertyName="Text" Type="String"
                ConvertEmptyStringToNull="false" />
            <asp:ControlParameter ControlID="DropDownList1" Name="Course" PropertyName="SelectedValue"
                ConvertEmptyStringToNull="false" />
            <asp:ControlParameter ControlID="TextBox2" Name="Year" PropertyName="Text" Type="Empty"
                ConvertEmptyStringToNull="false" />
            <asp:ControlParameter ControlID="TextBox3" Name="Col" PropertyName="Text"
                ConvertEmptyStringToNull="false" />
            <asp:ControlParameter ControlID="TextBox4" Name="University" PropertyName="Text"
                ConvertEmptyStringToNull="false" />
            <asp:ControlParameter ControlID="TextBox6" Name="Phone" PropertyName="Text" Type="Empty"
                ConvertEmptyStringToNull="false" />
            <asp:ControlParameter ControlID="TextBox8" Name="Guidance" PropertyName="Text"
                ConvertEmptyStringToNull="false" />
            <asp:ControlParameter ControlID="TextBox9"  Name="DOB" PropertyName="Text"
                ConvertEmptyStringToNull="false" />
            <asp:ControlParameter ControlID="TextBox7" Name="Email" PropertyName="Text"
                ConvertEmptyStringToNull="false" />
        </FilterParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [Course] FROM [Course]"></asp:SqlDataSource>
</asp:Content>

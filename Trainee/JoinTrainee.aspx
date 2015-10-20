<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master"
    CodeBehind="JoinTrainee.aspx.vb" Inherits="Trainee.JoinTrainee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>
        Join Trainee</h1>
    <div>
        Name Of Trainee</div>
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1"
        DataTextField="Name" DataValueField="StudentID" Height="22px" Width="218px">
    </asp:DropDownList>
    <div>
        <br />
        Select Join Date</div>
    <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66"
        BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"
        ForeColor="#663399" Height="200px" ShowGridLines="True" Width="217px">
        <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
        <OtherMonthDayStyle ForeColor="#CC9966" />
        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
        <SelectorStyle BackColor="#FFCC66" />
        <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
        <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
    </asp:Calendar>
    <br />
    <div>
        Enter Duration</div>
    <asp:TextBox ID="TextBox1" runat="server" MaxLength="2"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Duration"
        ValidationGroup="jointrainee" ControlToValidate="TextBox1">*</asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Duration Numeric only"
        ControlToValidate="TextBox1" ValidationGroup="jointrainee" ValidationExpression="\d+">*</asp:RegularExpressionValidator>
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="jointrainee" />
    <asp:Label ID="errorLabel" runat="server"></asp:Label><br />
    <asp:Button ID="Button1" runat="server" Text="Submit" ValidationGroup="jointrainee" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT [StudentID], [Name], [Course] FROM [Student]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT * FROM [TraineeDuration]" InsertCommand="INSERT INTO TRAINEEDURATION VALUES (@TRAINEEID,@JOINDATE,@PERIOD,@ENDDATE, @ID)">
        <InsertParameters>
            <asp:Parameter Name="TraineeID" />
            <asp:Parameter Name="JoinDate" Type="DateTime" />
            <asp:Parameter Name="Period" Type="Int16" />
            <asp:Parameter Name="ENDDate" Type="DateTime" />
            <asp:Parameter Name="ID" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>

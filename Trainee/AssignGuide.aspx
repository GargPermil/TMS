<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master"
    CodeBehind="AssignGuide.aspx.vb" Inherits="Trainee.AddGuide" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>
        Add Guide to Student</h1>
    <div style="display: inline">
        <div style="display: inline-block;max-height: 350px;">
            <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2"
                DataTextField="Name" DataValueField="Name" Height="300px" Width="250px"></asp:ListBox>
            <p>
                * Select Guide From List</p>
        </div>
        <div style="display: inline-block; min-height: 350px; vertical-align:top; margin-left:20px;" >
            <span>Course : </span ><br/><asp:DropDownList ID="DropDownList1" runat="server" 
                Height="25px" Width="150px" DataSourceID="SqlDataSource1" AutoPostBack="true"
                DataTextField="Course" DataValueField="Course">
            </asp:DropDownList>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" BackColor="White"  Width="150px"
                BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
                ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:TemplateField HeaderText="Select" SortExpression="Select">
                        <ItemTemplate>
                            <asp:CheckBox ID="Selected" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
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
            </asp:GridView><br/>
            <asp:Button ID="Button2" runat="server" Text="Check" />
            <asp:Button ID="Button3" runat="server" Text="Uncheck All" />
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT [Course] FROM [Course]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT [Name] FROM [Guide]"></asp:SqlDataSource>
    <p>
        <asp:Label ID="ErrorLabel" runat="server" /></p>
    <asp:Button ID="Button1" runat="server" Text="Submit" />
</asp:Content>

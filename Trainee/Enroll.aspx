<%@ Page Language="vb" Title="Enroll" MasterPageFile="~/Site1.Master" AutoEventWireup="false"
    CodeBehind="Enroll.aspx.vb" Inherits="Trainee.Enroll" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ID="Content2">
    <fieldset>
        <legend>Enroll</legend>
        <table cellspacing="5">
            <tr>
                <td>
                    Name
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" MaxLength="50"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please enter your name."
                        ToolTip="Please Enter Your Name" ControlToValidate="TextBox1" ValidationGroup="TraineeEnroll">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Please enter your name properly."
                        ControlToValidate="TextBox1" ValidationExpression="([a-zA-Z])+\s([a-zA-z]+\s)?([a-zA-z])+"
                        ValidationGroup="TraineeEnroll">*
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Course
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" MaxLength="10"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Your Course"
                        ToolTip="Please Enter Your Course" ControlToValidate="TextBox2" ValidationGroup="TraineeEnroll">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Year
                </td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server" MaxLength="1"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter your course year."
                        ToolTip="Please Enter Your Year" ControlToValidate="TextBox3" ValidationGroup="TraineeEnroll">*
                    </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Please enter your course year properly."
                        ControlToValidate="TextBox3" ValidationExpression="[2-4]{1}" ValidationGroup="TraineeEnroll">*
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    College
                </td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server" MaxLength="50"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter your college name."
                        ToolTip="Please Enter Your College Name" ControlToValidate="TextBox4" ValidationGroup="TraineeEnroll">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="Please enter your college name properly."
                        ControlToValidate="TextBox4" ValidationExpression="[a-zA-z]+" ValidationGroup="TraineeEnroll">*
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    University
                </td>
                <td>
                    <asp:TextBox ID="TextBox5" runat="server" MaxLength="50"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter your university name."
                        ToolTip="Please Enter Your University" ControlToValidate="TextBox5" ValidationGroup="TraineeEnroll">*
                    </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="Please enter your university name properly."
                        ControlToValidate="TextBox5" ValidationExpression="[a-zA-z]+" ValidationGroup="TraineeEnroll">*
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Duration (in Days)
                </td>
                <td>
                    <asp:TextBox ID="TextBox6" runat="server" MaxLength="3"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please enter duration of training."
                        ToolTip="Please Enter Duration of Training" ControlToValidate="TextBox6" ValidationGroup="TraineeEnroll">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Please enter duration of training properly."
                        ControlToValidate="TextBox6" ValidationExpression="[0-9]{1,3}" ValidationGroup="TraineeEnroll">*
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Phone No.
                </td>
                <td>
                    <asp:TextBox ID="TextBox7" runat="server" MaxLength="10"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please enter your phone number."
                        ToolTip="Please Enter Your Phone Number" ControlToValidate="TextBox7" ValidationGroup="TraineeEnroll">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Please enter your phone number properly."
                        ControlToValidate="TextBox7" ValidationExpression="^(\+?\d{1,4}[\s-])?(?!0+\s+,?$)\d{10}\s*,?$"
                        ValidationGroup="TraineeEnroll">*
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    E-Mail
                </td>
                <td>
                    <asp:TextBox ID="TextBox8" runat="server" MaxLength="50"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please enter your E-Mail."
                        ToolTip="Please Enter Your E-Mail" ControlToValidate="TextBox8" ValidationGroup="TraineeEnroll">*
                    </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter your E-Mail properly."
                        ControlToValidate="TextBox8" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ValidationGroup="TraineeEnroll">*
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    DOB (MM/DD/YY)
                </td>
                <td>
                    <asp:TextBox ID="TextBox10" runat="server" MaxLength="8"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Please enter your Date of Birth."
                        ToolTip="Please Enter Your Date of Birth" ControlToValidate="TextBox10" ValidationGroup="TraineeEnroll">*
                    </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Enter Date in Proper Format"
                        ToolTip="Enter Date in Proper Format" ControlToValidate="TextBox10" ValidationGroup="TraineeEnroll">*
                    </asp:CustomValidator>
                </td>
            </tr>
        </table>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="TraineeEnroll" />
        <asp:Label ID="ErrorLabel" runat="server" /><br />
        <asp:Button ID="Submit1" runat="server" Text="Submit" ValidationGroup="TraineeEnroll" />
        <asp:Button ID="Reset" runat="server" Text="Reset" />
    </fieldset>
</asp:Content>

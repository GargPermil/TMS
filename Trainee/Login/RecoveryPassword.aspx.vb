Public Class RecoveryPassword
    Inherits System.Web.UI.Page

    Dim u As MembershipUser

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Membership.EnablePasswordReset Then
            FormsAuthentication.RedirectToLoginPage()
        End If

        Msg.Text = ""

        If Not IsPostBack Then
            Msg.Text = "Please supply a username."
        Else
            VerifyUsername()
        End If
    End Sub

    Public Sub VerifyUsername()
        u = Membership.GetUser(UsernameTextBox.Text, False)

        If u Is Nothing Then
            Msg.Text = "Username " & Server.HtmlEncode(UsernameTextBox.Text) & " not found. Please check the value and re-enter."

            QuestionLabel.Text = ""
            QuestionLabel.Enabled = False
            AnswerTextBox.Enabled = False
            ResetPasswordButton.Enabled = False
        Else
            QuestionLabel.Text = u.PasswordQuestion
            QuestionLabel.Enabled = True
            AnswerTextBox.Enabled = True
            ResetPasswordButton.Enabled = True
        End If
    End Sub

    Public Sub ResetPassword_OnClick(ByVal sender As Object, ByVal args As EventArgs)
        Dim newPassword As String
        u = Membership.GetUser(UsernameTextBox.Text, False)

        If u Is Nothing Then
            Msg.Text = "Username " & Server.HtmlEncode(UsernameTextBox.Text) & " not found. Please check the value and re-enter."
            Return
        End If

        Try
            newPassword = u.ResetPassword(AnswerTextBox.Text)
        Catch e As MembershipPasswordException
            Msg.Text = "Invalid password answer. Please re-enter and try again."
            Return
        Catch e As Exception
            Msg.Text = e.Message
            Return
        End Try

        If Not newPassword Is Nothing Then
            Msg.Text = "Password reset. Your new password is: " & Server.HtmlEncode(newPassword)
        Else
            Msg.Text = "Password reset failed. Please re-enter your values and try again."
        End If
    End Sub
End Class
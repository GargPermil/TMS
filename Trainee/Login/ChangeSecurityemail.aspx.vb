Public Class ChangeSecurityemail
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Msg.Text = "" Then
            Msg.Visible = False
        Else
            Msg.Visible = True
        End If
        Dim tmpmenu As Menu = Master.FindControl("Menu1")
        tmpmenu.Items(0).Selected = True
        tmpmenu = Master.FindControl("Menu2")
        tmpmenu.Items(5).Selected = True
    End Sub

    Public Sub ChangePasswordQuestion_OnClick(ByVal sender As Object, ByVal args As EventArgs) Handles ChangePasswordQuestionButton.Click
        Try
            Dim u As MembershipUser = Membership.GetUser(User.Identity.Name)
            Dim result As Boolean
            result = u.ChangePasswordQuestionAndAnswer(PasswordTextbox.Text, _
                                     QuestionTextbox.Text, AnswerTextbox.Text)
            u.Email = EmailTextBox.Text
            If (result = True) Then
                Membership.UpdateUser(u)
                Msg.Text = "Password Question and Answer changed and Email Updated."
                EmailTextBox.Text = ""
                QuestionTextbox.Text = ""
                AnswerTextbox.Text = ""
            End If
        Catch e As Exception
            Msg.Text = "Please re-enter your values and try again."
        End Try
    End Sub
End Class
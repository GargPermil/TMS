Public Class Default1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.User.Identity.IsAuthenticated = False Then
            Response.Redirect("Default.aspx")
        End If
        Dim u As MembershipUser
        u = Membership.GetUser()
        UserName.Text = u.UserName
        Dim tmpmenu As Menu = Master.FindControl("Menu1")
        tmpmenu.Items(0).Selected = True
        tmpmenu = Master.FindControl("Menu2")
        tmpmenu.Items(0).Selected = True
    End Sub

End Class
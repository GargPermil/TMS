Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.User.Identity.IsAuthenticated = True Then
            Response.Redirect("Default1.aspx")
        End If
        Dim tmpmenu As Menu = Master.FindControl("Menu1")
        tmpmenu.Items(0).Selected = True
    End Sub

End Class
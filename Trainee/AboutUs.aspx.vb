Public Partial Class AboutUs
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim tmpmenu As Menu = Master.FindControl("Menu1")
        tmpmenu.Items(1).Selected = True
    End Sub

End Class
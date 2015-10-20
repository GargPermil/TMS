Public Partial Class Site1
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.User.Identity.IsAuthenticated = False Then
            SubMenuPanel.Visible = False
        Else
            SubMenuPanel.Visible = True
            WinContent.Style.Add("display", "inline-block")
        End If
    End Sub
End Class
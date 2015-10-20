Public Class PrintJoinLetter
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.User.Identity.IsAuthenticated = False Then
            Response.Redirect("Default.aspx")
        End If
        Dim tmpmenu As Menu = Master.FindControl("Menu1")
        tmpmenu.Items(0).Selected = True
        tmpmenu = Master.FindControl("Menu2")
        tmpmenu.Items(5).Selected = True
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        Dim DSA As DataSourceSelectArguments = New DataSourceSelectArguments()
        SqlDataSource1.Select(DSA)
        GridView1.DataBind()
    End Sub

    Protected Sub SqlDataSource1_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting
        If Calendar1.SelectedDate.Year < 2015 Then
            Calendar1.SelectedDate = Date.Today.Date
        End If
        e.Command.Parameters(0).Value = Calendar1.SelectedDate
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button2.Click

    End Sub

    Protected Sub Calendar1_SelectionChanged(ByVal sender As Object, ByVal e As EventArgs) Handles Calendar1.SelectionChanged
        If Calendar1.SelectedDate < Today.AddDays(-10) Then
            ErrLabel.Text = "Not Support Previous Dates"
            Calendar1.SelectedDate = Today
        Else
            ErrLabel.Text = ""
        End If
    End Sub
End Class
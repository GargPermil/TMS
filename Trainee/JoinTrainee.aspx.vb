Public Class JoinTrainee
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.User.Identity.IsAuthenticated = False Then
            Response.Redirect("Default.aspx")
        End If
        Dim tmpmenu As Menu = Master.FindControl("Menu1")
        tmpmenu.Items(0).Selected = True
        tmpmenu = Master.FindControl("Menu2")
        tmpmenu.Items(3).Selected = True
        Calendar1.SelectedDate = Today
    End Sub

    Private Sub SqlDataSource2_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource2.Inserting
        Dim Constr As String = "data source=.\SQLEXPRESS;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\Database.mdf;User Instance=true;"
        Dim CmdStr As String = "Select Max(ID) from TraineeDuration"
        Dim Con As SqlClient.SqlConnection = New SqlClient.SqlConnection(Constr)
        Dim Cmd As SqlClient.SqlCommand = New SqlClient.SqlCommand(CmdStr, Con)
        Dim ID As String = Nothing
        Try
            Con.Open()
            ID = Cmd.ExecuteScalar.ToString()
            If ID = Nothing Then
                ID = 1
            Else
                ID += 1
            End If
        Catch Ex As Exception
            errorLabel.Text = Ex.Message
        Finally
            Con.Close()
        End Try
        e.Command.Parameters(0).Value = DropDownList1.SelectedValue
        e.Command.Parameters(1).Value = Calendar1.SelectedDate.Date
        e.Command.Parameters(2).Value = TextBox1.Text
        e.Command.Parameters(3).Value = Calendar1.SelectedDate.AddDays(TextBox1.Text)
        e.Command.Parameters(4).Value = ID
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        Try
            If SqlDataSource2.Insert() = 1 Then
                errorLabel.Text = "Successfuly joined..."
            End If
            'Response.Redirect("AssignGuide.aspx?ID=" & DropDownList1.SelectedValue, True)
        Catch ex As Exception
            errorLabel.Text = ex.Message
        End Try
    End Sub

    Private Sub Calendar1_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles Calendar1.DayRender
        If e.Day.Date > Today Or e.Day.Date.AddDays(3) < Today Then
            e.Day.IsSelectable = False
            e.Cell.BackColor = Drawing.Color.Red
        ElseIf e.Day.IsSelected = True Then
            e.Cell.ForeColor = Drawing.Color.White
        Else
            e.Cell.BackColor = Drawing.Color.Green
            e.Cell.ForeColor = Drawing.Color.Orange
        End If
    End Sub

    Private Sub Calendar1_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Calendar1.SelectionChanged
        Dim tmpdate As Date = Calendar1.SelectedDate
        If tmpdate.AddDays(3) < Today Then
            Calendar1.SelectedDate = Today
        ElseIf Calendar1.SelectedDate > Today Then
            Calendar1.SelectedDate = Today
        End If
    End Sub
End Class
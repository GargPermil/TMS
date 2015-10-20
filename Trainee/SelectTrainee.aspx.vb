Public Class SelectTrainee
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.User.Identity.IsAuthenticated = False Then
            Response.Redirect("DetailsConfirm.aspx")
        End If
        Dim tmpmenu As Menu = Master.FindControl("Menu1")
        tmpmenu.Items(3).Selected = True
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        Dim result As String
        Dim Constr As String = "data source=.\SQLEXPRESS;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\Database.mdf;User Instance=true;"
        Dim CmdStr As String = "SELECT [DOB] FROM [Student] Where [StudentID] = @ID"
        Dim Con As SqlClient.SqlConnection = New SqlClient.SqlConnection(Constr)
        Dim Cmd As SqlClient.SqlCommand = New SqlClient.SqlCommand(CmdStr, Con)
        Cmd.Parameters.AddWithValue("ID", DropDownList1.SelectedValue)
        Try
            Con.Open()
            result = Cmd.ExecuteScalar()
            Response.Redirect("DetailsView.aspx?Traineeid=" & DropDownList1.SelectedValue & "&DOB=" & result, True)
        Catch ex As Exception
            'ErrorLabel.Text = "Something Went Wrong. <Br/> " & ex.Message
        Finally
            Con.Close()
        End Try
    End Sub
End Class
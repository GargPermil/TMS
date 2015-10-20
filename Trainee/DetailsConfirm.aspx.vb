Public Class DetailsConfirm
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim tmpmenu As Menu = Master.FindControl("Menu1")
        tmpmenu.Items(3).Selected = True
    End Sub

    Protected Sub Submit1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Submit1.Click
        Dim result As String
        If CustomValidator1.IsValid = True Then
            Dim Constr As String = "data source=.\SQLEXPRESS;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\Database.mdf;User Instance=true;"
            Dim CmdStr As String = "Select StudentID from Student Where StudentID=@ID AND DOB=@DOB"
            Dim Con As SqlClient.SqlConnection = New SqlClient.SqlConnection(Constr)
            Dim Cmd As SqlClient.SqlCommand = New SqlClient.SqlCommand(CmdStr, Con)
            Cmd.Parameters.AddWithValue("ID", TextBox1.Text)
            Cmd.Parameters.AddWithValue("DOB", TextBox2.Text)
            Try
                Con.Open()
                result = Cmd.ExecuteScalar()
                If result = Nothing Then
                    ErrorLabel.Text = "You are not authorised."
                Else
                    Response.Redirect("DetailsView.aspx?Traineeid=" & result & "&DOB=" & TextBox2.Text, True)
                End If
            Catch ex As Exception
                ErrorLabel.Text = "Something Went Wrong. <Br/> " & ex.Message
            Finally
                Con.Close()
            End Try
        End If
    End Sub

    Protected Sub Reset_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Reset.Click
        TextBox1.Text = ""
        TextBox2.Text = ""
        ErrorLabel.Text = ""
    End Sub

    Protected Sub CustomValidator1_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles CustomValidator1.ServerValidate
        args.IsValid = Date.TryParse(TextBox2.Text, New Date())
    End Sub

    Private Sub TextBox2_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles TextBox2.TextChanged
        CustomValidator1.Validate()
    End Sub
End Class
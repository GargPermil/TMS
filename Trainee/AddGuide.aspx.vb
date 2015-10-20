Public Class AddGuide1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.User.Identity.IsAuthenticated = False Then
            Response.Redirect("Default.aspx")
        End If
        Dim tmpmenu As Menu = Master.FindControl("Menu1")
        tmpmenu.Items(0).Selected = True
        tmpmenu = Master.FindControl("Menu2")
        tmpmenu.Items(2).Selected = True
    End Sub

    Protected Sub Submit1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Submit1.Click
        If CustomValidator1.IsValid = True Then
            Dim Constr As String = "data source=.\SQLEXPRESS;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\Database.mdf;User Instance=true;"
            Dim CmdStr As String = "Select Max(GuideID) from Guide"
            Dim CmdStr2 As String = "INSERT INTO GUIDE VALUES(@ID,@NAME,@DOB,@EMAIL,@PHONE)"
            Dim Con As SqlClient.SqlConnection = New SqlClient.SqlConnection(Constr)
            Dim Cmd As SqlClient.SqlCommand = New SqlClient.SqlCommand(CmdStr, Con)
            Dim ID As String
            Try
                Con.Open()
                ID = Cmd.ExecuteScalar.ToString()
                Cmd.CommandText = CmdStr2
                If ID = Nothing Then
                    ID = 1
                Else
                    ID += 1
                End If
                Cmd.Parameters.AddWithValue("ID", ID)
                Cmd.Parameters.AddWithValue("NAME", TextBox1.Text)
                Cmd.Parameters.AddWithValue("DOB", TextBox10.Text)
                Cmd.Parameters.AddWithValue("EMAIL", TextBox8.Text)
                Cmd.Parameters.AddWithValue("PHONE", TextBox7.Text)
                If Cmd.ExecuteNonQuery() <> 1 Then
                    ErrorLabel.Text = "Something Went Wrong"
                Else
                    TextBox1.Text = ""
                    TextBox7.Text = ""
                    TextBox8.Text = ""
                    TextBox10.Text = ""
                    ErrorLabel.Text = "Guide is added successfully..."
                End If
            Catch Ex As Exception
                ErrorLabel.Text = Ex.Message
            Finally
                Con.Close()
            End Try
        End If
    End Sub

    Protected Sub Reset_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Reset.Click
        TextBox1.Text = ""
        TextBox7.Text = ""
        TextBox8.Text = ""
        TextBox10.Text = ""
        ErrorLabel.Text = ""
    End Sub

    Protected Sub CustomValidator1_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles CustomValidator1.ServerValidate
        args.IsValid = Date.TryParse(TextBox10.Text, New Date())
    End Sub

    Private Sub TextBox10_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles TextBox10.TextChanged
        CustomValidator1.Validate()
    End Sub
End Class
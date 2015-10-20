Public Class AddProject
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.User.Identity.IsAuthenticated = False Then
            Response.Redirect("Default.aspx")
        End If
        Dim tmpmenu As Menu = Master.FindControl("Menu1")
        tmpmenu.Items(0).Selected = True
        tmpmenu = Master.FindControl("Menu2")
        tmpmenu.Items(1).Selected = True
    End Sub

    Protected Sub Reset_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Reset.Click
        TextBox1.Text = ""
        TextBox2.Text = ""
    End Sub

    Protected Sub Submit1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Submit1.Click
        Dim Constr As String = "data source=.\SQLEXPRESS;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\Database.mdf;User Instance=true;"
        Dim CmdStr As String = "Select Max(ProjectID) from Project"
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
            ErrorLabel.Text = Ex.Message
        Finally
            Con.Close()
        End Try
        Cmd.CommandText = "INSERT into Project Values (@ProjId,@ProjName,@ProjDes)"
        Cmd.Parameters.AddWithValue("ProjId", ID)
        Cmd.Parameters.AddWithValue("ProjName", TextBox1.Text)
        Cmd.Parameters.AddWithValue("ProjDes", TextBox2.Text)
        Try
            Con.Open()
            If Cmd.ExecuteNonQuery <> 1 Then
                ErrorLabel.Text = "Something went wrong"
            Else
                If Request.QueryString("ReturnUrl") = 1 Then
                    Response.Redirect("~/AssignProject.aspx")
                End If
                ErrorLabel.Text = "Project Inserted Successfully."
            End If
        Catch ex As Exception
            ErrorLabel.Text = ex.Message
        Finally
            Con.Close()
        End Try
    End Sub
End Class
Public Class AssignProject
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.User.Identity.IsAuthenticated = False Then
            Response.Redirect("Default.aspx")
        End If
        Dim tmpmenu As Menu = Master.FindControl("Menu1")
        tmpmenu.Items(0).Selected = True
        tmpmenu = Master.FindControl("Menu2")
        tmpmenu.Items(4).Selected = True
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        Dim Constr As String = "data source=.\SQLEXPRESS;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\Database.mdf;User Instance=true;"
        Dim CmdStr As String = "Select Max(ID) from TraineProjects"
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
        Cmd.CommandText = "INSERT into TraineProjects Values (@TID,@PID,@ID)"
        Cmd.Parameters.AddWithValue("ID", ID)
        Cmd.Parameters.AddWithValue("TID", DropDownList2.SelectedValue)
        Cmd.Parameters.AddWithValue("PID", DropDownList1.SelectedValue)
        Try
            Con.Open()
            If Cmd.ExecuteNonQuery <> 1 Then
                ErrorLabel.Text = "Something went wrong"
            Else
                ErrorLabel.Text = "Project Assigned Successfully...."
            End If
        Catch ex As Exception
            ErrorLabel.Text = ex.Message
        Finally
            Con.Close()
        End Try
    End Sub
End Class
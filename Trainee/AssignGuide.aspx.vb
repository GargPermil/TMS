Public Class AddGuide
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.User.Identity.IsAuthenticated = False Then
            Response.Redirect("Default.aspx")
        End If
        Dim tmpmenu As Menu = Master.FindControl("Menu1")
        tmpmenu.Items(0).Selected = True
        tmpmenu = Master.FindControl("Menu2")
        tmpmenu.Items(2).Selected = True
        If IsPostBack = False Then
            bindgrid()
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        Dim Constr As String = "data source=.\SQLEXPRESS;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\Database.mdf;User Instance=true;"
        Dim Cmdstr As String = "UPDATE [Student] SET [Guidance] = @GUID Where [StudentID]=@CR"
        Dim Con As SqlClient.SqlConnection = New SqlClient.SqlConnection(Constr)
        Dim Cmd As SqlClient.SqlCommand = New SqlClient.SqlCommand(CmdStr, Con)
        Try
            Con.Open()
            For Each row As GridViewRow In GridView1.Rows
                ' Access the CheckBox
                Dim cb As CheckBox = row.FindControl("Selected")
                If cb IsNot Nothing AndAlso cb.Checked Then
                    Dim traineeid As String = row.Cells(1).Text
                    Cmd.Parameters.Clear()
                    Cmd.Parameters.AddWithValue("GUID", ListBox1.SelectedValue)
                    Cmd.Parameters.AddWithValue("CR", traineeid)
                    Cmd.ExecuteNonQuery()
                End If
            Next
            ErrorLabel.Text = "Guide assigned Successfully..."
        Catch ex As Exception
            ErrorLabel.Text = "Something Went Wrong."
        Finally
            Con.Close()
        End Try
    End Sub

    Private Sub DropDownList1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.DataBound
        DropDownList1.Items.Add("*")
        DropDownList1.SelectedIndex = 6
    End Sub


    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        bindgrid()
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button2.Click
        For Each row As GridViewRow In GridView1.Rows
            ' Access the CheckBox
            Dim cb As CheckBox = row.FindControl("Selected")
            If cb IsNot Nothing Then
                cb.Checked = True
            End If
        Next
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button3.Click
        For Each row As GridViewRow In GridView1.Rows
            ' Access the CheckBox
            Dim cb As CheckBox = row.FindControl("Selected")
            If cb IsNot Nothing Then
                cb.Checked = False
            End If
        Next
    End Sub
    Private Sub bindgrid()
        Dim Constr As String = "data source=.\SQLEXPRESS;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\Database.mdf;User Instance=true;"
        Dim Selcmd As String = "SELECT [StudentID], [Name] FROM [Student] Where [Course]=@CR"
        Dim stud As SqlDataSource = New SqlDataSource(Constr, Selcmd)
        If DropDownList1.SelectedValue = "" Or DropDownList1.SelectedValue = "*" Then
            stud.SelectCommand = "SELECT [StudentID], [Name] FROM [Student]"
        Else
            stud.SelectParameters.Add("CR", DropDownList1.SelectedValue)
        End If
        GridView1.DataSource = stud
        GridView1.DataBind()
    End Sub
End Class
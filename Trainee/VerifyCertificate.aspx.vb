Public Class VerifyCertificate
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim tmpmenu As Menu = Master.FindControl("Menu1")
        tmpmenu.Items(4).Selected = True
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        Dim verify As Boolean = False
        Dim Constr As String = "data source=.\SQLEXPRESS;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\Database.mdf;User Instance=true;"
        Dim CmdStr As String = "SELECT Certificate.certificateID, Certificate.Date, Student.Name, Student.Course, TraineeDuration.JoinDate, " & _
            "TraineeDuration.EndDate, Student.StudentID FROM Certificate INNER JOIN Student ON Certificate.TraineeID = Student.StudentID " & _
            "INNER JOIN TraineeDuration ON Certificate.TraineeID = TraineeDuration.TraineeID WHERE (Certificate.certificateID = @CERID)"
        Dim Con As SqlClient.SqlConnection = New SqlClient.SqlConnection(Constr)
        Dim Cmd As SqlClient.SqlCommand = New SqlClient.SqlCommand(CmdStr, Con)
        Cmd.Parameters.AddWithValue("CERID", certino.Text)
        Dim Adpt As Data.SqlClient.SqlDataAdapter = New Data.SqlClient.SqlDataAdapter(Cmd)
        Dim dset As Data.DataSet = New DataSet()
        statuspan.Visible = True
        Try
            Con.Open()
            Adpt.Fill(dset)
            If dset.Tables(0).Rows.Count = 1 Then
                verify = True
                If certino.Text <> dset.Tables(0).Rows(0).Item(0).ToString Then
                    verify = False
                End If
                Dim tmpdate As Date
                Date.TryParse(cerdate.Text, tmpdate)
                If tmpdate <> dset.Tables(0).Rows(0).Item(1).ToString Then
                    verify = False
                End If
                If cername.Text <> dset.Tables(0).Rows(0).Item(2).ToString Then
                    verify = False
                End If
                If cercourse.Text <> dset.Tables(0).Rows(0).Item(3).ToString Then
                    verify = False
                End If
            Else
                verify = False
            End If
        Catch ex As Exception
            'blank
        Finally
            Con.Close()
        End Try
        If verify = True Then
            Status.Text = "Verified. Certificate is genuine"
            statusimg.ImageUrl = "~/images/verified.png"
        Else
            Status.Text = "Certificate is not genuine"
            statusimg.ImageUrl = "~/images/nverified.png"
        End If
    End Sub
End Class
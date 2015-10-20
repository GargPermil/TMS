Public Class DetailsView
    Inherits System.Web.UI.Page

    Dim Constr As String = "data source=.\SQLEXPRESS;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\Database.mdf;User Instance=true;"
    Dim joindate As String = ""
    Dim completedate As String = ""
    Dim certid As String
    Dim certdate As Date

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If ValidateTrainee() Then
            Dim tmpmenu As Menu = Master.FindControl("Menu1")
            tmpmenu.Items(3).Selected = True
            Dim CmdStr As String = _
            "SELECT   Student.Name, Student.Course, Student.University, Student.Guidance, Student.Email, TraineeDuration.JoinDate, TraineeDuration.EndDate " &
            "FROM Student LEFT OUTER JOIN TraineeDuration ON Student.StudentID = TraineeDuration.TraineeID WHERE   (Student.StudentID = @ID)"
            'Convert(varchar,DOB,2) as DOB
            Dim Con As SqlClient.SqlConnection = New SqlClient.SqlConnection(Constr)
            Dim Cmd As SqlClient.SqlCommand = New SqlClient.SqlCommand(CmdStr, Con)
            Cmd.Parameters.AddWithValue("ID", Request.Params(0))
            Dim Adpt As Data.SqlClient.SqlDataAdapter = New Data.SqlClient.SqlDataAdapter(Cmd)
            Dim dset As Data.DataSet = New DataSet()
            Try
                Con.Open()
                Adpt.Fill(dset)
                Name.Text = dset.Tables(0).Rows(0).Item(0).ToString
                Course.Text = dset.Tables(0).Rows(0).Item(1).ToString
                Guide.Text = dset.Tables(0).Rows(0).Item(3).ToString
                Univerity.Text = dset.Tables(0).Rows(0).Item(2).ToString
                Email.Text = dset.Tables(0).Rows(0).Item(4).ToString
                joindate = dset.Tables(0).Rows(0).Item(5).ToString()
                completedate = dset.Tables(0).Rows(0).Item(6).ToString()
                If Guide.Text = "" Then
                    Guide.Text = "Guide Not Availabe"
                End If
                If dset.Tables(0).Rows(0).Item(5).ToString = "" Then
                    Status.Text = "Not Joined"
                    Duration.Text = " "
                ElseIf Today > DateTime.Parse(dset.Tables(0).Rows(0).Item(6).ToString) Then
                    Status.Text = "Completed"
                    Duration.Text = dset.Tables(0).Rows(0).Item(6).ToString.Substring(0, 9)
                Else
                    Status.Text = "Active"
                    Dim tmpdate As Date
                    Date.TryParse(dset.Tables(0).Rows(0).Item(5).ToString(), tmpdate)
                    Duration.Text = tmpdate.Date
                    Duration.Text &= " - "
                    Date.TryParse(dset.Tables(0).Rows(0).Item(6).ToString(), tmpdate)
                    Duration.Text &= tmpdate.Date
                End If
            Catch ex As Exception
                'ErrorLabel.Text = "Something Went Wrong. <Br/> " & ex.Message
            Finally
                Con.Close()
            End Try
            'fetch projects details
            If Status.Text = "Not Joined" Then
                Panel1.Visible = False
            Else
                CmdStr = "SELECT   Project.ProjectName, Project.ProjectDescription " &
                     "FROM      TraineProjects INNER JOIN " &
                     "Project ON TraineProjects.ProjectID = Project.ProjectID " &
                     "WHERE   (TraineProjects.TraineID = @ID)"
                Cmd.CommandText = CmdStr
                Cmd.Parameters.AddWithValue("TID", Request.Params(0))
                Adpt = New Data.SqlClient.SqlDataAdapter(Cmd)
                dset = New DataSet()
                Try
                    Con.Open()
                    Adpt.Fill(dset)
                    If dset.Tables(0).Rows.Count = 0 Then
                        Panel1.Visible = False
                    ElseIf dset.Tables(0).Rows.Count > 0 Then
                        Select Case dset.Tables(0).Rows.Count
                            Case 1
                                ProjectName.Text = dset.Tables(0).Rows(0).Item(0)
                                ProjectDesription.Text = dset.Tables(0).Rows(0).Item(1)
                            Case 2
                                ProjectName1.Text = dset.Tables(0).Rows(1).Item(0)
                                ProjectDesription1.Text = dset.Tables(0).Rows(1).Item(1)
                                ProjectName.Text = dset.Tables(0).Rows(0).Item(0)
                                ProjectDesription.Text = dset.Tables(0).Rows(0).Item(1)
                            Case 3
                                ProjectName2.Text = dset.Tables(0).Rows(2).Item(0)
                                ProjectDesription2.Text = dset.Tables(0).Rows(2).Item(1)
                                ProjectName1.Text = dset.Tables(0).Rows(1).Item(0)
                                ProjectDesription1.Text = dset.Tables(0).Rows(1).Item(1)
                                ProjectName.Text = dset.Tables(0).Rows(0).Item(0)
                                ProjectDesription.Text = dset.Tables(0).Rows(0).Item(1)
                            Case 4
                                ProjectName3.Text = dset.Tables(0).Rows(3).Item(0)
                                ProjectDesription3.Text = dset.Tables(0).Rows(3).Item(1)
                                ProjectName2.Text = dset.Tables(0).Rows(2).Item(0)
                                ProjectDesription2.Text = dset.Tables(0).Rows(2).Item(1)
                                ProjectName1.Text = dset.Tables(0).Rows(1).Item(0)
                                ProjectDesription1.Text = dset.Tables(0).Rows(1).Item(1)
                                ProjectName.Text = dset.Tables(0).Rows(0).Item(0)
                                ProjectDesription.Text = dset.Tables(0).Rows(0).Item(1)
                        End Select
                    End If
                Catch ex As Exception
                    'ErrorLabel.Text = "Something Went Wrong. <Br/>"
                Finally
                    Con.Close()
                End Try
            End If
            If Status.Text = "Not Joined" Then
                Button1.Visible = False
            ElseIf Status.Text = "Active" Then
                Button1.Text = "Print Joining Letter"
            ElseIf Status.Text = "Completed" Then
                Button1.Text = "Print Certificate"
            End If
        Else
            Response.Redirect("DetailsConfirm.aspx", True)
        End If
    End Sub

    Private Function ValidateTrainee() As Boolean
        Dim result As String
        Dim CmdStr As String = "Select StudentID from Student Where StudentID=@ID AND DOB=@DOB"
        Dim Con As SqlClient.SqlConnection = New SqlClient.SqlConnection(Constr)
        Dim Cmd As SqlClient.SqlCommand = New SqlClient.SqlCommand(CmdStr, Con)
        Cmd.Parameters.AddWithValue("ID", Request.Params(0))
        Cmd.Parameters.AddWithValue("DOB", Request.Params(1))
        Try
            Con.Open()
            result = Cmd.ExecuteScalar()
            If result = Nothing Then
                Return False
            Else
                Return True
            End If
        Catch ex As Exception
            'ErrorLabel.Text = "Something Went Wrong. <Br/> " & ex.Message
        Finally
            Con.Close()
        End Try
        Return False
    End Function

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        If checkalreadycertificate() = False Then
            insertcertificate()
        End If
        Dim pdfstream As IO.MemoryStream = New IO.MemoryStream()
        Dim rect As New iTextSharp.text.Rectangle(iTextSharp.text.PageSize.A4)
        rect.BackgroundColor = iTextSharp.text.BaseColor.YELLOW
        Dim doc As New iTextSharp.text.Document(rect, "72", "72", "72", "108")
        Dim wr As iTextSharp.text.pdf.PdfWriter = iTextSharp.text.pdf.PdfWriter.GetInstance(doc, pdfstream)
        wr.CloseStream = False
        doc.Open()
        doc.AddAuthor("AIR INDIA. LTD.")
        doc.AddCreationDate()
        doc.AddCreator("AIR INDIA. LTD.")
        doc.AddSubject("Certificate of training")
        doc.AddTitle("CERTIFICATE")
        If Button1.Text = "Print Certificate" Then
            createcertificate(doc)
        ElseIf Button1.Text = "Print Joining Letter" Then
            createjoiningletter(doc)
        End If
        doc.Close()
        wr.Flush()
        Response.ContentType = "application/pdf"
        'Response.AddHeader("content-disposition", "attachment;filename=1.pdf")
        Response.BinaryWrite(pdfstream.GetBuffer())
        pdfstream.Flush()
        pdfstream.Close()
    End Sub

    Private Sub createcertificate(ByRef docstrm As iTextSharp.text.Document)
        Dim img As iTextSharp.text.Image = iTextSharp.text.Image.GetInstance(HttpRuntime.AppDomainAppPath & "images\\Logo.png")
        img.ScaleToFit(230, 63)
        img.Alignment = iTextSharp.text.Image.TEXTWRAP Or iTextSharp.text.Image.ALIGN_RIGHT
        img.SpacingAfter = 20
        Dim bftimes As iTextSharp.text.pdf.BaseFont = iTextSharp.text.pdf.BaseFont.CreateFont(iTextSharp.text.pdf.BaseFont.TIMES_ROMAN,
                                                                                              iTextSharp.text.pdf.BaseFont.CP1252, False)
        Dim lofontb As iTextSharp.text.Font = New iTextSharp.text.Font(bftimes, 25)
        lofontb.SetStyle("bold")
        Dim lofonts As iTextSharp.text.Font = New iTextSharp.text.Font(bftimes, 15)
        lofonts.SetStyle("bold")
        Dim lofontm As iTextSharp.text.Font = New iTextSharp.text.Font(bftimes, 21)
        lofontm.SetStyle("bold")
        Dim Comname As New iTextSharp.text.Paragraph("AIR INDIA LTD.", lofontb)
        Comname.Alignment = iTextSharp.text.Element.ALIGN_JUSTIFIED
        Comname.SpacingBefore = -25
        Comname.SpacingAfter = 10
        Dim tagline As New iTextSharp.text.Paragraph("IT- Computer Centre", lofontm)
        tagline.Alignment = iTextSharp.text.Element.ALIGN_JUSTIFIED
        tagline.SpacingAfter = 20
        Dim parcert As New iTextSharp.text.Paragraph("LEARNING CERTIFICATE", lofontb)
        parcert.Alignment = iTextSharp.text.Element.ALIGN_CENTER
        parcert.SpacingAfter = 15
        Dim parref As New iTextSharp.text.Paragraph("Ref No. : " & certid)
        parref.Alignment = iTextSharp.text.Element.ALIGN_LEFT
        Dim glue As New iTextSharp.text.Chunk(New iTextSharp.text.pdf.draw.VerticalPositionMark())
        'Chunk glue = new Chunk(new VerticalPositionMark());
        'p.add(new Chunk(glue));
        parref.Add(New iTextSharp.text.Chunk(glue))
        parref.Add("Date : " & certdate.Date)
        Dim loname As New iTextSharp.text.Paragraph(Name.Text.ToUpper(), lofontb)
        loname.Alignment = iTextSharp.text.Element.ALIGN_CENTER
        loname.SpacingBefore = 5
        loname.SpacingAfter = 15
        Dim par1 As New iTextSharp.text.Paragraph()
        Dim ch1 As New iTextSharp.text.Chunk("This is Certify that ")
        Dim ch2 As New iTextSharp.text.Chunk(Name.Text.ToUpper())
        ch2.Font.SetStyle("bold")
        Dim ch3 As New iTextSharp.text.Chunk(" implant Training of ")
        Dim ch4 As New iTextSharp.text.Chunk(Course.Text.ToUpper())
        ch4.Font.SetStyle("bold")
        Dim ch5 As New iTextSharp.text.Chunk(" has undergone practical training in our Engineering as per details given below.")
        par1.Add(ch1)
        par1.Add(ch2)
        par1.Add(ch3)
        par1.Add(ch4)
        par1.Add(ch5)
        Dim tmpdate1, tmpdate2 As Date
        Date.TryParse(joindate, tmpdate1)
        Date.TryParse(completedate, tmpdate2)
        Dim par2 As New iTextSharp.text.Paragraph("Period of training :	   " & tmpdate1 & "    To    " & tmpdate2, lofonts)
        par2.SpacingBefore = 20
        par2.SpacingAfter = 20
        Dim par3 As New iTextSharp.text.Paragraph("Maintenance, debugging, adding features, test operations and making of various projects" & _
                                                  " under supervision of experienced engineers. The details of following projects:")
        Dim par4 As iTextSharp.text.Paragraph
        Dim par5 As iTextSharp.text.Paragraph
        Dim par6 As iTextSharp.text.Paragraph
        Dim par7 As iTextSharp.text.Paragraph
        If ProjectName.Text <> "" Then
            par4 = New iTextSharp.text.Paragraph(ProjectName.Text)
        Else
            par4 = New iTextSharp.text.Paragraph()
        End If
        If ProjectName1.Text <> "" Then
            par5 = New iTextSharp.text.Paragraph(ProjectName1.Text)
        Else
            par5 = New iTextSharp.text.Paragraph()
        End If
        If ProjectName2.Text <> "" Then
            par6 = New iTextSharp.text.Paragraph(ProjectName2.Text)
        Else
            par6 = New iTextSharp.text.Paragraph()
        End If
        If ProjectName3.Text <> "" Then
            par7 = New iTextSharp.text.Paragraph(ProjectName3.Text)
        Else
            par7 = New iTextSharp.text.Paragraph()
        End If
        Dim par8 As New iTextSharp.text.Paragraph("Performance and attendance during the above training period was found satisfactory.")
        par8.SpacingBefore = 30
        Dim line As New iTextSharp.text.pdf.draw.LineSeparator(0.0F, 100.0F, iTextSharp.text.BaseColor.BLACK, iTextSharp.text.Element.ALIGN_LEFT, 0)
        docstrm.Add(img)
        docstrm.Add(Comname)
        docstrm.Add(tagline)
        docstrm.Add(line)
        docstrm.Add(parcert)
        docstrm.Add(parref)
        docstrm.Add(loname)
        docstrm.Add(par1)
        docstrm.Add(par2)
        docstrm.Add(par3)
        docstrm.Add(par4)
        docstrm.Add(par5)
        docstrm.Add(par6)
        docstrm.Add(par7)
        docstrm.Add(par8)
    End Sub

    Private Sub insertcertificate()
        Dim Constr As String = "data source=.\SQLEXPRESS;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\Database.mdf;User Instance=true;"
        Dim CmdStr As String = "SELECT MAX(certificateID) AS Expr1 FROM [Certificate] WHERE (Date > @certsign)"
        Dim Con As SqlClient.SqlConnection = New SqlClient.SqlConnection(Constr)
        Dim Cmd As SqlClient.SqlCommand = New SqlClient.SqlCommand(CmdStr, Con)
        Try
            Con.Open()
            Dim tmpdate As Date = New Date(Today.Year, Today.Month, 1)
            Cmd.Parameters.AddWithValue("certsign", tmpdate)
            certid = Cmd.ExecuteScalar.ToString()
            Cmd.CommandText = "Insert into certificate values(@id,@tid,@date)"
            If certid = Nothing Then
                certid = Date.Today.Year & Date.Today.Month & "1"
            Else
                Dim tmpstr As String = certid.ToString()
                tmpstr = tmpstr.Substring(6)
                tmpstr += 1
                certid = Date.Today.Year & Date.Today.Month & tmpstr
            End If
            certdate = Today
            Cmd.Parameters.AddWithValue("id", certid)
            Cmd.Parameters.AddWithValue("tid", Request.Params(0))
            Cmd.Parameters.AddWithValue("date", certdate.Date)
            Cmd.ExecuteNonQuery()
        Catch ex As Exception
        Finally
            Con.Close()
        End Try
    End Sub

    Private Function checkalreadycertificate() As Boolean
        Dim Constr As String = "data source=.\SQLEXPRESS;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\Database.mdf;User Instance=true;"
        Dim CmdStr As String = "SELECT * FROM [Certificate] WHERE (traineeID=@id)"
        Dim Con As SqlClient.SqlConnection = New SqlClient.SqlConnection(Constr)
        Dim Cmd As SqlClient.SqlCommand = New SqlClient.SqlCommand(CmdStr, Con)
        Try
            Con.Open()
            Cmd.Parameters.AddWithValue("id", Request.Params(0))
            Dim Adpt As Data.SqlClient.SqlDataAdapter = New Data.SqlClient.SqlDataAdapter(Cmd)
            Dim dset As Data.DataSet = New DataSet()
            Adpt.Fill(dset)
            If dset.Tables(0).Rows.Count = 1 Then
                certid = dset.Tables(0).Rows(0).Item(0).ToString()
                certdate = dset.Tables(0).Rows(0).Item(2).ToString()
                Return True
            Else
                Return False
            End If
        Catch ex As Exception

        End Try
    End Function

    Private Sub createjoiningletter(ByRef docstrm As iTextSharp.text.Document)

    End Sub
End Class
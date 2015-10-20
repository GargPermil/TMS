Imports iTextSharp

Public Class PrintCertificate
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.User.Identity.IsAuthenticated = False Then
            Response.Redirect("Default.aspx")
        End If
        Dim tmpmenu As Menu = Master.FindControl("Menu1")
        tmpmenu.Items(0).Selected = True
        tmpmenu = Master.FindControl("Menu2")
        tmpmenu.Items(6).Selected = True
        Calendar1.SelectedDate = Today.Date
    End Sub

    Protected Sub Calendar1_SelectionChanged(ByVal sender As Object, ByVal e As EventArgs) Handles Calendar1.SelectionChanged
        If Calendar1.SelectedDate > Today Then
            ErrLabel.Text = "Not Support Next Dates"
            Calendar1.SelectedDate = Today
            Dim DSA As DataSourceSelectArguments = New DataSourceSelectArguments()
            'SqlDataSource1.Select(DSA)
            GridView1.DataBind()
        ElseIf Calendar1.SelectedDate = Today Then
            ErrLabel.Text = ""
            Dim DSA As DataSourceSelectArguments = New DataSourceSelectArguments()
            'SqlDataSource1.Select(DSA)
            GridView1.DataBind()
        Else
            ErrLabel.Text = ""
            Dim DSA As DataSourceSelectArguments = New DataSourceSelectArguments()
            'SqlDataSource1.Select(DSA)
            GridView1.DataBind()
        End If
    End Sub

    Protected Sub SqlDataSource1_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting
        e.Command.Parameters(0).Value = Calendar1.SelectedDate
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button2.Click
        '"~\Letter&Certificate\AIR INDIA LTD.docx"
        'Dim filename As Object = AppDomain.CurrentDomain.BaseDirectory & "Letter&Certificate\Certificate.pdf"
        'Dim app As Application = New Application()
        'Dim missing As Object = System.Reflection.Missing.Value

        'Dim readOnlyy As Object = False
        'Dim isVisible As Object = False
        'Dim falsea As Object = False
        'Try

        'Catch ex As Exception

        'End Try

        ''IO.File.Copy("\Letter&Certificate\\AIR INDIA LTD.docx", "~\\Letter&Certificate\\Certificate.docx")
        'Dim adoc As Documents = app.Documents
        ''adoc.Open(filename, missing, readOnlyy, missing, missing, missing, missing, missing,
        ''          missing, missing, missing, missing, missing, missing, missing, missing)
        'adoc.OpenNoRepairDialog(filename, falsea, readOnlyy, falsea, missing, missing, falsea, missing, missing, missing, missing, falsea, missing, missing, missing, missing)
        'FindAndReplace(adoc.Application, "[NAME]", "PERMIL GARG")
        'FindAndReplace(adoc.Application, "[Course]", "BCA")
        'FindAndReplace(adoc.Application, "[STARTDATE]", "15/6/15")
        'FindAndReplace(adoc.Application, "[ENDDATE]", "30/7/15")
        'adoc.Save()
        ''Kill("WINWORD.EXE")
        Dim pdfstream As IO.MemoryStream = New IO.MemoryStream()
        Dim doc As New iTextSharp.text.Document(iTextSharp.text.PageSize.A4, "108", "108", "108", "108")
        Dim wr As iTextSharp.text.pdf.PdfWriter = iTextSharp.text.pdf.PdfWriter.GetInstance(doc, pdfstream)
        wr.CloseStream = False
        Dim para As New iTextSharp.text.Paragraph("Hello there is permil")
        Dim parse As New iTextSharp.text.Phrase("It is a phase")
        Dim hunk As New iTextSharp.text.Chunk("this is chunk")
        doc.Open()
        doc.AddAuthor("AIR INDIA. LTD.")
        doc.AddCreationDate()
        doc.AddCreator("AIR INDIA. LTD.")
        doc.AddSubject("Certificate of training")
        doc.AddTitle("CERTIFICATE")
        doc.Add(para)
        doc.Add(parse)
        doc.Add(hunk)
        doc.Close()
        wr.Flush()
        Response.ContentType = "application/pdf"
        Response.BinaryWrite(pdfstream.GetBuffer())
        'Dim writer As IO.FileStream = New IO.FileStream(filename, IO.FileMode.Create)
        'writer.Write(pdfstream.GetBuffer(), 0, pdfstream.Length)
        pdfstream.Flush()
        pdfstream.Close()
        'writer.Close()
        'writer.Dispose()
    End Sub


    'Private Function FindAndeplace(ByRef wordApp As Application, ByRef findText As Object, ByRef replaceText As Object) As Boolean

    '    Dim matchCase As Object = True
    '    Dim matchWholeWord As Object = True
    '    Dim matchWildCards As Object = False
    '    Dim matchSoundsLike As Object = False
    '    Dim matchAllWordForms As Object = False
    '    Dim forward As Object = True
    '    Dim format As Object = False
    '    Dim matchKashida As Object = False
    '    Dim matchDiacritics As Object = False
    '    Dim matchAlefHamza As Object = False
    '    Dim matchControl As Object = False
    '    Dim read_only As Object = False
    '    Dim visible As Object = True
    '    Dim replace As Object = 2
    '    Dim wrap As Object = 1
    '    Dim matchPrefix As Object = True
    '    Dim matchSuffix As Object = True
    '    Dim MatchPhase As Object = False
    '    Dim ignoreSpace As Object = False
    '    Dim ignorePunct As Object = False
    '    Dim ReplaceO As Object = "all"

    '    Try
    '        Return wordApp.Selection.Find.Execute2007(findText, matchCase, matchWholeWord, matchWildCards, matchSoundsLike, matchAllWordForms,
    '                                       forward, wrap, format, replaceText, ReplaceO, matchKashida, matchDiacritics, matchAlefHamza,
    '                                       matchControl, matchPrefix, matchSuffix, MatchPhase, ignoreSpace, ignorePunct)
    '    Catch ex As Exception

    '    End Try

    'End Function

End Class
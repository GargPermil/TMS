Public Class Search
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.User.Identity.IsAuthenticated = False Then
            Response.Redirect("Default.aspx")
        End If
        Dim tmpmenu As Menu = Master.FindControl("Menu1")
        tmpmenu.Items(0).Selected = True
        tmpmenu = Master.FindControl("Menu2")
        tmpmenu.Items(0).Selected = True
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        Dim filterexpression As String = ""
        'name
        If TextBox1.Text <> String.Empty Then
            If filterexpression = String.Empty Then
                filterexpression = "([Name] LIKE '%{0}%')"
            Else
                filterexpression &= " AND ([Name] LIKE '%{0}%')"
            End If
        End If
        'year
        If TextBox2.Text <> String.Empty Then
            If filterexpression = String.Empty Then
                filterexpression = "([Year] = {2})"
            Else
                filterexpression &= " AND ([Year] = {2})"
            End If
        End If
        'col
        If TextBox3.Text <> String.Empty Then
            If filterexpression = String.Empty Then
                filterexpression = "([Col] LIKE '%{3}%')"
            Else
                filterexpression &= " AND ([Col] LIKE '%{3}%')"
            End If
        End If
        'uni
        If TextBox4.Text <> String.Empty Then
            If filterexpression = String.Empty Then
                filterexpression = "([University] LIKE '%{4}%')"
            Else
                filterexpression &= " AND ([University] LIKE '%{4}%')"
            End If
        End If
        'phone
        If TextBox6.Text <> String.Empty Then
            If filterexpression = String.Empty Then
                filterexpression = "([Phone] = {5})"
            Else
                filterexpression &= " AND ([Phone] = {5})"
            End If
        End If
        'e-mail
        If TextBox7.Text <> String.Empty Then
            If filterexpression = String.Empty Then
                filterexpression = "([Email] LIKE '%{8}%')"
            Else
                filterexpression &= " AND ([Email] LIKE '%{8}%')"
            End If
        End If
        'Guide
        If TextBox8.Text <> String.Empty Then
            If filterexpression = String.Empty Then
                filterexpression = "([Guidance] LIKE '%{6}%')"
            Else
                filterexpression &= " AND ([Guidance] LIKE '%{6}%')"
            End If
        End If
        'DOB
        If TextBox9.Text <> String.Empty Then
            If filterexpression = String.Empty Then
                filterexpression = "([DOB] LIKE '%{7}%')"
            Else
                filterexpression &= " AND ([DOB] LIKE '%{7}%')"
            End If
        End If
        If DropDownList1.SelectedValue <> "*" Then
            If filterexpression <> String.Empty Then
                filterexpression &= " AND ([Course] LIKE '%{1}%')"
            Else
                filterexpression = "([Course] LIKE '%{1}%')"
            End If
        End If
        SqlDataSource1.FilterExpression = filterexpression
        GridView1.DataBind()
    End Sub

    Private Sub SqlDataSource1_Filtering(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceFilteringEventArgs) Handles SqlDataSource1.Filtering
        
        'If e.Command.Parameters(0).Value = String.Empty Then
        '    e.Command.Parameters(0).Value = DBNull.Value
        'End If

        'If e.Command.Parameters(1).Value = String.Empty Then
        '    e.Command.Parameters(1).Value = DBNull.Value
        'End If

        'If e.Command.Parameters(2).Value = String.Empty Then
        '    e.Command.Parameters(2).Value = DBNull.Value
        'End If

        'If e.Command.Parameters(3).Value = String.Empty Then
        '    e.Command.Parameters(3).Value = DBNull.Value
        'End If

        'If e.Command.Parameters(4).Value = String.Empty Then
        '    e.Command.Parameters(4).Value = DBNull.Value
        'End If

        'If e.Command.Parameters(5).Value = String.Empty Then
        '    e.Command.Parameters(5).Value = DBNull.Value
        'End If

        'If e.Command.Parameters(6).Value = String.Empty Then
        '    e.Command.Parameters(6).Value = DBNull.Value
        'End If

        'If e.Command.Parameters(7).Value = String.Empty Then
        '    e.Command.Parameters(7).Value = DBNull.Value
        'End If

        'If e.Command.Parameters(8).Value = String.Empty Then
        '    e.Command.Parameters(8).Value = DBNull.Value
        'End If
    End Sub

    Private Sub DropDownList1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.DataBound
        DropDownList1.Items.Add("*")
    End Sub
End Class
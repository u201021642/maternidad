Public Class Index
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Usuario") IsNot Nothing Then
            Dim usuario As New CapaEntities.Usuario
            usuario = Session("Usuario")
            txtFecha.Text = DateTime.Now.ToString("dd/MM/yyyy")
            txtUsuario.Text = usuario.empleado.nombre
        Else
            Response.Redirect("/Account/Login.aspx")
        End If
    End Sub

    Protected Sub btnGestionar_Click(sender As Object, e As EventArgs) Handles btnGestionar.Click
        Response.Redirect("Pacientes.aspx")
    End Sub

    Protected Sub btnCerrarSesion_Click(sender As Object, e As EventArgs) Handles btnCerrarSesion.Click
        Session("Usuario") = Nothing
        Session("Paciente") = Nothing
        Session("Caso") = Nothing
        Response.Redirect("/Account/Login.aspx")
    End Sub
End Class
Public Class EvaluarRiesgoFetal
    Inherits System.Web.UI.Page
    Dim usuario As CapaEntities.Usuario
    Dim paciente As CapaEntities.Paciente
    Dim caso As CapaEntities.Caso
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Usuario") IsNot Nothing Then
            usuario = Session("Usuario")
            txtUsuario.Text = usuario.empleado.nombre
            txtFecha.Text = DateTime.Now.ToString("dd/MM/yyyy")

            If Session("Paciente") IsNot Nothing Then
                paciente = Session("Paciente")
                txtPaciente.Text = paciente.descripcion
                txtHistoria.Text = paciente.hc
                txtId.Text = paciente.id
                txtEdad.Text = paciente.edad

                If Session("Caso") IsNot Nothing Then
                    Caso = Session("Caso")
                    txtCaso.Text = Caso.numero
                    txtFechaCaso.Text = Caso.fecha
                    txtHoraCaso.Text = Caso.hora
                    lblCaso.Text = caso.numero
                    txtCodigo.Text = caso.numero
                End If
            End If
        Else
            Response.Redirect("/Account/Login.aspx")
        End If
    End Sub

    Protected Sub btnExamenes_Click(sender As Object, e As EventArgs) Handles btnExamenes.Click
        Response.Redirect("Default.aspx")
    End Sub

    Protected Sub btnSalir_Click(sender As Object, e As EventArgs) Handles btnSalir.Click
        Response.Redirect("Menu.aspx")
    End Sub
    Protected Sub btnCerrarSesion_Click(sender As Object, e As EventArgs) Handles btnCerrarSesion.Click
        Session("Usuario") = Nothing
        Session("Paciente") = Nothing
        Session("Caso") = Nothing
        Response.Redirect("/Account/Login.aspx")
    End Sub
End Class
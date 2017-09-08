Public Class Menu
    Inherits System.Web.UI.Page
    Dim usuario As CapaEntities.Usuario
    Dim paciente As CapaEntities.Paciente
    Dim caso As CapaEntities.Caso
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Session("Usuario") IsNot Nothing Then
                usuario = Session("Usuario")
                txtUsuario.Text = usuario.empleado.Nombre
                txtFecha.Text = DateTime.Now.ToString("dd/MM/yyyy")

                If Session("Paciente") IsNot Nothing Then
                    paciente = Session("Paciente")
                    txtPaciente.Text = paciente.Descripcion
                    txtHistoria.Text = paciente.Hc
                    txtId.Text = paciente.Id
                    txtEdad.Text = paciente.Edad

                    If Session("Caso") IsNot Nothing Then
                        Caso = Session("Caso")
                        txtCaso.Text = Caso.Numero
                        txtFechaCaso.Text = Caso.Fecha
                        txtHoraCaso.Text = caso.Hora
                    End If
                End If


            Else
                Response.Redirect("/Account/Login.aspx")
            End If
        End If
    End Sub
    Protected Sub btnCerrarSesion_Click(sender As Object, e As EventArgs) Handles btnCerrarSesion.Click
        Session("Usuario") = Nothing
        Session("Paciente") = Nothing
        Response.Redirect("/Account/Login.aspx")
    End Sub

    Protected Sub btnRiesgoFetal_Click(sender As Object, e As EventArgs) Handles btnRiesgoFetal.Click
        Response.Redirect("EvaluarRiesgoFetal.aspx")
    End Sub

    Protected Sub btnControlFetal_Click(sender As Object, e As EventArgs) Handles btnControlFetal.Click
        Response.Redirect("ControlFetal.aspx")
    End Sub

    Protected Sub btnEmbarazo_Click(sender As Object, e As EventArgs) Handles btnEmbarazo.Click
        Response.Redirect("EvaluarEmbarazoEctopico.aspx")
    End Sub

    Protected Sub btnSalir_Click(sender As Object, e As EventArgs) Handles btnSalir.Click
        Response.Redirect("Pacientes.aspx")
    End Sub
End Class
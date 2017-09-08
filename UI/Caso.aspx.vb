Imports CapaEntities.Paciente
Imports CapaLogic.PacientesLogic
Public Class Caso
    Inherits System.Web.UI.Page
    Dim paciente As CapaEntities.Paciente
    Dim casoActual As CapaEntities.Caso
    Dim pacientesLogic As CapaLogic.PacientesLogic
    Dim usuario As CapaEntities.Usuario
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Usuario") IsNot Nothing Then
            paciente = New CapaEntities.Paciente
            casoActual = New CapaEntities.Caso
            pacientesLogic = New CapaLogic.PacientesLogic
            txtFecha.Text = DateTime.Now.ToString("dd/MM/yyyy")
            usuario = Session("Usuario")
            txtUsuario.Text = usuario.empleado.nombre
            If Session("Paciente") IsNot Nothing Then
                paciente = Session("Paciente")
                txtPaciente.Text = paciente.descripcion
                txtHistoria.Text = paciente.hc
                txtId.Text = paciente.id
                txtEdad.Text = paciente.edad
                casoActual = pacientesLogic.getUltimoCaso(paciente.id)
                If casoActual IsNot Nothing Then
                    lblFechaCaso.Text = "Creado el " & CDate(casoActual.fecha).ToString("dd 'de' MMMM 'del' yyyy")
                    Session("Caso") = casoActual
                End If
            End If
        Else
            Response.Redirect("/Account/Login.aspx")
        End If
    End Sub

    Protected Sub btnAbrirCaso_Click(sender As Object, e As EventArgs) Handles btnAbrirCaso.Click
        If rbCaso.SelectedValue = "0" Then
            pacientesLogic.insertarCaso(usuario, paciente)
            casoActual = pacientesLogic.getUltimoCaso(paciente.id)
            Session("Caso") = casoActual
        End If
        Response.Redirect("Menu.aspx")
    End Sub

    Protected Sub btnSalir_Click(sender As Object, e As EventArgs) Handles btnSalir.Click
        Response.Redirect("Pacientes.aspx")
    End Sub

    Protected Sub btnCerrarSesion_Click(sender As Object, e As EventArgs) Handles btnCerrarSesion.Click
        Session("Usuario") = Nothing
        Session("Paciente") = Nothing
        Response.Redirect("/Account/Login.aspx")
    End Sub

    Protected Sub rbCaso_SelectedIndexChanged(sender As Object, e As EventArgs) Handles rbCaso.SelectedIndexChanged
        If rbCaso.SelectedValue = "0" Then
            lblFechaCaso.Text = ""
        Else
            lblFechaCaso.Text = "Creado el " & CDate(casoActual.fecha).ToString("dd 'de' MMMM 'del' yyyy")
            Session("Caso") = casoActual
        End If
    End Sub
End Class
Imports CapaLogic.PacientesLogic
Imports CapaEntities.Paciente
Public Class Pacientes
    Inherits System.Web.UI.Page
    Dim pacientesLogic As CapaLogic.PacientesLogic
    Dim paciente As New CapaEntities.Paciente
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Usuario") IsNot Nothing Then
            pacientesLogic = New CapaLogic.PacientesLogic
            Dim usuario As New CapaEntities.Usuario
            usuario = Session("Usuario")
            txtFecha.Text = DateTime.Now.ToString("dd/MM/yyyy")
            txtUsuario.Text = usuario.empleado.nombre
            gvPacientes.DataSource = pacientesLogic.getPacientes(txtId.Text, txtNombre.Text)
            gvPacientes.DataBind()
        Else
            Response.Redirect("/Account/Login.aspx")
        End If
    End Sub

    Protected Sub btnBuscar_Click(sender As Object, e As EventArgs) Handles btnBuscar.Click
        gvPacientes.DataSource = pacientesLogic.getPacientes(txtId.Text, txtNombre.Text)
        gvPacientes.DataBind()
    End Sub

    Protected Sub btnSalir_Click(sender As Object, e As EventArgs) Handles btnSalir.Click
        Response.Redirect("Index.aspx")
    End Sub

    Protected Sub btnAbrirCaso_Click(sender As Object, e As EventArgs) Handles btnAbrirCaso.Click
        Response.Redirect("Caso.aspx")
    End Sub

    Protected Sub btnCerrarSesion_Click(sender As Object, e As EventArgs) Handles btnCerrarSesion.Click
        Session("Usuario") = Nothing
        Session("Paciente") = Nothing
        Session("Caso") = Nothing
        Response.Redirect("/Account/Login.aspx")
    End Sub

    Protected Sub gvPacientes_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gvPacientes.SelectedIndexChanged
        paciente.id = gvPacientes.SelectedRow.Cells(0).Text
        paciente.descripcion = gvPacientes.SelectedRow.Cells(1).Text & " " & gvPacientes.SelectedRow.Cells(2).Text
        paciente.edad = gvPacientes.SelectedRow.Cells(3).Text
        paciente.hc = gvPacientes.SelectedRow.Cells(4).Text
        Session("Paciente") = paciente
        btnAbrirCaso.Enabled = True
    End Sub
End Class
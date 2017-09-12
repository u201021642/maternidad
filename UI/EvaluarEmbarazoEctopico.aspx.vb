Imports Newtonsoft.Json

Public Class EvaluarEmbarazoEctopico
    Inherits System.Web.UI.Page
    Dim catalogoLogic As CapaLogic.CatalogoLogic
    Dim paciente As CapaEntities.Paciente
    Dim caso As CapaEntities.Caso
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Usuario") IsNot Nothing Then
            catalogoLogic = New CapaLogic.CatalogoLogic
            Dim lstTestEmbarazos = catalogoLogic.getCatalagoByCodigo("TestEmbarazoOrina")
            Dim lstLocalizaciones = catalogoLogic.getCatalagoByCodigo("Localizacion")
            Dim lstMerfologias = catalogoLogic.getCatalagoByCodigo("Morfologia")
            Dim lstSangradosVaginales = catalogoLogic.getCatalagoByCodigo("SangradoVaginal")
            Dim lstDolores = catalogoLogic.getCatalagoByCodigo("Dolor")
            Dim lstEstructuras = catalogoLogic.getCatalagoByCodigo("Estructura")
            Dim lstAccionesTomar = catalogoLogic.getCatalagoByCodigo("AccionTomar")
            Dim lstImpresionesSubjetivas = catalogoLogic.getCatalagoByCodigo("ImpresionSubjectiva")
            Dim lstGradosCertezas = catalogoLogic.getCatalagoByCodigo("GradoCerteza")
            Dim dictionary As New Dictionary(Of String, Object)


            dictionary.Add("testEmbarazoOrinas", lstTestEmbarazos)
            dictionary.Add("localizaciones", lstLocalizaciones)
            dictionary.Add("morfologias", lstMerfologias)
            dictionary.Add("sangradoVaginales", lstSangradosVaginales)
            dictionary.Add("dolores", lstDolores)
            dictionary.Add("estructuras", lstEstructuras)
            dictionary.Add("acciones", lstAccionesTomar)
            dictionary.Add("impresionSubjetivas", lstImpresionesSubjetivas)
            dictionary.Add("gradosCertezas", lstGradosCertezas)


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
                    lblCaso.Text = Caso.Numero
                    'txtCodigo.Text = Caso.numero
                End If
                dictionary.Add("idCaso", caso.Id)
            End If

            Session("listas") = JsonConvert.SerializeObject(dictionary, Formatting.Indented)
        Else
            Response.Redirect("/Account/Login.aspx")
        End If

    End Sub

    Protected Sub btnSalir_Click(sender As Object, e As EventArgs) Handles btnSalir.Click
        Response.Redirect("Menu.aspx")
    End Sub
End Class
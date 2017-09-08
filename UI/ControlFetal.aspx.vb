Public Class ControlFetal
    Inherits System.Web.UI.Page
    Dim usuario As CapaEntities.Usuario
    Dim paciente As CapaEntities.Paciente
    Dim caso As CapaEntities.Caso
    Dim generalLogic As CapaLogic.GeneralLogic
    Dim controlFetal As New CapaEntities.ControlFetal
    Dim pacientesLogic As New CapaLogic.PacientesLogic
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
                        caso = Session("Caso")
                        txtCaso.Text = caso.Numero
                        txtFechaCaso.Text = caso.Fecha
                        txtHoraCaso.Text = caso.Hora
                        lblCaso.Text = caso.Numero
                    End If
                End If

                generalLogic = New CapaLogic.GeneralLogic
                cboHallazgos.DataSource = generalLogic.getCombos("Hallazgos")
                cboHallazgos.DataBind()
                cboActividadCardiaca.DataSource = generalLogic.getCombos("ActividadCardiacaFetal")
                cboActividadCardiaca.DataBind()
                cboGrupoEtnico.DataSource = generalLogic.getCombos("GrupoEtnico")
                cboGrupoEtnico.DataBind()
                cboHuesoNasal.DataSource = generalLogic.getCombos("HuesoNasal")
                cboHuesoNasal.DataBind()
                cboTricuspideDoppler.DataSource = generalLogic.getCombos("TricuspideDoppler")
                cboTricuspideDoppler.DataBind()
                cboVCDoppler.DataSource = generalLogic.getCombos("VCDoppler")
                cboVCDoppler.DataBind()
                cboCraneoCerebro.DataSource = generalLogic.getCombos("Cerebro")
                cboCraneoCerebro.DataBind()
                cboEspina.DataSource = generalLogic.getCombos("Espina")
                cboEspina.DataBind()
                cboCorazon.DataSource = generalLogic.getCombos("Corazon")
                cboCorazon.DataBind()
                cboParedAbdominal.DataSource = generalLogic.getCombos("ParedAbdominal")
                cboParedAbdominal.DataBind()
                cboEstomago.DataSource = generalLogic.getCombos("Estomago")
                cboEstomago.DataBind()
                cboVejigaRinones.DataSource = generalLogic.getCombos("Vejiga")
                cboVejigaRinones.DataBind()
                cboManos.DataSource = generalLogic.getCombos("Manos")
                cboManos.DataBind()
                cboPies.DataSource = generalLogic.getCombos("Pies")
                cboPies.DataBind()
                cboPlacenta.DataSource = generalLogic.getCombos("Placenta")
                cboPlacenta.DataBind()
                cboLiquidoAmniotico.DataSource = generalLogic.getCombos("LiquidoAmniotico")
                cboLiquidoAmniotico.DataBind()
                cboCordon.DataSource = generalLogic.getCombos("Cordon")
                cboCordon.DataBind()
                cboInsercionCordon.DataSource = generalLogic.getCombos("InsercionCordon")
                cboInsercionCordon.DataBind()
            Else
                Response.Redirect("/Account/Login.aspx")
            End If
        End If
    End Sub
    Protected Sub btnCerrarSesion_Click(sender As Object, e As EventArgs) Handles btnCerrarSesion.Click
        Session("Usuario") = Nothing
        Session("Paciente") = Nothing
        Session("Caso") = Nothing
        Response.Redirect("/Account/Login.aspx")
    End Sub

    Protected Sub btnTransferirMedidas_Click(sender As Object, e As EventArgs) Handles btnTransferirMedidas.Click
        Randomize()
        txtRangoFetal.Text = CInt((180 - 120) * Rnd() + 120)
        txtCrl.Text = CInt((80 - 40) * Rnd() + 40)
        txtNTSobre.Text = CInt((150 - 50) * Rnd() + 50)
        txtNTDebajo.Text = CInt((150 - 50) * Rnd() + 50)
        txtNT.Text = CInt((150 - 50) * Rnd() + 50)
        txtBPD.Text = CInt((40 - 0) * Rnd() + 0)
        txtHC.Text = CInt((100 - 40) * Rnd() + 40)
        txtAC.Text = CInt((60 - 40) * Rnd() + 40)
        txtFL.Text = CInt((20 - 0) * Rnd() + 0)
        txtAnguloFacial.Text = CInt((120 - 60) * Rnd() + 60)
    End Sub

    Protected Sub btnGenerarInforme_Click(sender As Object, e As EventArgs) Handles btnGenerarInforme.Click
        If IsValid Then
            controlFetal.IdHallazgos = cboHallazgos.Value
            controlFetal.IdActividadCardiacaFetal = cboActividadCardiaca.Value
            controlFetal.RangoFetalCardiaco = txtRangoFetal.Text
            controlFetal.CRL = txtCrl.Text
            controlFetal.NTsobreCordon = txtNTSobre.Text
            controlFetal.NTdebajoCordon = txtNTDebajo.Text
            controlFetal.NT = txtNT.Text
            controlFetal.BPD = txtBPD.Text
            controlFetal.HC = txtHC.Text
            controlFetal.AC = txtAC.Text
            controlFetal.FL = txtFL.Text
            controlFetal.IdGrupoEtnico = cboGrupoEtnico.Value
            controlFetal.IdHuesoNasal = cboHuesoNasal.Value
            controlFetal.AnguloFacial = txtAnguloFacial.Text
            controlFetal.IdTricuspideDoppler = cboTricuspideDoppler.Value
            controlFetal.IdVCdoppler = cboVCDoppler.Value
            controlFetal.IdCerebro = cboCraneoCerebro.Value
            controlFetal.IdEespina = cboEspina.Value
            controlFetal.IdCorazon = cboCorazon.Value
            controlFetal.IdParedAbdominal = cboParedAbdominal.Value
            controlFetal.IdEstomago = cboEstomago.Value
            controlFetal.IdVejiga = cboVejigaRinones.Value
            controlFetal.IdManos = cboManos.Value
            controlFetal.IdPies = cboPies.Value
            controlFetal.IdPlacenta = cboPlacenta.Value
            controlFetal.Comentarios = txtComentarios.Text
            controlFetal.IdLiquidoAmniotico = cboLiquidoAmniotico.Value
            controlFetal.IdCordon = cboCordon.Value
            controlFetal.IdInsercionCordon = cboInsercionCordon.Value
            Dim caso As New CapaEntities.Caso
            If Session("Caso") IsNot Nothing Then
                caso = Session("Caso")
                controlFetal.IdCasoPaciente = caso.Id
            Else
                controlFetal.IdCasoPaciente = 5
            End If
            Dim id As Integer = pacientesLogic.insertControlFetal(controlFetal)
            'Response.Redirect("/Reportes/ReporteControlFetal.aspx?id=" & id)
            ScriptManager.RegisterStartupScript(Me, GetType(Page), "Reporte", "<script>window.open('/Reportes/ReporteControlFetal.aspx' + '?id=' + " & id & ", '_blank');</script>", False)
            'ScriptManager.RegisterStartupScript(Me, GetType(Page), "Reporte", "window.open('/Reportes/ReporteControlFetal.aspx' + '?id=' + " & id & ", '_blank');", False)
            'Response.Write("<script>window.open('/Reportes/ReporteControlFetal.aspx?id='" & id & ",'_blank')</script>")
        End If
    End Sub

    Protected Sub btnSalir_Click(sender As Object, e As EventArgs) Handles btnSalir.Click
        Response.Redirect("Menu.aspx")
    End Sub
End Class
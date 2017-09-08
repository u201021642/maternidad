Imports CapaEntities.Bioquimica
Public Class _Default
    Inherits Page
    Dim usuario As CapaEntities.Usuario
    Dim paciente As CapaEntities.Paciente
    Dim caso As CapaEntities.Caso
    Dim generalLogic As CapaLogic.GeneralLogic
    Dim bioquimica As New CapaEntities.Bioquimica
    Dim doppler As New CapaEntities.Doppler
    Dim pacientesLogic As New CapaLogic.PacientesLogic
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            If Session("Usuario") IsNot Nothing Then
                bioquimica.Id = 0
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
                cboGrupoDoppler.DataSource = generalLogic.getCombos("GrupoEtnico")
                cboGrupoDoppler.DataBind()
                cboFumadorDoppler.DataSource = generalLogic.getCombos("Fumador")
                cboFumadorDoppler.DataBind()
                cboConcepcion.DataSource = generalLogic.getCombos("Concepcion")
                cboConcepcion.DataBind()
                cboOvulacionDoppler.DataSource = generalLogic.getCombos("OvulacionInducida")
                cboOvulacionDoppler.DataBind()
                cboManufacturador.DataSource = generalLogic.getCombos("KitManufacturador")
                cboManufacturador.DataBind()
                cboGrupo.DataSource = generalLogic.getCombos("GrupoEtnico")
                cboGrupo.DataBind()
                cboFumador.DataSource = generalLogic.getCombos("Fumador")
                cboFumador.DataBind()
                cboOvulacion.DataSource = generalLogic.getCombos("OvulacionInducida")
                cboOvulacion.DataBind()
                cboHipertension.DataSource = generalLogic.getCombos("HipertensionCronica")
                cboHipertension.DataBind()
                cboPrevEmbarazo.DataSource = generalLogic.getCombos("PETenPrevEmbarazo")
                cboPrevEmbarazo.DataBind()
                cboPetMadre.DataSource = generalLogic.getCombos("PETenMadrePaciente")
                cboPetMadre.DataBind()
            Else
                Response.Redirect("/Account/Login.aspx")
            End If
        End If

    End Sub

    Protected Sub btnTransferir_Click(sender As Object, e As EventArgs) Handles btnTransferir.Click

        Randomize()
        Dim piIzq1 = CInt((180 - 50) * Rnd() + 50)
        Dim piIzq2 = CInt((100 - 50) * Rnd() + 50)
        Dim piDer1 = CInt((180 - 50) * Rnd() + 50)
        Dim piDer2 = CInt((100 - 50) * Rnd() + 50)
        txtPiIzquierdo.Text = piIzq1 & "/" & piIzq2
        txtPiDerecho.Text = piDer1 & "/" & piDer2
        txtPiBajo.Text = Math.Min(piIzq1, piDer1) & "/" & Math.Min(piIzq2, piDer2)

        Dim map1 = CInt((180 - 50) * Rnd() + 50)
        Dim map2 = CInt((100 - 50) * Rnd() + 50)
        txtMedidasMapIzq.Text = map1 & "/" & map2
        txtSistoleIzq.Text = map1
        txtDiastoleIzq.Text = map2

        Dim map3 = CInt((180 - 50) * Rnd() + 50)
        Dim map4 = CInt((100 - 50) * Rnd() + 50)
        txtMedidasMapDer.Text = map3 & "/" & map4
        txtSistoleDer.Text = map3
        txtDiastoleDer.Text = map4

        txtMap.Text = Math.Min(map1, map3) & "/" & Math.Min(map2, map4)

    End Sub
    Protected Sub btnResultado_Click(sender As Object, e As EventArgs) Handles btnResultado.Click
        If txtExamen.Text <> "" Then
            Dim examen As Integer = CInt(txtExamen.Text)
            Dim bio As New CapaEntities.Bioquimica
            bio = pacientesLogic.getBioquimicaExamen(examen)

            If bio IsNot Nothing Then
                bioquimica = bio
                txtFechaMuestra.Text = bio.FechaMuestra.ToString("yyyy-MM-dd")
                txtGa.Text = bio.GaPorCrl
                txtPesoMadre.Text = bio.PesoMadre
                cboGrupo.Value = bio.IdGrupoEtnico
                cboFumador.Value = bio.IdFumador
                cboConcepcion.Value = bio.IdConcepcion
                cboOvulacion.Value = bio.IdOvulacion
                txtParidad.Text = bio.Paridad
                cboManufacturador.Value = bio.IdKitManufacturador
                txtFechaMuestra2.Text = bio.FechaMuestraIU.ToString("yyyy-MM-dd")
                txtGACrl.Text = bio.GaPorCrlIU
                txtPigf.Text = bio.Pigf
            Else
                limpiarCampos()
            End If
        End If

    End Sub

    Public Sub limpiarCampos()
        bioquimica.Id = 0
        txtFechaMuestra.Text = ""
        txtGa.Text = ""
        txtPesoMadre.Text = ""
        cboGrupo.Value = 0
        cboFumador.Value = 0
        cboConcepcion.Value = 0
        cboOvulacion.Value = 0
        txtParidad.Text = ""
        cboManufacturador.Value = 0
        txtFechaMuestra2.Text = ""
        txtGACrl.Text = ""
        txtPigf.Text = ""
    End Sub

    Protected Sub btnCancelarDoppler_Click(sender As Object, e As EventArgs) Handles btnCancelarDoppler.Click
        Response.Redirect("EvaluarRiesgoFetal.aspx")
    End Sub

    Protected Sub btnCancelarBioquimica_Click(sender As Object, e As EventArgs) Handles btnCancelarBioquimica.Click
        Response.Redirect("EvaluarRiesgoFetal.aspx")
    End Sub
    Protected Sub btnCerrarSesion_Click(sender As Object, e As EventArgs) Handles btnCerrarSesion.Click
        Session("Usuario") = Nothing
        Session("Paciente") = Nothing
        Response.Redirect("/Account/Login.aspx")
    End Sub

    Protected Sub btnEvaluarBioquima_Click(sender As Object, e As EventArgs) Handles btnEvaluarBioquimica.Click
        If IsValid Then
            bioquimica.NumExamen = txtExamen.Text
            bioquimica.FechaMuestra = txtFechaMuestra.Text
            bioquimica.GaPorCrl = txtGa.Text
            bioquimica.PesoMadre = txtPesoMadre.Text
            bioquimica.Paridad = txtParidad.Text
            bioquimica.FechaMuestraIU = txtFechaMuestra2.Text
            bioquimica.GaPorCrlIU = txtGACrl.Text
            bioquimica.Pigf = txtPigf.Text
            bioquimica.IdGrupoEtnico = cboGrupo.Value
            bioquimica.IdFumador = cboFumador.Value
            bioquimica.IdConcepcion = cboConcepcion.Value
            bioquimica.IdOvulacion = cboOvulacion.Value
            bioquimica.IdKitManufacturador = cboManufacturador.Value
            Dim bioAux As New CapaEntities.Bioquimica
            bioAux = pacientesLogic.getBioquimicaExamen(bioquimica.NumExamen)
            If bioAux Is Nothing Then
                pacientesLogic.insertBioquimica(bioquimica)
            Else
                bioquimica.Id = bioAux.Id
                pacientesLogic.updateBioquimica(bioquimica)
            End If
            Response.Redirect("EvaluarRiesgoFetal.aspx")
        End If
    End Sub
    Protected Sub btnEvaluarDoppler_Click(sender As Object, e As EventArgs) Handles btnEvaluarDoppler.Click
        If IsValid Then
            doppler.PesoMadre = txtPesoDoppler.Text
            doppler.EstaturaMadre = txtEstatura.Text
            doppler.Imc = CStr(doppler.PesoMadre / (doppler.EstaturaMadre * doppler.EstaturaMadre))
            doppler.Paridad = txtParidadDoppler.Text
            doppler.IdGrupoEtnico = cboGrupoDoppler.Value
            doppler.IdFumador = cboFumadorDoppler.Value
            doppler.IdOvulacion = cboOvulacionDoppler.Value
            doppler.IdHipertension = cboHipertension.Value
            doppler.IdPetEmbarazo = cboPrevEmbarazo.Value
            doppler.IdPetMadre = cboPetMadre.Value
            doppler.AuPizquierdo = txtPiIzquierdo.Text
            doppler.AuPderecho = txtPiDerecho.Text
            doppler.AuPbajo = txtPiBajo.Text
            doppler.BiMedidas = txtMedidasMapIzq.Text
            doppler.BiSistole = txtSistoleIzq.Text
            doppler.BiDiastole = txtDiastoleIzq.Text
            doppler.BdMedidas = txtMedidasMapDer.Text
            doppler.BdSistole = txtSistoleDer.Text
            doppler.BdDiastole = txtDiastoleDer.Text
            doppler.Map = txtMap.Text
            pacientesLogic.insertDoppler(doppler)
            Response.Redirect("EvaluarRiesgoFetal.aspx")
        End If
    End Sub
End Class
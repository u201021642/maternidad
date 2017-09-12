Imports CapaLogic
Imports CrystalDecisions.CrystalReports.Engine
Public Class ReporteEvaluarEmbarazoEctopico
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Usuario") IsNot Nothing Then
            If Not IsPostBack Then
                Dim usuario As New CapaEntities.Usuario
                usuario = Session("Usuario")

                Dim embarazoEctopicoLogic As EmbarazoEctopicoLogic = New EmbarazoEctopicoLogic
                Dim id = Request.QueryString("id")
                Dim rd As ReportDocument = New ReportDocument()
                Dim reportPath = Server.MapPath("~/Reportes/rpt/rptEvaluarEmbarazoEctopico.rpt")
                Dim obj = embarazoEctopicoLogic.GetEvaluacionEmbarazoEctopico(Convert.ToInt32(id))
                Try
                    rd.Load(reportPath)

                    rd.SetParameterValue("p_testEmbarazoOrina", obj.DesTestEmbarazoOrina)
                    rd.SetParameterValue("p_fechaUltimoPeriodo", obj.FechaUltimoPeriodo.ToString())
                    rd.SetParameterValue("p_localizacion", obj.DesLocalizacion)
                    rd.SetParameterValue("p_morfologia", obj.DesMorfologia)
                    rd.SetParameterValue("p_sangradoVaginal", obj.DesSangradoVaginal)
                    rd.SetParameterValue("p_dolor", obj.DesDolor)
                    rd.SetParameterValue("p_estructura", obj.DesEstructura)
                    rd.SetParameterValue("p_betaHcg", obj.Beta_hCG)
                    rd.SetParameterValue("p_prgt", obj.PRGT)
                    rd.SetParameterValue("p_accionTomar", obj.DesAccionTomar)
                    rd.SetParameterValue("p_fechaMuestra48h", obj.FechaMuestra.ToString())
                    rd.SetParameterValue("p_betaHcg48h", obj.Beta_hCG_48h)
                    rd.SetParameterValue("p_prgt48h", obj.PRGT_48h)
                    rd.SetParameterValue("p_impresionSubjetiva", obj.DesImpresionSubjetiva)
                    rd.SetParameterValue("p_embarazoEctopico", obj.EmbarazoEctopico)
                    rd.SetParameterValue("p_embarazoIntrauterino", obj.EmbarazoIntrauterino)
                    rd.SetParameterValue("p_tamanoAncho", obj.TamanoAncho)
                    rd.SetParameterValue("p_tamanoLargo", obj.TamanoLargo)
                    rd.SetParameterValue("p_tamanoAltura", obj.TamanoAlto)
                    rd.SetParameterValue("p_diametroMaximo", obj.DiametroMaximo)
                    rd.SetParameterValue("p_volumen", obj.Volumen)
                    rd.SetParameterValue("p_espesorEndometrial", obj.EspesorEndometrial)
                    rd.SetParameterValue("p_horaMuestra48h", "")
                    rd.SetParameterValue("p_gradoCerteza", obj.DesGradoCerteza)
                    rd.SetParameterValue("p_comentario", obj.Comentarios)
                    rd.SetParameterValue("p_usuario", usuario.empleado.Nombre)
                    rd.SetParameterValue("p_muestraSangre", If(obj.MuestraSangre = Nothing, "", obj.MuestraSangre))

                    rd.SetParameterValue("p_logo", "Content/img/logo.PNG")

                    crvReporte.ToolPanelView = CrystalDecisions.Web.ToolPanelViewType.None

                    crvReporte.ReportSource = rd
                    crvReporte.DataBind()
                Catch ex As Exception
                    Throw New Exception(ex.Message)
                End Try
            End If
        Else
            Response.Redirect("/Account/Login.aspx")

        End If
    End Sub

End Class
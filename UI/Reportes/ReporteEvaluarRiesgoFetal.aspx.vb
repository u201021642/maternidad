Imports CapaLogic
Imports CrystalDecisions.CrystalReports.Engine

Public Class ReporteEvaluarRiesgoFetal
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Usuario") IsNot Nothing Then
            If Not IsPostBack Then
                Dim id = Request.QueryString("id")
                Dim rd As ReportDocument = New ReportDocument()
                Dim reportPath = Server.MapPath("~/Reportes/rpt/rptEvaluarRiesgoFetal.rpt")
                Dim obj = EvaluacionRiesgoFetalLogic.GetEvaluacionRiesgoFetal(Convert.ToInt32(id))

                rd.Load(reportPath)

                rd.SetParameterValue("p_operadorFMF", obj.NomEmpleado)
                rd.SetParameterValue("p_codigoFMF", id)
                rd.SetParameterValue("p_concepcion", "Espontánea")
                rd.SetParameterValue("p_ovulacionInducida", obj.DescripcionCatalogo)
                rd.SetParameterValue("p_edadMadre", obj.EdadMadre)
                rd.SetParameterValue("p_riesgoFondoTrisomia21", obj.RiesgoFondo_t21)
                rd.SetParameterValue("p_riesgoFondoTrisomia18", obj.RiesgoFondo_t18)
                rd.SetParameterValue("p_riesgoFondoTrisomia13", obj.RiesgoFondo_t13)
                rd.SetParameterValue("p_riesgoAjustadoTrisomia21", obj.RiesgoAjustado_t21)
                rd.SetParameterValue("p_riesgoAjustadoTrisomia18", obj.RiesgoAjustado_t18)
                rd.SetParameterValue("p_riesgoAjustadoTrisomia13", obj.RiesgoAjustado_t13)
                rd.SetParameterValue("p_riesgoPreeclancia", obj.RiesgoPreEclampsia)
                rd.SetParameterValue("p_riesgoDesorHipert", obj.RiesgoDesorHipert)
                rd.SetParameterValue("p_muerteFetal", obj.MuerteFetal)
                rd.SetParameterValue("p_conclusiones", obj.Conclusiones)
                rd.SetParameterValue("p_caso", Session("Caso").numero)
                rd.SetParameterValue("p_logo", "Content/img/logo.PNG")

                crvReporte.ToolPanelView = CrystalDecisions.Web.ToolPanelViewType.None

                crvReporte.ReportSource = rd
                crvReporte.DataBind()

            End If
        Else
            Response.Redirect("/Account/Login.aspx")

        End If
    End Sub

End Class
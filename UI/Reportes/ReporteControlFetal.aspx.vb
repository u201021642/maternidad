Imports CapaLogic
Imports CrystalDecisions.CrystalReports.Engine
Public Class ReporteControlFetal
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Usuario") IsNot Nothing Then
            If Not IsPostBack Then
                Dim id = Request.QueryString("id")
                Dim rd As ReportDocument = New ReportDocument()
                Dim reportPath = Server.MapPath("~/Reportes/rpt/rptControlFetal.rpt")
                Dim pacientesLogic As New CapaLogic.PacientesLogic
                Dim data As New DataTable
                data = pacientesLogic.getControlFetal(CInt(id))


                rd.Load(reportPath)
                rd.SetDataSource(data)

                Dim usuario As New CapaEntities.Usuario
                usuario = Session("Usuario")
                Dim paciente As New CapaEntities.Paciente
                paciente = Session("Paciente")
                Dim caso As New CapaEntities.Caso
                caso = Session("Caso")
                rd.SetParameterValue("usuario", usuario.Usuario)
                rd.SetParameterValue("caso", caso.Numero)
                rd.SetParameterValue("paciente", paciente.Descripcion)
                rd.SetParameterValue("hc", paciente.Hc)
                rd.SetParameterValue("edad", paciente.Edad)

                crvReporte.ToolPanelView = CrystalDecisions.Web.ToolPanelViewType.None

                crvReporte.ReportSource = rd
                crvReporte.DataBind()

            End If
        Else
            Response.Redirect("/Account/Login.aspx")

        End If
    End Sub

End Class
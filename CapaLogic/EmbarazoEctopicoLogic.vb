Imports CapaDAO.Conexion
Imports CapaEntities
Public Class EmbarazoEctopicoLogic
    Dim cnx As CapaDAO.Conexion = New CapaDAO.Conexion
    Public Function insertEvaluacionEmbarazoEctopico(ByVal objEvaluacion As EmbarazoEctopico)
        Dim id = cnx.insertEvaluacionEmbarazoEctopico(objEvaluacion)
        Return id
    End Function
    Public Function GetEvaluacionEmbarazoEctopico(ByVal id As Integer) As EmbarazoEctopico
        Dim lst = cnx.GetEvaluacionEmbarazoEctopico(id)
        Return Comun.ConvertDataTableToList(Of EmbarazoEctopico)(lst).Item(0)
    End Function
End Class

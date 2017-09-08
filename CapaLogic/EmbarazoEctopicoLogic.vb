Imports CapaDAO.Conexion
Imports CapaEntities
Public Class EmbarazoEctopicoLogic
    Dim cnx As CapaDAO.Conexion = New CapaDAO.Conexion
    Public Function insertEvaluacionEmbarazoEctopico(ByVal objEvaluacion As EmbarazoEctopico)
        Dim id = cnx.insertEvaluacionEmbarazoEctopico(objEvaluacion)
        Return id
    End Function
End Class

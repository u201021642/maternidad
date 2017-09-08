Imports CapaDAO.Conexion
Imports CapaEntities
Public Module EvaluacionRiesgoFetalLogic
    Dim cnx As CapaDAO.Conexion = New CapaDAO.Conexion
    Public Function insertEvaluacionRiesgoFetal(ByVal objEvaluacion As EvaluacionRiesgoFetal)
        Dim id = cnx.insertEvaluacionRiesgoFetal(objEvaluacion)
        Return id
    End Function
    Public Function GetEvaluacionRiesgoFetal(ByVal id As Integer) As EvaluacionRiesgoFetal
        Dim lst = cnx.GetEvaluacionRiesgoFetal(id)
        Return Comun.ConvertDataTableToList(Of EvaluacionRiesgoFetal)(lst).Item(0)
    End Function
End Module

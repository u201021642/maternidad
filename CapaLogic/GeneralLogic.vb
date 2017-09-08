Imports CapaDAO.Conexion
Public Class GeneralLogic
    Dim cnx As CapaDAO.Conexion
    Public Function getCombos(ByVal codigo As String) As DataTable
        cnx = New CapaDAO.Conexion
        Return cnx.getCombos(codigo)
    End Function
End Class

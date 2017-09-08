Imports CapaDAO.Conexion
Public Class UsuarioLogic
    Dim cnx As CapaDAO.Conexion
    Public Function validarAcceso(ByVal email As String, ByVal password As String) As DataTable
        cnx = New CapaDAO.Conexion
        Return cnx.validarAcceso(email, password)
    End Function
End Class

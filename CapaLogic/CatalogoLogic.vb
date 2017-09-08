Imports CapaDAO.Conexion
Imports CapaEntities
Public Class CatalogoLogic
    Dim cnx As CapaDAO.Conexion
    Public Function getCatalagoByCodigo(ByVal codigo As String) As List(Of Catalogo)
        cnx = New CapaDAO.Conexion
        Dim lst = cnx.getCatalagoByCodigo(codigo)
        Return Comun.ConvertDataTableToList(Of Catalogo)(lst)
    End Function
End Class

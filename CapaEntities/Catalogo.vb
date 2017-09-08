Public Class Catalogo
    Private _idCatalogo As Integer
    Private _codCatalogo As String
    Private _descripcionCatalogo As String

    Public Property IdCatalogo As Integer
        Get
            Return _idCatalogo
        End Get
        Set(value As Integer)
            _idCatalogo = value
        End Set
    End Property

    Public Property CodCatalogo As String
        Get
            Return _codCatalogo
        End Get
        Set(value As String)
            _codCatalogo = value
        End Set
    End Property

    Public Property DescripcionCatalogo As String
        Get
            Return _descripcionCatalogo
        End Get
        Set(value As String)
            _descripcionCatalogo = value
        End Set
    End Property
End Class

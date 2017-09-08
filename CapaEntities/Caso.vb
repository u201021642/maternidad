Public Class Caso
    Private _id As Integer
    Private _numero As String
    Private _fecha As String
    Private _hora As String

    Public Property Id As Integer
        Get
            Return _id
        End Get
        Set(value As Integer)
            _id = value
        End Set
    End Property

    Public Property Numero As String
        Get
            Return _numero
        End Get
        Set(value As String)
            _numero = value
        End Set
    End Property

    Public Property Fecha As String
        Get
            Return _fecha
        End Get
        Set(value As String)
            _fecha = value
        End Set
    End Property

    Public Property Hora As String
        Get
            Return _hora
        End Get
        Set(value As String)
            _hora = value
        End Set
    End Property
End Class

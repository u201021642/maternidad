Public Class Paciente
    Private _id As Integer
    Private _descripcion As String
    Private _hc As String
    Private _edad As Integer

    Public Property Id As Integer
        Get
            Return _id
        End Get
        Set(value As Integer)
            _id = value
        End Set
    End Property

    Public Property Descripcion As String
        Get
            Return _descripcion
        End Get
        Set(value As String)
            _descripcion = value
        End Set
    End Property

    Public Property Hc As String
        Get
            Return _hc
        End Get
        Set(value As String)
            _hc = value
        End Set
    End Property

    Public Property Edad As Integer
        Get
            Return _edad
        End Get
        Set(value As Integer)
            _edad = value
        End Set
    End Property
End Class

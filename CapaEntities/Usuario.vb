Public Class Usuario
    Private _id As Integer
    Private _usuario As String
    Private _email As String
    Private _empleado As Empleado

    Public Property Id As Integer
        Get
            Return _id
        End Get
        Set(value As Integer)
            _id = value
        End Set
    End Property

    Public Property Usuario As String
        Get
            Return _usuario
        End Get
        Set(value As String)
            _usuario = value
        End Set
    End Property

    Public Property Email As String
        Get
            Return _email
        End Get
        Set(value As String)
            _email = value
        End Set
    End Property

    Public Property empleado As Empleado
        Get
            Return _empleado
        End Get
        Set(value As Empleado)
            _empleado = value
        End Set
    End Property

    Public Sub New()
        empleado = New Empleado
    End Sub
End Class

Public Class Empleado
    Private _id As Integer
    Private _dni As String
    Private _nombre As String
    Private _profesion As String
    Private _idEspecialidad As Integer

    Public Property Id As Integer
        Get
            Return _id
        End Get
        Set(value As Integer)
            _id = value
        End Set
    End Property

    Public Property Dni As String
        Get
            Return _dni
        End Get
        Set(value As String)
            _dni = value
        End Set
    End Property

    Public Property Nombre As String
        Get
            Return _nombre
        End Get
        Set(value As String)
            _nombre = value
        End Set
    End Property

    Public Property Profesion As String
        Get
            Return _profesion
        End Get
        Set(value As String)
            _profesion = value
        End Set
    End Property

    Public Property IdEspecialidad As Integer
        Get
            Return _idEspecialidad
        End Get
        Set(value As Integer)
            _idEspecialidad = value
        End Set
    End Property
End Class

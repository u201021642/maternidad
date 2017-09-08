Public Class EvaluacionRiesgoFetal
    Private _idRiesgoFetal As Integer
    Private _idFMF As Integer
    Private _idCatalogo As Integer
    Private _edadMadre As Integer
    Private _riesgoFondo_t21 As String
    Private _riesgoFondo_t18 As String
    Private _riesgoFondo_t13 As String
    Private _riesgoAjustado_t21 As String
    Private _riesgoAjustado_t18 As String
    Private _riesgoAjustado_t13 As String
    Private _riesgoPreEclampsia As String
    Private _riesgoDesorHipert As Integer
    Private _muerteFetal As Integer
    Private _conclusiones As String
    Private _descripcionCatalogo As String
    Private _nomEmpleado As String
    Public Property IdRiesgoFetal As Integer
        Get
            Return _idRiesgoFetal
        End Get
        Set(value As Integer)
            _idRiesgoFetal = value
        End Set
    End Property

    Public Property IdFMF As Integer
        Get
            Return _idFMF
        End Get
        Set(value As Integer)
            _idFMF = value
        End Set
    End Property

    Public Property IdCatalogo As Integer
        Get
            Return _idCatalogo
        End Get
        Set(value As Integer)
            _idCatalogo = value
        End Set
    End Property

    Public Property EdadMadre As Integer
        Get
            Return _edadMadre
        End Get
        Set(value As Integer)
            _edadMadre = value
        End Set
    End Property

    Public Property RiesgoFondo_t21 As String
        Get
            Return _riesgoFondo_t21
        End Get
        Set(value As String)
            _riesgoFondo_t21 = value
        End Set
    End Property

    Public Property RiesgoFondo_t18 As String
        Get
            Return _riesgoFondo_t18
        End Get
        Set(value As String)
            _riesgoFondo_t18 = value
        End Set
    End Property

    Public Property RiesgoFondo_t13 As String
        Get
            Return _riesgoFondo_t13
        End Get
        Set(value As String)
            _riesgoFondo_t13 = value
        End Set
    End Property

    Public Property RiesgoAjustado_t21 As String
        Get
            Return _riesgoAjustado_t21
        End Get
        Set(value As String)
            _riesgoAjustado_t21 = value
        End Set
    End Property

    Public Property RiesgoAjustado_t18 As String
        Get
            Return _riesgoAjustado_t18
        End Get
        Set(value As String)
            _riesgoAjustado_t18 = value
        End Set
    End Property

    Public Property RiesgoAjustado_t13 As String
        Get
            Return _riesgoAjustado_t13
        End Get
        Set(value As String)
            _riesgoAjustado_t13 = value
        End Set
    End Property

    Public Property RiesgoPreEclampsia As String
        Get
            Return _riesgoPreEclampsia
        End Get
        Set(value As String)
            _riesgoPreEclampsia = value
        End Set
    End Property

    Public Property RiesgoDesorHipert As Integer
        Get
            Return _riesgoDesorHipert
        End Get
        Set(value As Integer)
            _riesgoDesorHipert = value
        End Set
    End Property

    Public Property MuerteFetal As Integer
        Get
            Return _muerteFetal
        End Get
        Set(value As Integer)
            _muerteFetal = value
        End Set
    End Property

    Public Property Conclusiones As String
        Get
            Return _conclusiones
        End Get
        Set(value As String)
            _conclusiones = value
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

    Public Property NomEmpleado As String
        Get
            Return _nomEmpleado
        End Get
        Set(value As String)
            _nomEmpleado = value
        End Set
    End Property
End Class

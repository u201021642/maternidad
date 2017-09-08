Public Class Bioquimica
    Private _id As Integer
    Private _numExamen As Integer
    Private _fechaMuestra As Date
    Private _gaPorCrl As String
    Private _pesoMadre As Integer
    Private _paridad As String
    Private _fechaMuestraIU As Date
    Private _gaPorCrlIU As String
    Private _pigf As String
    Private _idGrupoEtnico As Integer
    Private _idFumador As Integer
    Private _idConcepcion As Integer
    Private _idOvulacion As Integer
    Private _idKitManufacturador As Integer

    Public Property Id As Integer
        Get
            Return _id
        End Get
        Set(value As Integer)
            _id = value
        End Set
    End Property

    Public Property NumExamen As Integer
        Get
            Return _numExamen
        End Get
        Set(value As Integer)
            _numExamen = value
        End Set
    End Property

    Public Property FechaMuestra As Date
        Get
            Return _fechaMuestra
        End Get
        Set(value As Date)
            _fechaMuestra = value
        End Set
    End Property

    Public Property GaPorCrl As String
        Get
            Return _gaPorCrl
        End Get
        Set(value As String)
            _gaPorCrl = value
        End Set
    End Property

    Public Property PesoMadre As Integer
        Get
            Return _pesoMadre
        End Get
        Set(value As Integer)
            _pesoMadre = value
        End Set
    End Property

    Public Property Paridad As String
        Get
            Return _paridad
        End Get
        Set(value As String)
            _paridad = value
        End Set
    End Property

    Public Property FechaMuestraIU As Date
        Get
            Return _fechaMuestraIU
        End Get
        Set(value As Date)
            _fechaMuestraIU = value
        End Set
    End Property

    Public Property GaPorCrlIU As String
        Get
            Return _gaPorCrlIU
        End Get
        Set(value As String)
            _gaPorCrlIU = value
        End Set
    End Property

    Public Property Pigf As String
        Get
            Return _pigf
        End Get
        Set(value As String)
            _pigf = value
        End Set
    End Property

    Public Property IdGrupoEtnico As Integer
        Get
            Return _idGrupoEtnico
        End Get
        Set(value As Integer)
            _idGrupoEtnico = value
        End Set
    End Property

    Public Property IdFumador As Integer
        Get
            Return _idFumador
        End Get
        Set(value As Integer)
            _idFumador = value
        End Set
    End Property

    Public Property IdConcepcion As Integer
        Get
            Return _idConcepcion
        End Get
        Set(value As Integer)
            _idConcepcion = value
        End Set
    End Property

    Public Property IdOvulacion As Integer
        Get
            Return _idOvulacion
        End Get
        Set(value As Integer)
            _idOvulacion = value
        End Set
    End Property

    Public Property IdKitManufacturador As Integer
        Get
            Return _idKitManufacturador
        End Get
        Set(value As Integer)
            _idKitManufacturador = value
        End Set
    End Property
End Class

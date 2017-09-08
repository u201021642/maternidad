Public Class Doppler
    Private _id As Integer
    Private _pesoMadre As Integer
    Private _estaturaMadre As Integer
    Private _imc As String
    Private _paridad As String
    Private _idCatalogo As Integer
    Private _auPizquierdo As String
    Private _auPderecho As String
    Private _auPbajo As String
    Private _biMedidas As String
    Private _biSistole As String
    Private _biDiastole As String
    Private _bdMedidas As String
    Private _bdSistole As String
    Private _bdDiastole As String
    Private _map As String
    Private _idGrupoEtnico As Integer
    Private _idFumador As Integer
    Private _idOvulacion As Integer
    Private _idHipertension As Integer
    Private _idPetEmbarazo As Integer
    Private _idPetMadre As Integer

    Public Property Id As Integer
        Get
            Return _id
        End Get
        Set(value As Integer)
            _id = value
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

    Public Property EstaturaMadre As Integer
        Get
            Return _estaturaMadre
        End Get
        Set(value As Integer)
            _estaturaMadre = value
        End Set
    End Property

    Public Property Imc As String
        Get
            Return _imc
        End Get
        Set(value As String)
            _imc = value
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

    Public Property IdCatalogo As Integer
        Get
            Return _idCatalogo
        End Get
        Set(value As Integer)
            _idCatalogo = value
        End Set
    End Property

    Public Property AuPizquierdo As String
        Get
            Return _auPizquierdo
        End Get
        Set(value As String)
            _auPizquierdo = value
        End Set
    End Property

    Public Property AuPderecho As String
        Get
            Return _auPderecho
        End Get
        Set(value As String)
            _auPderecho = value
        End Set
    End Property

    Public Property AuPbajo As String
        Get
            Return _auPbajo
        End Get
        Set(value As String)
            _auPbajo = value
        End Set
    End Property

    Public Property BiMedidas As String
        Get
            Return _biMedidas
        End Get
        Set(value As String)
            _biMedidas = value
        End Set
    End Property

    Public Property Map As String
        Get
            Return _map
        End Get
        Set(value As String)
            _map = value
        End Set
    End Property

    Public Property BiSistole As String
        Get
            Return _biSistole
        End Get
        Set(value As String)
            _biSistole = value
        End Set
    End Property

    Public Property BiDiastole As String
        Get
            Return _biDiastole
        End Get
        Set(value As String)
            _biDiastole = value
        End Set
    End Property

    Public Property BdMedidas As String
        Get
            Return _bdMedidas
        End Get
        Set(value As String)
            _bdMedidas = value
        End Set
    End Property

    Public Property BdSistole As String
        Get
            Return _bdSistole
        End Get
        Set(value As String)
            _bdSistole = value
        End Set
    End Property

    Public Property BdDiastole As String
        Get
            Return _bdDiastole
        End Get
        Set(value As String)
            _bdDiastole = value
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

    Public Property IdOvulacion As Integer
        Get
            Return _idOvulacion
        End Get
        Set(value As Integer)
            _idOvulacion = value
        End Set
    End Property

    Public Property IdHipertension As Integer
        Get
            Return _idHipertension
        End Get
        Set(value As Integer)
            _idHipertension = value
        End Set
    End Property

    Public Property IdPetEmbarazo As Integer
        Get
            Return _idPetEmbarazo
        End Get
        Set(value As Integer)
            _idPetEmbarazo = value
        End Set
    End Property

    Public Property IdPetMadre As Integer
        Get
            Return _idPetMadre
        End Get
        Set(value As Integer)
            _idPetMadre = value
        End Set
    End Property
End Class

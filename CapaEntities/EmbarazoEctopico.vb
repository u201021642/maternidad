Public Class EmbarazoEctopico
    Private _idEmbarazoEctopico As Integer
    Private _idCasoPaciente As Integer
    Private _fechaUltimoPeriodo As Date
    Private _tamanoAncho As Decimal
    Private _tamanoLargo As Decimal
    Private _tamanoAlto As Decimal
    Private _diametroMaximo As Decimal
    Private _volumen As Double
    Private _espesorEndometrial As Decimal
    Private _hCG_PRGT As String
    Private _beta_hCG As String
    Private _PRGT As String
    Private _fechaMuestra As Date
    Private _beta_hCG_48h As String
    Private _PRGT_48h As String
    Private _Comentarios As String
    Private _EmbarazoEctopico As Integer
    Private _EmbarazoIntrauterino As Integer
    Private _idTestEmbarazoOrina As Integer
    Private _idLocalizacion As Integer
    Private _idMorfologia As Integer
    Private _idSangradoVaginal As Integer
    Private _idDolor As Integer
    Private _idEstructura As Integer
    Private _idAccionTomar As Integer
    Private _idImpresionSubjetiva As Integer
    Private _idGradoCerteza As Integer

    Private _desTestEmbarazoOrina As String
    Private _desLocalizacion As String
    Private _desMorfologia As String
    Private _desSangradoVaginal As String
    Private _desDolor As String
    Private _desEstructura As String
    Private _desAccionTomar As String
    Private _desImpresionSubjetiva As String
    Private _desGradoCerteza As String
    Private _muestraSangre As String

    Public Property IdEmbarazoEctopico As Integer
        Get
            Return _idEmbarazoEctopico
        End Get
        Set(value As Integer)
            _idEmbarazoEctopico = value
        End Set
    End Property
    Public Property IdCasoPaciente As Integer
        Get
            Return _idCasoPaciente
        End Get
        Set(value As Integer)
            _idCasoPaciente = value
        End Set
    End Property
    Public Property FechaUltimoPeriodo As Date
        Get
            Return _fechaUltimoPeriodo
        End Get
        Set(value As Date)
            _fechaUltimoPeriodo = value
        End Set
    End Property
    Public Property TamanoAncho As Decimal
        Get
            Return _tamanoAncho
        End Get
        Set(value As Decimal)
            _tamanoAncho = value
        End Set
    End Property
    Public Property TamanoLargo As Decimal
        Get
            Return _tamanoLargo
        End Get
        Set(value As Decimal)
            _tamanoLargo = value
        End Set
    End Property
    Public Property TamanoAlto As Decimal
        Get
            Return _tamanoAlto
        End Get
        Set(value As Decimal)
            _tamanoAlto = value
        End Set
    End Property
    Public Property DiametroMaximo As Decimal
        Get
            Return _diametroMaximo
        End Get
        Set(value As Decimal)
            _diametroMaximo = value
        End Set
    End Property
    Public Property Volumen As Decimal
        Get
            Return _volumen
        End Get
        Set(value As Decimal)
            _volumen = value
        End Set
    End Property
    Public Property EspesorEndometrial As Decimal
        Get
            Return _espesorEndometrial
        End Get
        Set(value As Decimal)
            _espesorEndometrial = value
        End Set
    End Property
    Public Property HCG_PRGT As String
        Get
            Return _hCG_PRGT
        End Get
        Set(value As String)
            _hCG_PRGT = value
        End Set
    End Property
    Public Property Beta_hCG As String
        Get
            Return _beta_hCG
        End Get
        Set(value As String)
            _beta_hCG = value
        End Set
    End Property
    Public Property PRGT As String
        Get
            Return _PRGT
        End Get
        Set(value As String)
            _PRGT = value
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
    Public Property Beta_hCG_48h As String
        Get
            Return _beta_hCG_48h
        End Get
        Set(value As String)
            _beta_hCG_48h = value
        End Set
    End Property
    Public Property PRGT_48h As String
        Get
            Return _PRGT_48h
        End Get
        Set(value As String)
            _PRGT_48h = value
        End Set
    End Property
    Public Property Comentarios As String
        Get
            Return _Comentarios
        End Get
        Set(value As String)
            _Comentarios = value
        End Set
    End Property
    Public Property EmbarazoEctopico As Integer
        Get
            Return _EmbarazoEctopico
        End Get
        Set(value As Integer)
            _EmbarazoEctopico = value
        End Set
    End Property
    Public Property EmbarazoIntrauterino As Integer
        Get
            Return _EmbarazoIntrauterino
        End Get
        Set(value As Integer)
            _EmbarazoIntrauterino = value
        End Set
    End Property
    Public Property IdTestEmbarazoOrina As Integer
        Get
            Return _idTestEmbarazoOrina
        End Get
        Set(value As Integer)
            _idTestEmbarazoOrina = value
        End Set
    End Property
    Public Property IdLocalizacion As Integer
        Get
            Return _idLocalizacion
        End Get
        Set(value As Integer)
            _idLocalizacion = value
        End Set
    End Property
    Public Property IdMorfologia As Integer
        Get
            Return _idMorfologia
        End Get
        Set(value As Integer)
            _idMorfologia = value
        End Set
    End Property
    Public Property IdSangradoVaginal As Integer
        Get
            Return _idSangradoVaginal
        End Get
        Set(value As Integer)
            _idSangradoVaginal = value
        End Set
    End Property
    Public Property IdDolor As Integer
        Get
            Return _idDolor
        End Get
        Set(value As Integer)
            _idDolor = value
        End Set
    End Property
    Public Property IdEstructura As Integer
        Get
            Return _idEstructura
        End Get
        Set(value As Integer)
            _idEstructura = value
        End Set
    End Property
    Public Property IdAccionTomar As Integer
        Get
            Return _idAccionTomar
        End Get
        Set(value As Integer)
            _idAccionTomar = value
        End Set
    End Property
    Public Property IdImpresionSubjetiva As Integer
        Get
            Return _idImpresionSubjetiva
        End Get
        Set(value As Integer)
            _idImpresionSubjetiva = value
        End Set
    End Property
    Public Property IdGradoCerteza As Integer
        Get
            Return _idGradoCerteza
        End Get
        Set(value As Integer)
            _idGradoCerteza = value
        End Set
    End Property

    Public Property DesTestEmbarazoOrina As String
        Get
            Return _desTestEmbarazoOrina
        End Get
        Set(value As String)
            _desTestEmbarazoOrina = value
        End Set
    End Property

    Public Property DesLocalizacion As String
        Get
            Return _desLocalizacion
        End Get
        Set(value As String)
            _desLocalizacion = value
        End Set
    End Property

    Public Property DesMorfologia As String
        Get
            Return _desMorfologia
        End Get
        Set(value As String)
            _desMorfologia = value
        End Set
    End Property

    Public Property DesSangradoVaginal As String
        Get
            Return _desSangradoVaginal
        End Get
        Set(value As String)
            _desSangradoVaginal = value
        End Set
    End Property

    Public Property DesDolor As String
        Get
            Return _desDolor
        End Get
        Set(value As String)
            _desDolor = value
        End Set
    End Property

    Public Property DesEstructura As String
        Get
            Return _desEstructura
        End Get
        Set(value As String)
            _desEstructura = value
        End Set
    End Property

    Public Property DesAccionTomar As String
        Get
            Return _desAccionTomar
        End Get
        Set(value As String)
            _desAccionTomar = value
        End Set
    End Property

    Public Property DesImpresionSubjetiva As String
        Get
            Return _desImpresionSubjetiva
        End Get
        Set(value As String)
            _desImpresionSubjetiva = value
        End Set
    End Property

    Public Property DesGradoCerteza As String
        Get
            Return _desGradoCerteza
        End Get
        Set(value As String)
            _desGradoCerteza = value
        End Set
    End Property

    Public Property MuestraSangre As String
        Get
            Return _muestraSangre
        End Get
        Set(value As String)
            _muestraSangre = value
        End Set
    End Property
End Class

Imports System.Net
Imports System.Web.Http
Imports CapaEntities
Imports CapaLogic
Imports Newtonsoft.Json

Public Class EvaluarRiesgoFetalController
    Inherits ApiController
    Dim usuario As CapaEntities.Usuario
    Dim catalogoLogic As CapaLogic.CatalogoLogic

    ' GET api/<controller>
    'Public Function GetValues() As IEnumerable(Of String)
    'Dim dictionary As New Dictionary(Of String, Object)
    'Dim operadores As New List(Of Operador)

    'Dim operador As New Operador()
    'operador.Id = 1
    'operador.Nombre = "Dr. David Camponico"
    'operadores.Add(operador)
    'Return JsonConvert.SerializeObject(operadores)
    'Return New String() {"value1", "value2"}
    'End Function
    Public Function GetValues() As IHttpActionResult
        Dim dictionary As New Dictionary(Of String, Object)
        Dim operadores As New List(Of Operador)
        Dim concepciones As New List(Of Catalogo)
        Dim ovulaciones As New List(Of Catalogo)


        Dim operador As New Operador()
        operador.Id = 1
        operador.Nombre = "Dr. David Camponico"
        operadores.Add(operador)

        operador = New Operador()
        operador.Id = 2
        operador.Nombre = "Dr. David Camponico Jr."
        operadores.Add(operador)

        catalogoLogic = New CapaLogic.CatalogoLogic
        concepciones = catalogoLogic.getCatalagoByCodigo("Concepcion")
        ovulaciones = catalogoLogic.getCatalagoByCodigo("OvulacionInducida")



        dictionary.Add("operadores", operadores)
        dictionary.Add("concepciones", concepciones)
        dictionary.Add("ovulaciones", ovulaciones)

        Return Ok((dictionary))
    End Function
    ' GET api/<controller>/5
    Public Function GetValue(ByVal id As Integer) As String
        Return "value"
    End Function

    ' POST api/<controller>
    Public Function PostValue(<FromBody()> ByVal value As EvaluacionRiesgoFetal) As IHttpActionResult
        Dim dictionary As New Dictionary(Of String, Object)
        Dim id = EvaluacionRiesgoFetalLogic.insertEvaluacionRiesgoFetal(value)
        dictionary.Add("id", id)
        Return Ok((dictionary))
    End Function

    ' PUT api/<controller>/5
    Public Sub PutValue(ByVal id As Integer, <FromBody()> ByVal value As String)

    End Sub

    ' DELETE api/<controller>/5
    Public Sub DeleteValue(ByVal id As Integer)

    End Sub
End Class

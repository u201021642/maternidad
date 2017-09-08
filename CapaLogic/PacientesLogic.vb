Imports CapaDAO.Conexion
Imports CapaEntities
Public Class PacientesLogic
    Dim cnx As CapaDAO.Conexion
    Public Function getPacientes(ByVal id As String, ByVal nombre As String) As DataTable
        cnx = New CapaDAO.Conexion
        Return cnx.getPacientes(id, nombre)
    End Function
    Public Function getUltimoCaso(ByVal idPaciente As Integer) As CapaEntities.Caso
        cnx = New CapaDAO.Conexion
        Return cnx.getUltimoCaso(idPaciente)
    End Function
    Public Sub insertarCaso(ByVal usuario As CapaEntities.Usuario, ByVal paciente As CapaEntities.Paciente)
        cnx = New CapaDAO.Conexion
        cnx.insertarCaso(usuario, paciente)
    End Sub
    Public Sub insertBioquimica(ByVal bioquimica As Bioquimica)
        cnx = New CapaDAO.Conexion
        cnx.insertBioquimica(bioquimica)
    End Sub
    Public Function getBioquimica(ByVal id As Integer) As Bioquimica
        cnx = New CapaDAO.Conexion
        Return cnx.getBioquimica(id)
    End Function
    Public Sub updateBioquimica(ByVal bioquimica As Bioquimica)
        cnx = New CapaDAO.Conexion
        cnx.updateBioquimica(bioquimica)
    End Sub
    Public Function getBioquimicaExamen(ByVal numExamen As Integer) As Bioquimica
        cnx = New CapaDAO.Conexion
        Return cnx.getBioquimicaExamen(numExamen)
    End Function
    Public Sub insertDoppler(ByVal doppler As Doppler)
        cnx = New CapaDAO.Conexion
        cnx.insertDoppler(doppler)
    End Sub
    Public Function insertControlFetal(ByVal controlFetal As ControlFetal) As Integer
        cnx = New CapaDAO.Conexion
        Return cnx.insertControlFetal(controlFetal)
    End Function
    Public Function getControlFetal(ByVal idControlFetal As Integer) As DataTable
        cnx = New CapaDAO.Conexion
        Return cnx.getControlFetal(idControlFetal)
    End Function
End Class

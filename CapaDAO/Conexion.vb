Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports CapaEntities.Caso
Imports CapaEntities

Public Class Conexion
    Public Sub New()
        ConfigurationManager.RefreshSection("configuration/connectionStrings")
        'Properties.Settings.Default.Reload()
    End Sub

    Public Function getPacientes(ByVal id As String, ByVal nombre As String) As DataTable
        Dim cn As New SqlConnection
        Dim Cmd As New SqlCommand
        Dim Da As New SqlDataAdapter
        Dim Dv As New DataView
        Dim Ds As New DataSet
        Dim Dt As New DataTable
        Dim result As New DataTable

        If (cn.State = ConnectionState.Open) Then
            cn.Close()
        End If
        cn.ConnectionString = My.Settings.cadena
        cn.Open()
        Dt.Clear()
        Dim query As String
        query = "SELECT * FROM [BD_CLINICA_RP].[dbo].[BuscarPacientes] WHERE 1=1 "
        If id <> "" Then
            query = query + " AND id = " & id
        End If
        If nombre <> "" Then
            query = query + " AND Nombres + Apellidos LIKE '%" & nombre & "%'"
        End If
        Cmd.CommandText = query
        Cmd.Connection = cn
        Da.SelectCommand = Cmd
        Da.Fill(Dt)
        result = Dt
        cn.Close()
        Return result
    End Function
    Public Function validarAcceso(ByVal email As String, ByVal password As String) As DataTable
        Dim cn As New SqlConnection
        Dim Cmd As New SqlCommand
        Dim Da As New SqlDataAdapter
        Dim Dv As New DataView
        Dim Ds As New DataSet
        Dim Dt As New DataTable
        Dim result As New DataTable

        If (cn.State = ConnectionState.Open) Then
            cn.Close()
        End If
        cn.ConnectionString = My.Settings.cadena
        cn.Open()
        Dt.Clear()
        Dim query As String
        query = "SELECT U.idUsuario, U.nombreUsuario, U.email, E.idEmpleado, E.nroDni, E.nomEmpleado, E.dscProfesion, E.idEspecialidad FROM [BD_CLINICA_RP].[dbo].[T_USUARIO] U "
        query = query & " LEFT JOIN [BD_CLINICA_RP].[dbo].[T_EMPLEADO] E ON U.idEmpleado = E.idEmpleado  WHERE U.email = '" & email & "' AND U.contrasena = '" & password & "'"

        Cmd.CommandText = query
        Cmd.Connection = cn
        Da.SelectCommand = Cmd
        Da.Fill(Dt)
        result = Dt
        cn.Close()
        Return result
    End Function

    Public Function getUltimoCaso(ByVal idPaciente As Integer) As CapaEntities.Caso
        Dim cn As New SqlConnection
        Dim Cmd As New SqlCommand
        Dim Da As New SqlDataAdapter
        Dim Dv As New DataView
        Dim Ds As New DataSet
        Dim Dt As New DataTable
        Dim result As New DataTable

        If (cn.State = ConnectionState.Open) Then
            cn.Close()
        End If
        cn.ConnectionString = My.Settings.cadena
        cn.Open()
        Dt.Clear()
        Dim query As String
        query = "SELECT TOP 1 [idCasoPaciente],[numeroCaso],[fechaCaso],CONVERT(varchar, [fechaCaso], 103) AS fecha,CONVERT(VARCHAR(8),[fechaCaso],108) AS hora "
        query = query & " FROM [BD_CLINICA_RP].[dbo].[T_CASO_PACIENTE] WHERE [idPaciente] = " & idPaciente & "  ORDER BY [fechaCaso] DESC  "

        Cmd.CommandText = query
        Cmd.Connection = cn
        Da.SelectCommand = Cmd
        Da.Fill(Dt)
        result = Dt
        cn.Close()

        Dim caso As New CapaEntities.Caso
        If result.Rows.Count > 0 Then
            For Each row As DataRow In result.Rows
                caso.Id = CStr(row("idCasoPaciente"))
                caso.Numero = CStr(row("numeroCaso"))
                caso.Fecha = CStr(row("fecha"))
                caso.Hora = CStr(row("hora"))
            Next
        Else
            caso = Nothing
        End If


        Return caso
    End Function
    Public Sub insertarCaso(ByVal usuario As CapaEntities.Usuario, ByVal paciente As CapaEntities.Paciente)
        Dim cn As New SqlConnection
        Dim Cmd As New SqlCommand
        Dim Da As New SqlDataAdapter
        Dim Dv As New DataView
        Dim Ds As New DataSet
        If (cn.State = ConnectionState.Open) Then
            cn.Close()
        End If
        cn.ConnectionString = My.Settings.cadena
        cn.Open()
        Cmd.CommandText = "INSERT INTO T_CASO_PACIENTE (idPaciente,idEspecialidad,idEmpleado,fechaCaso ) VALUES (" & paciente.Id & "," & usuario.empleado.IdEspecialidad & "," & usuario.empleado.Id & ",GETDATE())"
        Cmd.Connection = cn
        Cmd.ExecuteNonQuery()
        cn.Close()
    End Sub
    Public Function getCombos(ByVal codigo As String) As DataTable
        Dim cn As New SqlConnection
        Dim Cmd As New SqlCommand
        Dim Da As New SqlDataAdapter
        Dim Dv As New DataView
        Dim Ds As New DataSet
        Dim Dt As New DataTable
        Dim result As New DataTable

        If (cn.State = ConnectionState.Open) Then
            cn.Close()
        End If
        cn.ConnectionString = My.Settings.cadena
        cn.Open()
        Dt.Clear()
        Dim query As String
        query = "SELECT [idCatalogo],[descripcionCatalogo] FROM [BD_CLINICA_RP].[dbo].[T_CATALOGO] WHERE [codCatalogo] = '" & codigo & "' "
        Cmd.CommandText = query
        Cmd.Connection = cn
        Da.SelectCommand = Cmd
        Da.Fill(Dt)
        result = Dt
        cn.Close()
        Return result
    End Function
    Public Function getCatalagoByCodigo(ByVal codigo As String) As DataTable
        Dim Da As New SqlDataAdapter
        Dim queryString = "SELECT * FROM t_Catalogo where codCatalogo = @codigo"

        Using cn As New SqlConnection(My.Settings.cadena)
            Using cmd As New SqlCommand(queryString, cn)
                Try
                    cmd.CommandType = CommandType.Text
                    cn.Open()
                    cmd.Parameters.AddWithValue("@codigo", codigo)
                    Da.SelectCommand = cmd
                    Using dt As New DataTable
                        Da.Fill(dt)
                        Return dt
                    End Using
                Catch ex As Exception
                    Throw New Exception(ex.Message)
                End Try
            End Using
        End Using

    End Function

    Public Function insertEvaluacionRiesgoFetal(ByVal objEvaluacion As EvaluacionRiesgoFetal) As Integer
        Dim queryString = "INSERT INTO [dbo].[T_EVALUACION_RIESGO_FETAL] 
                           ([idFMF]
                           ,[idCatalogo]
                           ,[edadMadre]
                           ,[riesgoFondo_T21]
                           ,[riesgoFondo_T18]
                           ,[riesgoFondo_T13]
                           ,[riesgoAjustado_T21]
                           ,[riesgoAjustado_T18]
                           ,[riesgoAjustado_T13]
                           ,[riesgoPreEclampsia]
                           ,[riesgoDesorHipert]
                           ,[muerteFetal]
                           ,[conclusiones])
                     VALUES
                           ((select TOP 1 idFMF FROM [BD_CLINICA_RP].[dbo].[T_FMF] WHERE idEmpleado = @idFMF ORDER BY codFMF DESC)
                           ,@idCatalogo
                           ,@edadMadre
                           ,@riesgoFondo_T21
                           ,@riesgoFondo_T18
                           ,@riesgoFondo_T13
                           ,@riesgoAjustado_T21
                           ,@riesgoAjustado_T18
                           ,@riesgoAjustado_T13
                           ,@riesgoPreEclampsia
                           ,@riesgoDesorHipert
                           ,@muerteFetal
                           ,@conclusiones);SELECT CAST(scope_identity() AS int)"

        Try
            Using cn As New SqlConnection(My.Settings.cadena)
                Using cmd As New SqlCommand(queryString, cn)
                    cmd.CommandType = CommandType.Text
                    cn.Open()

                    '.Parameters.AddWithValue("@idRiesgoFetal", objEvaluacion.IdRiesgoFetal)
                    cmd.Parameters.AddWithValue("@idFMF", objEvaluacion.IdFMF)
                    cmd.Parameters.AddWithValue("@idCatalogo", objEvaluacion.IdCatalogo)
                    cmd.Parameters.AddWithValue("@edadMadre", objEvaluacion.EdadMadre)
                    cmd.Parameters.AddWithValue("@riesgoFondo_T21", objEvaluacion.RiesgoAjustado_t21)
                    cmd.Parameters.AddWithValue("@riesgoFondo_T18", objEvaluacion.RiesgoAjustado_t18)
                    cmd.Parameters.AddWithValue("@riesgoFondo_T13", objEvaluacion.RiesgoAjustado_t13)
                    cmd.Parameters.AddWithValue("@riesgoAjustado_T21", objEvaluacion.RiesgoAjustado_t21)
                    cmd.Parameters.AddWithValue("@riesgoAjustado_T18", objEvaluacion.RiesgoAjustado_t18)
                    cmd.Parameters.AddWithValue("@riesgoAjustado_T13", objEvaluacion.RiesgoAjustado_t13)
                    cmd.Parameters.AddWithValue("@riesgoPreEclampsia", objEvaluacion.RiesgoPreEclampsia)
                    cmd.Parameters.AddWithValue("@riesgoDesorHipert", objEvaluacion.RiesgoDesorHipert)
                    cmd.Parameters.AddWithValue("@muerteFetal", objEvaluacion.MuerteFetal)
                    cmd.Parameters.AddWithValue("@conclusiones", objEvaluacion.Conclusiones)

                    Dim id = cmd.ExecuteScalar()
                    Return id
                End Using
            End Using
        Catch ex As Exception
            Throw New Exception(ex.Message)
        End Try
    End Function

    Public Sub insertBioquimica(ByVal bioquimica As Bioquimica)
        Dim queryString = "INSERT INTO [dbo].[T_EC_BIOQUIMICA]
                               ([numeroExamen]
                               ,[fechaMuestra]
                               ,[GAporCRL]
                               ,[pesoMadre]
                               ,[paridad]
                               ,[fechaMuestra_IU]
                               ,[GAporCRL_IU]
                               ,[PIGF]
                               ,[idGrupoEtnico]
                               ,[idFumador]
                               ,[idConcepcion]
                               ,[idOvulacion]
                               ,[idKitManufacturador])
                         VALUES
                               (@numeroExamen
                               ,@fechaMuestra
                               ,@GAporCRL
                               ,@pesoMadre
                               ,@paridad
                               ,@fechaMuestra_IU
                               ,@GAporCRL_IU
                               ,@PIGF
                               ,@idGrupoEtnico
                               ,@idFumador
                               ,@idConcepcion
                               ,@idOvulacion
                               ,@idKitManufacturador)"

        Try
            Using cn As New SqlConnection(My.Settings.cadena)
                Using cmd As New SqlCommand(queryString, cn)
                    cmd.CommandType = CommandType.Text
                    cn.Open()

                    cmd.Parameters.AddWithValue("@numeroExamen", bioquimica.NumExamen)
                    cmd.Parameters.AddWithValue("@fechaMuestra", bioquimica.FechaMuestra)
                    cmd.Parameters.AddWithValue("@GAporCRL", bioquimica.GaPorCrl)
                    cmd.Parameters.AddWithValue("@pesoMadre", bioquimica.PesoMadre)
                    cmd.Parameters.AddWithValue("@paridad", bioquimica.Paridad)
                    cmd.Parameters.AddWithValue("@fechaMuestra_IU", bioquimica.FechaMuestraIU)
                    cmd.Parameters.AddWithValue("@GAporCRL_IU", bioquimica.GaPorCrlIU)
                    cmd.Parameters.AddWithValue("@PIGF", bioquimica.Pigf)
                    cmd.Parameters.AddWithValue("@idGrupoEtnico", bioquimica.IdGrupoEtnico)
                    cmd.Parameters.AddWithValue("@idFumador", bioquimica.IdFumador)
                    cmd.Parameters.AddWithValue("@idConcepcion", bioquimica.IdConcepcion)
                    cmd.Parameters.AddWithValue("@idOvulacion", bioquimica.IdConcepcion)
                    cmd.Parameters.AddWithValue("@idKitManufacturador", bioquimica.IdKitManufacturador)

                    cmd.ExecuteNonQuery()
                End Using
            End Using
        Catch ex As Exception
            Throw New Exception(ex.Message)
        End Try

    End Sub
    Public Function getBioquimica(ByVal id As Integer) As Bioquimica
        Dim cn As New SqlConnection
        Dim Cmd As New SqlCommand
        Dim Da As New SqlDataAdapter
        Dim Dv As New DataView
        Dim Ds As New DataSet
        Dim Dt As New DataTable
        Dim result As New DataTable

        If (cn.State = ConnectionState.Open) Then
            cn.Close()
        End If
        cn.ConnectionString = My.Settings.cadena
        cn.Open()
        Dt.Clear()
        Dim query As String
        query = "SELECT TOP 1 [idBioquimica]
                    ,[numeroExamen]
                    ,CONVERT(varchar, [fechaMuestra], 103) AS [fechaMuestra]
                    ,[GAporCRL]
                    ,[pesoMadre]
                    ,[paridad]
                    ,CONVERT(varchar, [fechaMuestra_IU], 103) AS [fechaMuestra_IU]
                    ,[GAporCRL_IU]
                    ,[PIGF]
                    ,[idGrupoEtnico]
                    ,[idFumador]
                    ,[idConcepcion]
                    ,[idOvulacion]
                    ,[idKitManufacturador]
                FROM [BD_CLINICA_RP].[dbo].[T_EC_BIOQUIMICA]
                WHERE [idBioquimica] = " & id
        Cmd.CommandText = query
        Cmd.Connection = cn
        Da.SelectCommand = Cmd
        Da.Fill(Dt)
        result = Dt
        cn.Close()

        Dim bioquimica As New Bioquimica
        If result.Rows.Count > 0 Then
            For Each row As DataRow In result.Rows
                bioquimica.Id = CInt(row("idBioquimica"))
                bioquimica.NumExamen = CInt(row("numeroExamen"))
                bioquimica.FechaMuestra = CDate(row("fechaMuestra"))
                bioquimica.GaPorCrl = CStr(row("GAporCRL"))
                bioquimica.PesoMadre = CInt(row("pesoMadre"))
                bioquimica.Paridad = CStr(row("paridad"))
                bioquimica.FechaMuestraIU = CDate(row("fechaMuestra_IU"))
                bioquimica.GaPorCrlIU = CInt(row("GAporCRL_IU"))
                bioquimica.Pigf = CStr(row("PIGF"))
                bioquimica.IdGrupoEtnico = CStr(row("idGrupoEtnico"))
                bioquimica.IdFumador = CStr(row("idFumador"))
                bioquimica.IdConcepcion = CStr(row("idConcepcion"))
                bioquimica.IdOvulacion = CStr(row("idOvulacion"))
                bioquimica.IdKitManufacturador = CStr(row("idKitManufacturador"))
            Next
        Else
            bioquimica = Nothing
        End If

        Return bioquimica
    End Function
    Public Sub updateBioquimica(ByVal bioquimica As Bioquimica)
        Dim queryString = "UPDATE [dbo].[T_EC_BIOQUIMICA]
                           SET [numeroExamen] = @numeroExamen
                               ,[fechaMuestra] = @fechaMuestra
                               ,[GAporCRL] = @GAporCRL
                               ,[pesoMadre] = @pesoMadre
                               ,[paridad] = @paridad
                               ,[fechaMuestra_IU] = @fechaMuestra_IU
                               ,[GAporCRL_IU] = @GAporCRL_IU
                               ,[PIGF] = @PIGF
                               ,[idGrupoEtnico] = @idGrupoEtnico
                               ,[idFumador] = @idFumador
                               ,[idConcepcion] = @idConcepcion
                               ,[idOvulacion] = @idOvulacion
                               ,[idKitManufacturador] = @idKitManufacturador
                         WHERE [idBioquimica] = " & bioquimica.Id

        Try
            Using cn As New SqlConnection(My.Settings.cadena)
                Using cmd As New SqlCommand(queryString, cn)
                    cmd.CommandType = CommandType.Text
                    cn.Open()

                    cmd.Parameters.AddWithValue("@numeroExamen", bioquimica.NumExamen)
                    cmd.Parameters.AddWithValue("@fechaMuestra", bioquimica.FechaMuestra)
                    cmd.Parameters.AddWithValue("@GAporCRL", bioquimica.GaPorCrl)
                    cmd.Parameters.AddWithValue("@pesoMadre", bioquimica.PesoMadre)
                    cmd.Parameters.AddWithValue("@paridad", bioquimica.Paridad)
                    cmd.Parameters.AddWithValue("@fechaMuestra_IU", bioquimica.FechaMuestraIU)
                    cmd.Parameters.AddWithValue("@GAporCRL_IU", bioquimica.GaPorCrlIU)
                    cmd.Parameters.AddWithValue("@PIGF", bioquimica.Pigf)
                    cmd.Parameters.AddWithValue("@idGrupoEtnico", bioquimica.IdGrupoEtnico)
                    cmd.Parameters.AddWithValue("@idFumador", bioquimica.IdFumador)
                    cmd.Parameters.AddWithValue("@idConcepcion", bioquimica.IdConcepcion)
                    cmd.Parameters.AddWithValue("@idOvulacion", bioquimica.IdConcepcion)
                    cmd.Parameters.AddWithValue("@idKitManufacturador", bioquimica.IdKitManufacturador)

                    cmd.ExecuteNonQuery()
                End Using
            End Using
        Catch ex As Exception
            Throw New Exception(ex.Message)
        End Try
    End Sub
    Public Function getBioquimicaExamen(ByVal numExamen As Integer) As Bioquimica
        Dim cn As New SqlConnection
        Dim Cmd As New SqlCommand
        Dim Da As New SqlDataAdapter
        Dim Dv As New DataView
        Dim Ds As New DataSet
        Dim Dt As New DataTable
        Dim result As New DataTable

        If (cn.State = ConnectionState.Open) Then
            cn.Close()
        End If
        cn.ConnectionString = My.Settings.cadena
        cn.Open()
        Dt.Clear()
        Dim query As String
        query = "SELECT TOP 1 [idBioquimica]
                    ,[numeroExamen]
                    ,CONVERT(varchar, [fechaMuestra], 103) AS [fechaMuestra]
                    ,[GAporCRL]
                    ,[pesoMadre]
                    ,[paridad]
                    ,CONVERT(varchar, [fechaMuestra_IU], 103) AS [fechaMuestra_IU]
                    ,[GAporCRL_IU]
                    ,[PIGF]
                    ,[idGrupoEtnico]
                    ,[idFumador]
                    ,[idConcepcion]
                    ,[idOvulacion]
                    ,[idKitManufacturador]
                FROM [BD_CLINICA_RP].[dbo].[T_EC_BIOQUIMICA]
                WHERE [numeroExamen] = " & numExamen
        Cmd.CommandText = query
        Cmd.Connection = cn
        Da.SelectCommand = Cmd
        Da.Fill(Dt)
        result = Dt
        cn.Close()

        Dim bioquimica As New Bioquimica
        If result.Rows.Count > 0 Then
            For Each row As DataRow In result.Rows
                bioquimica.Id = CInt(row("idBioquimica"))
                bioquimica.NumExamen = CInt(row("numeroExamen"))
                bioquimica.FechaMuestra = CDate(row("fechaMuestra"))
                bioquimica.GaPorCrl = CStr(row("GAporCRL"))
                bioquimica.PesoMadre = CInt(row("pesoMadre"))
                bioquimica.Paridad = CStr(row("paridad"))
                bioquimica.FechaMuestraIU = CDate(row("fechaMuestra_IU"))
                bioquimica.GaPorCrlIU = CInt(row("GAporCRL_IU"))
                bioquimica.Pigf = CStr(row("PIGF"))
                bioquimica.IdGrupoEtnico = CStr(row("idGrupoEtnico"))
                bioquimica.IdFumador = CStr(row("idFumador"))
                bioquimica.IdConcepcion = CStr(row("idConcepcion"))
                bioquimica.IdOvulacion = CStr(row("idOvulacion"))
                bioquimica.IdKitManufacturador = CStr(row("idKitManufacturador"))
            Next
        Else
            bioquimica = Nothing
        End If

        Return bioquimica
    End Function
    Public Sub insertDoppler(ByVal doppler As Doppler)
        Dim queryString = "INSERT INTO [dbo].[T_EC_DOPPLER_UTERINO]
                               ([pesoMadre]
                               ,[estaturaMadre]
                               ,[IMC]
                               ,[paridad]
                               ,[au_Pizquierdo]
                               ,[au_Pderecho]
                               ,[au_Pbajo]
                               ,[pap_brazoIzquierdo_Medidas]
                               ,[pap_brazoIzquierdo_sistole]
                               ,[pap_brazoIzquierdo_diastole]
                               ,[pap_brazoDerecho_Medidas]
                               ,[pap_brazoDerecho_sistole]
                               ,[pap_brazoDerecho_diastole]
                               ,[pap_map]
                               ,[idGrupoEtnico]
                               ,[idFumador]
                               ,[idOvulacion]
                               ,[idHipertension]
                               ,[idPetEmbarazo]
                               ,[idPetMadre])
                         VALUES
                               (@pesoMadre
                               ,@estaturaMadre
                               ,@IMC
                               ,@paridad                               
                               ,@au_Pizquierdo
                               ,@au_Pderecho
                               ,@au_Pbajo
                               ,@pap_brazoIzquierdo_Medidas
                               ,@pap_brazoIzquierdo_sistole
                               ,@pap_brazoIzquierdo_diastole
                               ,@pap_brazoDerecho_Medidas
                               ,@pap_brazoDerecho_sistole
                               ,@pap_brazoDerecho_diastole
                               ,@pap_map
                               ,@idGrupoEtnico
                               ,@idFumador
                               ,@idOvulacion
                               ,@idHipertension
                               ,@idPetEmbarazo
                               ,@idPetMadre)"

        Try
            Using cn As New SqlConnection(My.Settings.cadena)
                Using cmd As New SqlCommand(queryString, cn)
                    cmd.CommandType = CommandType.Text
                    cn.Open()

                    cmd.Parameters.AddWithValue("@pesoMadre", doppler.PesoMadre)
                    cmd.Parameters.AddWithValue("@estaturaMadre", doppler.EstaturaMadre)
                    cmd.Parameters.AddWithValue("@IMC", doppler.Imc)
                    cmd.Parameters.AddWithValue("@paridad", doppler.Paridad)
                    cmd.Parameters.AddWithValue("@au_Pizquierdo", doppler.AuPizquierdo)
                    cmd.Parameters.AddWithValue("@au_Pderecho", doppler.AuPderecho)
                    cmd.Parameters.AddWithValue("@au_Pbajo", doppler.AuPbajo)
                    cmd.Parameters.AddWithValue("@pap_brazoIzquierdo_Medidas", doppler.BiMedidas)
                    cmd.Parameters.AddWithValue("@pap_brazoIzquierdo_sistole", doppler.BiSistole)
                    cmd.Parameters.AddWithValue("@pap_brazoIzquierdo_diastole", doppler.BiDiastole)
                    cmd.Parameters.AddWithValue("@pap_brazoDerecho_Medidas", doppler.BdMedidas)
                    cmd.Parameters.AddWithValue("@pap_brazoDerecho_sistole", doppler.BdSistole)
                    cmd.Parameters.AddWithValue("@pap_brazoDerecho_diastole", doppler.BdDiastole)
                    cmd.Parameters.AddWithValue("@pap_map", doppler.Map)
                    cmd.Parameters.AddWithValue("@idGrupoEtnico", doppler.IdGrupoEtnico)
                    cmd.Parameters.AddWithValue("@idFumador", doppler.IdFumador)
                    cmd.Parameters.AddWithValue("@idOvulacion", doppler.IdOvulacion)
                    cmd.Parameters.AddWithValue("@idHipertension", doppler.IdHipertension)
                    cmd.Parameters.AddWithValue("@idPetEmbarazo", doppler.IdPetEmbarazo)
                    cmd.Parameters.AddWithValue("@idPetMadre", doppler.IdPetMadre)

                    cmd.ExecuteNonQuery()
                End Using
            End Using
        Catch ex As Exception
            Throw New Exception(ex.Message)
        End Try

    End Sub

    Public Function GetEvaluacionRiesgoFetal(ByVal id As Integer) As DataTable
        Dim Da As New SqlDataAdapter
        Dim queryString = "select A.idfmf,D.descripcionCatalogo,c.nomEmpleado,A.edadMadre,A.riesgoFondo_T21,A.riesgoFondo_T18,A.riesgoFondo_T13,A.riesgoAjustado_T13,A.riesgoAjustado_T18,A.riesgoAjustado_T21,
                            A.riesgoPreEclampsia,A.riesgoDesorHipert,A.muerteFetal,A.Conclusiones from [T_EVALUACION_RIESGO_FETAL] A
                            inner join T_USUARIO B on b.idUsuario = a.idFMF
                            inner join T_EMPLEADO C on c.idEmpleado = b.idEmpleado
                            inner join T_CATALOGO D on A.idCatalogo = D.idCatalogo
                            where a.idRiesgoFetal= @id"

        Using cn As New SqlConnection(My.Settings.cadena)
            Using cmd As New SqlCommand(queryString, cn)
                Try
                    cmd.CommandType = CommandType.Text
                    cn.Open()
                    cmd.Parameters.AddWithValue("@id", id)
                    Da.SelectCommand = cmd
                    Using dt As New DataTable
                        Da.Fill(dt)
                        Return dt
                    End Using
                Catch ex As Exception
                    Throw New Exception(ex.Message)
                End Try
            End Using
        End Using
    End Function
    Public Function insertControlFetal(ByVal controlFetal As ControlFetal) As Integer
        Dim queryString = "INSERT INTO [dbo].[T_CONTROL_FETAL]
                                   ([rangoFetalCardiaco]
                                   ,[CRL]
                                   ,[NTsobreCordon]
                                   ,[NTdebajoCordon]
                                   ,[NT]
                                   ,[BPD]
                                   ,[HC]
                                   ,[AC]
                                   ,[FL]
                                   ,[anguloFacial]
                                   ,[comentarios]
                                   ,[idHallazgos]
                                   ,[idActividadCardiacaFetal]
                                   ,[idGrupoEtnico]
                                   ,[idHuesoNasal]
                                   ,[idTricuspideDoppler]
                                   ,[idVCdoppler]
                                   ,[idCerebro]
                                   ,[idEespina]
                                   ,[idCorazon]
                                   ,[idParedAbdominal]
                                   ,[idEstomago]
                                   ,[idVejiga]
                                   ,[idManos]
                                   ,[idPies]
                                   ,[idPlacenta]
                                   ,[idLiquidoAmniotico]
                                   ,[idCordon]
                                   ,[idInsercionCordon]
                                   ,[idCasoPaciente])
                             VALUES
                                   (@rangoFetalCardiaco
                                   ,@CRL
                                   ,@NTsobreCordon
                                   ,@NTdebajoCordon
                                   ,@NT
                                   ,@BPD
                                   ,@HC
                                   ,@AC
                                   ,@FL
                                   ,@anguloFacial
                                   ,@comentarios
                                   ,@idHallazgos
                                   ,@idActividadCardiacaFetal
                                   ,@idGrupoEtnico
                                   ,@idHuesoNasal
                                   ,@idTricuspideDoppler
                                   ,@idVCdoppler
                                   ,@idCerebro
                                   ,@idEespina
                                   ,@idCorazon
                                   ,@idParedAbdominal
                                   ,@idEstomago
                                   ,@idVejiga
                                   ,@idManos
                                   ,@idPies
                                   ,@idPlacenta
                                   ,@idLiquidoAmniotico
                                   ,@idCordon
                                   ,@idInsercionCordon
                                   ,@idCasoPaciente) SELECT CAST(scope_identity() AS int)"

        Try
            Using cn As New SqlConnection(My.Settings.cadena)
                Using cmd As New SqlCommand(queryString, cn)
                    cmd.CommandType = CommandType.Text
                    cn.Open()

                    cmd.Parameters.AddWithValue("@rangoFetalCardiaco", controlFetal.RangoFetalCardiaco)
                    cmd.Parameters.AddWithValue("@CRL", controlFetal.CRL)
                    cmd.Parameters.AddWithValue("@NTsobreCordon", controlFetal.NTsobreCordon)
                    cmd.Parameters.AddWithValue("@NTdebajoCordon", controlFetal.NTdebajoCordon)
                    cmd.Parameters.AddWithValue("@NT", controlFetal.NT)
                    cmd.Parameters.AddWithValue("@BPD", controlFetal.BPD)
                    cmd.Parameters.AddWithValue("@HC", controlFetal.HC)
                    cmd.Parameters.AddWithValue("@AC", controlFetal.AC)
                    cmd.Parameters.AddWithValue("@FL", controlFetal.FL)
                    cmd.Parameters.AddWithValue("@anguloFacial", controlFetal.AnguloFacial)
                    cmd.Parameters.AddWithValue("@comentarios", controlFetal.Comentarios)
                    cmd.Parameters.AddWithValue("@idHallazgos", controlFetal.IdHallazgos)
                    cmd.Parameters.AddWithValue("@idActividadCardiacaFetal", controlFetal.IdActividadCardiacaFetal)
                    cmd.Parameters.AddWithValue("@idGrupoEtnico", controlFetal.IdGrupoEtnico)
                    cmd.Parameters.AddWithValue("@idHuesoNasal", controlFetal.IdHuesoNasal)
                    cmd.Parameters.AddWithValue("@idTricuspideDoppler", controlFetal.IdTricuspideDoppler)
                    cmd.Parameters.AddWithValue("@idVCdoppler", controlFetal.IdVCdoppler)
                    cmd.Parameters.AddWithValue("@idCerebro", controlFetal.IdCerebro)
                    cmd.Parameters.AddWithValue("@idEespina", controlFetal.IdEespina)
                    cmd.Parameters.AddWithValue("@idCorazon", controlFetal.IdCorazon)
                    cmd.Parameters.AddWithValue("@idParedAbdominal", controlFetal.IdParedAbdominal)
                    cmd.Parameters.AddWithValue("@idEstomago", controlFetal.IdEstomago)
                    cmd.Parameters.AddWithValue("@idVejiga", controlFetal.IdVejiga)
                    cmd.Parameters.AddWithValue("@idManos", controlFetal.IdManos)
                    cmd.Parameters.AddWithValue("@idPies", controlFetal.IdPies)
                    cmd.Parameters.AddWithValue("@idPlacenta", controlFetal.IdPlacenta)
                    cmd.Parameters.AddWithValue("@idLiquidoAmniotico", controlFetal.IdLiquidoAmniotico)
                    cmd.Parameters.AddWithValue("@idCordon", controlFetal.IdCordon)
                    cmd.Parameters.AddWithValue("@idInsercionCordon", controlFetal.IdInsercionCordon)
                    cmd.Parameters.AddWithValue("@idCasoPaciente", controlFetal.IdCasoPaciente)

                    Dim id = cmd.ExecuteScalar()
                    Return id
                End Using
            End Using
        Catch ex As Exception
            Throw New Exception(ex.Message)
        End Try
    End Function
    Public Function getControlFetal(ByVal idControlFetal As Integer) As DataTable
        Dim cn As New SqlConnection
        Dim Cmd As New SqlCommand
        Dim Da As New SqlDataAdapter
        Dim Dv As New DataView
        Dim Ds As New DataSet
        Dim Dt As New DataTable
        Dim result As New DataTable

        If (cn.State = ConnectionState.Open) Then
            cn.Close()
        End If
        cn.ConnectionString = My.Settings.cadena
        cn.Open()
        Dt.Clear()
        Dim query As String
        query = "SELECT [idControlFetal]
                      ,[rangoFetalCardiaco]
                      ,[CRL]
                      ,[NTsobreCordon]
                      ,[NTdebajoCordon]
                      ,[NT]
                      ,[BPD]
                      ,[HC]
                      ,[AC]
                      ,[FL]
                      ,[anguloFacial]
                      ,[comentarios]
                      ,C1.descripcionCatalogo AS [idHallazgos]
                      ,C2.descripcionCatalogo AS  [idActividadCardiacaFetal]
                      ,C3.descripcionCatalogo AS  [idGrupoEtnico]
                      ,C4.descripcionCatalogo AS [idHuesoNasal]
                      ,C5.descripcionCatalogo AS [idTricuspideDoppler]
                      ,C6.descripcionCatalogo AS [idVCdoppler]
                      ,C7.descripcionCatalogo AS [idCerebro]
                      ,C8.descripcionCatalogo AS [idEespina]
                      ,C9.descripcionCatalogo AS [idCorazon]
                      ,C10.descripcionCatalogo AS [idParedAbdominal]
                      ,C11.descripcionCatalogo AS [idEstomago]
                      ,C12.descripcionCatalogo AS [idVejiga]
                      ,C13.descripcionCatalogo AS [idManos]
                      ,C14.descripcionCatalogo AS [idPies]
                      ,C15.descripcionCatalogo AS [idPlacenta]
                      ,C16.descripcionCatalogo AS [idLiquidoAmniotico]
                      ,C17.descripcionCatalogo AS [idCordon]
                      ,C18.descripcionCatalogo AS [idInsercionCordon]
                  FROM [BD_CLINICA_RP].[dbo].[T_CONTROL_FETAL] CF
                  LEFT JOIN [BD_CLINICA_RP].[dbo].[T_CATALOGO] C1 ON CF.idHallazgos = C1.idCatalogo
                  LEFT JOIN [BD_CLINICA_RP].[dbo].[T_CATALOGO] C2 ON CF.idActividadCardiacaFetal = C2.idCatalogo
                  LEFT JOIN [BD_CLINICA_RP].[dbo].[T_CATALOGO] C3 ON CF.idGrupoEtnico = C3.idCatalogo
                  LEFT JOIN [BD_CLINICA_RP].[dbo].[T_CATALOGO] C4 ON CF.idHuesoNasal = C4.idCatalogo
                  LEFT JOIN [BD_CLINICA_RP].[dbo].[T_CATALOGO] C5 ON CF.idTricuspideDoppler = C5.idCatalogo
                  LEFT JOIN [BD_CLINICA_RP].[dbo].[T_CATALOGO] C6 ON CF.idVCdoppler = C6.idCatalogo
                  LEFT JOIN [BD_CLINICA_RP].[dbo].[T_CATALOGO] C7 ON CF.idCerebro = C7.idCatalogo
                  LEFT JOIN [BD_CLINICA_RP].[dbo].[T_CATALOGO] C8 ON CF.idEespina = C8.idCatalogo
                  LEFT JOIN [BD_CLINICA_RP].[dbo].[T_CATALOGO] C9 ON CF.idCorazon = C9.idCatalogo
                  LEFT JOIN [BD_CLINICA_RP].[dbo].[T_CATALOGO] C10 ON CF.idParedAbdominal = C10.idCatalogo 
                  LEFT JOIN [BD_CLINICA_RP].[dbo].[T_CATALOGO] C11 ON CF.idEstomago = C11.idCatalogo
                  LEFT JOIN [BD_CLINICA_RP].[dbo].[T_CATALOGO] C12 ON CF.idVejiga = C12.idCatalogo
                  LEFT JOIN [BD_CLINICA_RP].[dbo].[T_CATALOGO] C13 ON CF.idManos = C13.idCatalogo
                  LEFT JOIN [BD_CLINICA_RP].[dbo].[T_CATALOGO] C14 ON CF.idPies = C14.idCatalogo
                  LEFT JOIN [BD_CLINICA_RP].[dbo].[T_CATALOGO] C15 ON CF.idPlacenta = C15.idCatalogo
                  LEFT JOIN [BD_CLINICA_RP].[dbo].[T_CATALOGO] C16 ON CF.idLiquidoAmniotico = C16.idCatalogo
                  LEFT JOIN [BD_CLINICA_RP].[dbo].[T_CATALOGO] C17 ON CF.idCordon = C17.idCatalogo
                  LEFT JOIN [BD_CLINICA_RP].[dbo].[T_CATALOGO] C18 ON CF.idInsercionCordon = C18.idCatalogo
                  WHERE [idControlFetal] = " & idControlFetal
        Cmd.CommandText = query
        Cmd.Connection = cn
        Da.SelectCommand = Cmd
        Da.Fill(Dt)
        result = Dt
        cn.Close()
        Return result
    End Function

    Public Function insertEvaluacionEmbarazoEctopico(ByVal objEvaluacion As EmbarazoEctopico) As Integer
        Dim queryString = "INSERT INTO [dbo].[T_EMBARAZO_ECTOPICO]
                           ([idCasoPaciente]
                           ,[fechaUltimoPeriodo]
                           ,[tamanoAncho]
                           ,[tamanoLargo]
                           ,[tamanoAlto]
                           ,[diametroMaximo]
                           ,[volumen]
                           ,[espesorEndometrial]
                           ,[hCG_PRGT]
                           ,[beta_hCG]
                           ,[PRGT]
                           ,[fechaMuestra]
                           ,[beta_hCG_48h]
                           ,[PRGT_48h]
                           ,[Comentarios]
                           ,[EmbarazoEctopico]
                           ,[EmbarazoIntrauterino]
                           ,[idTestEmbarazoOrina]
                           ,[idLocalizacion]
                           ,[idMorfologia]
                           ,[idSangradoVaginal]
                           ,[idDolor]
                           ,[idEstructura]
                           ,[idAccionTomar]
                           ,[idImpresionSubjetiva]
                           ,[idGradoCerteza])
                     VALUES
                           (@idCasoPaciente, 
                            @fechaUltimoPeriodo, 
                            @tamanoAncho, 
                            @tamanoLargo, 
                            @tamanoAlto, 
                            @diametroMaximo,
                            @volumen, 
                            @espesorEndometrial,
                            @hCG_PRGT,
                            @beta_hCG,
                            @PRGT,
                            @fechaMuestra,
                            @beta_hCG_48h,
                            @PRGT_48h, 
                            @Comentarios,
                            @EmbarazoEctopico, 
                            @EmbarazoIntrauterino,
                            @idTestEmbarazoOrina,
                            @idLocalizacion, 
                            @idMorfologia, 
                            @idSangradoVaginal,
                            @idDolor, 
                            @idEstructura,
                            @idAccionTomar,
                            @idImpresionSubjetiva,
                            @idGradoCerteza);SELECT CAST(scope_identity() AS int)"

        Try
            Using cn As New SqlConnection(My.Settings.cadena)
                Using cmd As New SqlCommand(queryString, cn)

                    cmd.CommandType = CommandType.Text
                    cn.Open()

                    cmd.Parameters.AddWithValue("@idCasoPaciente", objEvaluacion.IdCasoPaciente)
                    cmd.Parameters.AddWithValue("@fechaUltimoPeriodo", objEvaluacion.FechaUltimoPeriodo)
                    cmd.Parameters.AddWithValue("@tamanoAncho", objEvaluacion.TamanoAncho)
                    cmd.Parameters.AddWithValue("@tamanoLargo", objEvaluacion.TamanoLargo)
                    cmd.Parameters.AddWithValue("@tamanoAlto", objEvaluacion.TamanoAlto)
                    cmd.Parameters.AddWithValue("@diametroMaximo", objEvaluacion.DiametroMaximo)
                    cmd.Parameters.AddWithValue("@volumen", objEvaluacion.Volumen)
                    cmd.Parameters.AddWithValue("@espesorEndometrial", objEvaluacion.EspesorEndometrial)
                    cmd.Parameters.AddWithValue("@hCG_PRGT", objEvaluacion.HCG_PRGT)
                    cmd.Parameters.AddWithValue("@beta_hCG", objEvaluacion.Beta_hCG)
                    cmd.Parameters.AddWithValue("@PRGT", objEvaluacion.PRGT)
                    cmd.Parameters.AddWithValue("@fechaMuestra", objEvaluacion.FechaMuestra)
                    cmd.Parameters.AddWithValue("@beta_hCG_48h", objEvaluacion.Beta_hCG_48h)
                    cmd.Parameters.AddWithValue("@PRGT_48h", objEvaluacion.PRGT_48h)
                    cmd.Parameters.AddWithValue("@Comentarios", objEvaluacion.Comentarios)
                    cmd.Parameters.AddWithValue("@EmbarazoEctopico", objEvaluacion.EmbarazoEctopico)
                    cmd.Parameters.AddWithValue("@EmbarazoIntrauterino", objEvaluacion.EmbarazoIntrauterino)
                    cmd.Parameters.AddWithValue("@idTestEmbarazoOrina", objEvaluacion.IdTestEmbarazoOrina)
                    cmd.Parameters.AddWithValue("@idLocalizacion", objEvaluacion.IdLocalizacion)
                    cmd.Parameters.AddWithValue("@idMorfologia", objEvaluacion.IdMorfologia)
                    cmd.Parameters.AddWithValue("@idSangradoVaginal", objEvaluacion.IdSangradoVaginal)
                    cmd.Parameters.AddWithValue("@idDolor", objEvaluacion.IdDolor)
                    cmd.Parameters.AddWithValue("@idEstructura", objEvaluacion.IdEstructura)
                    cmd.Parameters.AddWithValue("@idAccionTomar", objEvaluacion.IdAccionTomar)
                    cmd.Parameters.AddWithValue("@idImpresionSubjetiva", objEvaluacion.IdImpresionSubjetiva)
                    cmd.Parameters.AddWithValue("@idGradoCerteza", objEvaluacion.IdGradoCerteza)

                    Dim id = cmd.ExecuteScalar()
                    Return id
                End Using
            End Using
        Catch ex As Exception
            Throw New Exception(ex.Message)
        End Try
    End Function
    Public Function GetEvaluacionEmbarazoEctopico(ByVal id As Integer) As DataTable
        Dim Da As New SqlDataAdapter
        Dim queryString = "SELECT A.[idEmbarazoEctopico]
                          ,A.[idCasoPaciente]
                          ,A.[fechaUltimoPeriodo]
                          ,A.[tamanoAncho]
                          ,A.[tamanoLargo]
                          ,A.[tamanoAlto]
                          ,A.[diametroMaximo]
                          ,A.[volumen]
                          ,A.[espesorEndometrial]
                          ,A.[hCG_PRGT]
                          ,A.[beta_hCG]
                          ,A.[PRGT]
                          ,A.[fechaMuestra]
                          ,A.[beta_hCG_48h]
                          ,A.[PRGT_48h]
                          ,A.[Comentarios]
                          ,A.[EmbarazoEctopico]
                          ,A.[EmbarazoIntrauterino]
                          ,A.[idTestEmbarazoOrina]
	                      ,B.descripcionCatalogo desTestEmbarazoOrina
                          ,A.[idLocalizacion]
	                      ,C.descripcionCatalogo desLocalizacion
                          ,A.[idMorfologia]
	                      ,D.descripcionCatalogo desMorfologia
                          ,A.[idSangradoVaginal]
	                      ,E.descripcionCatalogo desSangradoVaginal
                          ,A.[idDolor]
	                      ,F.descripcionCatalogo desDolor
                          ,A.[idEstructura]
	                      ,G.descripcionCatalogo desEstructura
                          ,A.[idAccionTomar]
	                      ,H.descripcionCatalogo desAccionTomar
                          ,A.[idImpresionSubjetiva]
	                      ,I.descripcionCatalogo desImpresionSubjetiva
                          ,A.[idGradoCerteza]
	                      ,J.descripcionCatalogo desGradoCerteza
                      FROM [dbo].[T_EMBARAZO_ECTOPICO] A
                      INNER JOIN [dbo].[T_CATALOGO] B
                      ON A.idTestEmbarazoOrina = B.idCatalogo
                      INNER JOIN [dbo].[T_CATALOGO] C
                      ON A.idLocalizacion = C.idCatalogo
                      INNER JOIN [dbo].[T_CATALOGO] D
                      ON A.idMorfologia = D.idCatalogo
                      INNER JOIN [dbo].[T_CATALOGO] E
                      ON A.idSangradoVaginal = E.idCatalogo
                      INNER JOIN [dbo].[T_CATALOGO] F
                      ON A.idDolor = F.idCatalogo
                      INNER JOIN [dbo].[T_CATALOGO] G
                      ON A.idEstructura = G.idCatalogo
                      INNER JOIN [dbo].[T_CATALOGO] H
                      ON A.idAccionTomar = H.idCatalogo
                      INNER JOIN [dbo].[T_CATALOGO] I
                      ON A.idImpresionSubjetiva = I.idCatalogo
                      INNER JOIN [dbo].[T_CATALOGO] J
                      ON A.idGradoCerteza = J.idCatalogo
                      WHERE A.idEmbarazoEctopico = @id"

        Using cn As New SqlConnection(My.Settings.cadena)
            Using cmd As New SqlCommand(queryString, cn)
                Try
                    cmd.CommandType = CommandType.Text
                    cn.Open()
                    cmd.Parameters.AddWithValue("@id", id)
                    Da.SelectCommand = cmd
                    Using dt As New DataTable
                        Da.Fill(dt)
                        Return dt
                    End Using
                Catch ex As Exception
                    Throw New Exception(ex.Message)
                End Try
            End Using
        End Using
    End Function
End Class

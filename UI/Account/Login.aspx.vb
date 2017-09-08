Imports System.Web
Imports System.Web.UI
Imports Microsoft.AspNet.Identity
Imports Microsoft.AspNet.Identity.EntityFramework
Imports Microsoft.AspNet.Identity.Owin
Imports Microsoft.Owin.Security
Imports Owin
Imports CapaLogic.UsuarioLogic

Partial Public Class Login
    Inherits Page
    Dim usauarioLogic As CapaLogic.UsuarioLogic
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'RegisterHyperLink.NavigateUrl = "Register"
        ' Habilite esta opción una vez tenga la confirmación de la cuenta habilitada para la funcionalidad de restablecimiento de contraseña
        ' ForgotPasswordHyperLink.NavigateUrl = "Forgot"
        'OpenAuthLogin.ReturnUrl = Request.QueryString("ReturnUrl")
        'Dim returnUrl = HttpUtility.UrlEncode(Request.QueryString("ReturnUrl"))
        'If Not [String].IsNullOrEmpty(returnUrl) Then
        'RegisterHyperLink.NavigateUrl += "?ReturnUrl=" & returnUrl
        'End If
        usauarioLogic = New CapaLogic.UsuarioLogic
    End Sub

    Protected Sub LogIn(sender As Object, e As EventArgs)
        If IsValid Then
            ' Validar la contraseña del usuario
            'Dim manager = Context.GetOwinContext().GetUserManager(Of ApplicationUserManager)()
            'Dim signinManager = Context.GetOwinContext().GetUserManager(Of ApplicationSignInManager)()

            '' Esto no cuenta los errores de inicio de sesión hacia el bloqueo de cuenta
            '' Para habilitar los errores de contraseña para desencadenar el bloqueo, cambie a shouldLockout := True
            'Dim result = signinManager.PasswordSignIn(Email.Text, Password.Text, RememberMe.Checked, shouldLockout := False)

            'Select Case result
            '    Case SignInStatus.Success
            '        IdentityHelper.RedirectToReturnUrl(Request.QueryString("ReturnUrl"), Response)
            '        Exit Select
            '    Case SignInStatus.LockedOut
            '        Response.Redirect("/Account/Lockout")
            '        Exit Select
            '    Case SignInStatus.RequiresVerification
            '        Response.Redirect(String.Format("/Account/TwoFactorAuthenticationSignIn?ReturnUrl={0}&RememberMe={1}",
            '                                        Request.QueryString("ReturnUrl"),
            '                                        RememberMe.Checked),
            '                          True)
            '        Exit Select
            '    Case Else
            '        FailureText.Text = "Intento de inicio de sesión no válido"
            '        ErrorMessage.Visible = True
            '        Exit Select
            'End Select

            Dim result As New DataTable
            result = usauarioLogic.validarAcceso(Email.Text, Password.Text)

            If result IsNot Nothing Then
                If result.Rows.Count > 0 Then
                    Dim user As New CapaEntities.Usuario
                    For Each row As DataRow In result.Rows
                        user.id = CInt(row("idUsuario"))
                        user.usuario = CStr(row("nombreUsuario"))
                        user.email = CStr(row("email"))
                        user.empleado.id = CInt(row("idEmpleado"))
                        user.empleado.nombre = "Dr. " & CStr(row("nomEmpleado"))
                        user.empleado.dni = CStr(row("nroDni"))
                        user.empleado.profesion = CStr(row("dscProfesion"))
                        user.empleado.idEspecialidad = CInt(row("idEspecialidad"))
                    Next

                    If user IsNot Nothing Then
                        Session("Usuario") = user
                        Response.Redirect("../Index.aspx")
                    End If
                Else
                    FailureText.Text = "Intento de inicio de sesión no válido"
                    ErrorMessage.Visible = True
                End If
            End If

        End If
    End Sub
End Class

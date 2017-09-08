Imports System.Web.Optimization
Imports System.Web.Routing
Imports System.Web.Http
Public Class Global_asax
    Inherits HttpApplication

    Sub Application_Start(sender As Object, e As EventArgs)
        ' Se desencadena al iniciar la aplicación
        RouteConfig.RegisterRoutes(RouteTable.Routes)
        BundleConfig.RegisterBundles(BundleTable.Bundles)
        GlobalConfiguration.Configure(AddressOf WebApiConfig.Register)
    End Sub
End Class
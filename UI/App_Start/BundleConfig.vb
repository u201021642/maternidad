Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.Optimization

Public Class BundleConfig
    ' Para obtener más información sobre la unión, visite http://go.microsoft.com/fwlink/?LinkID=303951
    Public Shared Sub RegisterBundles(ByVal bundles As BundleCollection)
        bundles.Add(New ScriptBundle("~/bundles/WebFormsJs").Include(
                        "~/Scripts/WebForms/WebForms.js",
                        "~/Scripts/WebForms/WebUIValidation.js",
                        "~/Scripts/WebForms/MenuStandards.js",
                        "~/Scripts/WebForms/Focus.js",
                        "~/Scripts/WebForms/GridView.js",
                        "~/Scripts/WebForms/DetailsView.js",
                        "~/Scripts/WebForms/TreeView.js",
                        "~/Scripts/WebForms/WebParts.js"))


        ' El orden es muy importante para el funcionamiento de estos archivos ya que tienen dependencias explícitas
        bundles.Add(New ScriptBundle("~/bundles/MsAjaxJs").Include(
                "~/Scripts/WebForms/MsAjax/MicrosoftAjax.js",
                "~/Scripts/WebForms/MsAjax/MicrosoftAjaxApplicationServices.js",
                "~/Scripts/WebForms/MsAjax/MicrosoftAjaxTimer.js",
                "~/Scripts/WebForms/MsAjax/MicrosoftAjaxWebForms.js"))

        ' Use la versión de desarrollo de Modernizr para desarrollar y aprender. Luego, cuando esté listo
        ' para la producción, use la herramienta de creación en http://modernizr.com para elegir solo las pruebas que necesite
        bundles.Add(New ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"))

        bundles.Add(New ScriptBundle("~/bundles/vue").Include(
                        "~/Scripts/vue.js",
                        "~/Scripts/axios.min.js"))

        bundles.Add(New ScriptBundle("~/bundles/crviewer").Include(
                        "~/Scripts/crystalreportviewers13/js/crviewer/crv.js",
                        "~/Scripts/axios.min.js"))

        bundles.Add(New ScriptBundle("~/bundles/jquery-ajax").Include(
                        "~/Scripts/ajax/jquery.min.js"))

        bundles.Add(New ScriptBundle("~/bundles/moments").Include(
                        "~/Scripts/moment.js"))

        bundles.Add(New ScriptBundle("~/bundles/bootstrap-datetimepicker").Include(
                        "~/Scripts/bootstrap-datetimepicker.min.js"))

        bundles.Add(New ScriptBundle("~/bundles/viewmodel").Include(
                        "~/Scripts/viewmodel/base.js"))

        bundles.Add(New ScriptBundle("~/bundles/bootstrap").Include(
                        "~/Scripts/bootstrap.min.js"))

        ScriptManager.ScriptResourceMapping.AddDefinition("respond", New ScriptResourceDefinition() With {
            .Path = "~/Scripts/respond.min.js",
            .DebugPath = "~/Scripts/respond.js"})
        ScriptManager.ScriptResourceMapping.AddDefinition("respond", New ScriptResourceDefinition() With {
            .Path = "~/Scripts/app/dist/main.build.min.js",
            .DebugPath = "~/Scripts/app/dist/main.build.js"})

    End Sub
End Class

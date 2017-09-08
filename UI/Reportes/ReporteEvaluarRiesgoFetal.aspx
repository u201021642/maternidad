<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ReporteEvaluarRiesgoFetal.aspx.vb" Inherits="UI.ReporteEvaluarRiesgoFetal" %>
<%@ Register assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="spacer"></div>
        <CR:CrystalReportViewer ID="crvReporte" runat="server" AutoDataBind="true" />

    </div>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PerPageScript" runat="server">
</asp:Content>

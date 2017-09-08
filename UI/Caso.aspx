<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Caso.aspx.vb" Inherits="UI.Caso" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-sm-4">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-sm-12" style="text-align: center;">
                            <asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar Sesión" CssClass="btn btn-default" Style="width: 100%;" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <hr />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label for="txtPaciente" class="col-sm-4 control-label">Paciente: </label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtPaciente" runat="server" CssClass="form-control" Width="100%" placeholder="" value="Katherine Laurel Diaz" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtHistoria" class="col-sm-4 control-label">H.C.: </label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtHistoria" runat="server" CssClass="form-control" Width="100%" placeholder="" value="45868258" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtId" class="col-sm-4 control-label">Id: </label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtId" runat="server" CssClass="form-control" Width="100%" placeholder="" value="02" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtEdad" class="col-sm-4 control-label">Edad: </label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtEdad" runat="server" CssClass="form-control" Width="100%" placeholder="" value="28" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <hr />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label for="txtUsuario" class="col-sm-4 control-label">Usuario: </label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" Width="100%" placeholder="" value="Dr. David Compodónico" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtFecha" class="col-sm-4 control-label">Fecha: </label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtFecha" runat="server" CssClass="form-control" Width="100%" placeholder="" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtSala" class="col-sm-4 control-label">Sala: </label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtSala" runat="server" CssClass="form-control" Width="100%" placeholder="" value="Sala Principal" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12" style="text-align: center;">
                                        <asp:Image ID="imgLogo" runat="server" ImageUrl="~/logo.jpg" Width="80%" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-8">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <div class="col-sm-6">
                                <h2>Caso de Paciente</h2>
                            </div>
                        </div>
                    </div>
                    <div class="form-horizontal">
                        <asp:UpdatePanel runat="server" ID="UpdatePanel" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="form-group">
                                    <div class="col-sm-6">
                                        <asp:RadioButtonList ID="rbCaso" runat="server" RepeatDirection="Vertical" AutoPostBack="true">
                                            <asp:ListItem Selected="True" Value="1">Caso Actual</asp:ListItem>
                                            <asp:ListItem Value="0">Nuevo Caso</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:Label runat="server" ID="lblFechaCaso" Visible="true"></asp:Label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-6" style="text-align: center;">
                                        <asp:Button ID="btnAbrirCaso" runat="server" Text="Abrir" CssClass="btn btn-primary" />
                                    </div>
                                    <div class="col-sm-6" style="text-align: center;">
                                        <asp:Button ID="btnSalir" runat="server" Text="Cancelar" CssClass="btn btn-primary" />
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

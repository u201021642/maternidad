<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Menu.aspx.vb" Inherits="UI.Menu" %>
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
                                    <label for="txtCaso" class="col-sm-4 control-label">Caso: </label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtCaso" runat="server" CssClass="form-control" Width="100%" placeholder="" value="FM-00052" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtFechaCaso" class="col-sm-4 control-label">Fecha: </label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtFechaCaso" runat="server" CssClass="form-control" Width="100%" placeholder="" value="19/07/2017" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtHoraCaso" class="col-sm-4 control-label">Hora: </label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtHoraCaso" runat="server" CssClass="form-control" Width="100%" placeholder="" value="10:30 am" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
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
                    <div class="row">
                        <div class="col-sm-12" style="text-align: center;">
                            <div class="col-sm-12">
                                <asp:Image ID="imgRiesgoFetal" runat="server" ImageUrl="~/a.png" Width="30%" />
                            </div>
                            <div class="col-sm-12">
                                <asp:Button ID="btnRiesgoFetal" runat="server" Text="Evaluar Riesgo Fetal" CssClass="btn btn-primary" />
                            </div>
                        </div>
                    </div>
                     <div class="row">
                        <div class="col-sm-12">
                            <div style="height: 20px;"></div>
                        </div>
                    </div>
                     <div class="row">
                        <div class="col-sm-12" style="text-align: center;">
                            <div class="col-sm-12">
                                <asp:Image ID="imgControlFetal" runat="server" ImageUrl="~/b.png" Width="30%" />
                            </div>
                            <div class="col-sm-12">
                                <asp:Button ID="btnControlFetal" runat="server" Text="Realizar Control Fetal" CssClass="btn btn-primary" />
                            </div>
                        </div>
                        </div>
                     <div class="row">
                        <div class="col-sm-12">
                            <div style="height: 20px;"></div>
                        </div>
                    </div>
                     <div class="row">
                        <div class="col-sm-12" style="text-align: center;">
                            <div class="col-sm-12">
                                <asp:Image ID="imgEmbarazo" runat="server" ImageUrl="~/c.jpg" Width="30%" />
                            </div>
                            <div class="col-sm-12">
                                <asp:Button ID="btnEmbarazo" runat="server" Text="Evaluar Embarazo Ectópico" CssClass="btn btn-primary" />
                            </div>
                        </div>
                    </div>
                     <div class="row">
                        <div class="col-sm-12">
                            <div style="height: 80px;"></div>
                        </div>
                    </div>
                     <div class="row">
                        <div class="col-sm-12" style="text-align: center;">
                            <div class="col-sm-12">
                                <asp:Button ID="btnSalir" runat="server" Text="Salir" CssClass="btn btn-primary" width="30%"/>
                            </div>
                        </div>
                    </div>
                     <div class="row">
                        <div class="col-sm-12">
                            <div style="height: 90px;"></div>
                        </div>
                    </div>
                 </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PerPageScript" runat="server">
</asp:Content>

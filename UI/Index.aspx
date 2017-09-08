<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Index.aspx.vb" Inherits="UI.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-sm-4">
            <div class="panel panel-default">
                <div class="panel-body">                    
                    <div class="row">
                        <div class="col-sm-12" style="text-align: center;">
                             <asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar Sesión" CssClass="btn btn-default" style="width:100%;"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div style="height: 300px;"></div>
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
                                        <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" Width="100%" placeholder="" value="" ReadOnly="true"></asp:TextBox>
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
                            <asp:Image ID="imgPrincipal" runat="server" ImageUrl="~/principal.png" Width="50%" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div style="height: 100px;"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12" style="text-align: center;">
                            <div class="col-sm-12">
                                <asp:Image ID="imgCaso" runat="server" ImageUrl="~/a.png" Width="50%" />
                            </div>
                            <div class="col-sm-12">
                                <asp:Button ID="btnGestionar" runat="server" Text="Gestionar Caso" CssClass="btn btn-primary" />
                            </div>
                        </div>
                        
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div style="height: 100px;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

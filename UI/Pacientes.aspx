<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Pacientes.aspx.vb" Inherits="UI.Pacientes" %>

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
                    <div class="form-horizontal">
                        <div class="form-group">
                            <div class="col-sm-6">
                                <h2>Listado de Pacientes</h2>
                            </div>
                        </div>
                    </div>
                    <div class="form-horizontal">
                        <asp:UpdatePanel runat="server" ID="UpdatePanel" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="form-group">
                                    <label for="txtId" class="col-sm-2 control-label">Id </label>
                                    <div class="col-sm-2">
                                        <asp:TextBox ID="txtId" runat="server" CssClass="form-control" Width="100%" placeholder="" onkeydown="return jsDecimals(event);"></asp:TextBox>
                                    </div>
                                    <label for="txtNombre" class="col-sm-2 control-label">Nombre </label>
                                    <div class="col-sm-4">
                                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" Width="100%" placeholder="" onkeydown="return jsDecimals(event);"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn btn-primary" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <asp:GridView ID="gvPacientes" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" Width="100%">
                                            <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>

                                            <Columns>
                                                <asp:BoundField DataField="id" HeaderText="Id"></asp:BoundField>
                                                <asp:BoundField DataField="Nombres" HeaderText="Nombres"></asp:BoundField>
                                                <asp:BoundField DataField="Apellidos" HeaderText="Apellidos"></asp:BoundField>
                                                <asp:BoundField DataField="Edad" HeaderText="Edad" />
                                                <asp:BoundField DataField="hc" HeaderText="H.C."></asp:BoundField>
                                                <asp:BoundField DataField="ultima_visita" HeaderText="Última Visita"></asp:BoundField>
                                                <asp:CommandField ButtonType="Image" HeaderText="Seleccionar" SelectImageUrl="~/glyphicons-207-ok.png" SelectText="" ShowSelectButton="True" />
                                            </Columns>

                                            <EditRowStyle BackColor="#2461BF"></EditRowStyle>

                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>

                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></HeaderStyle>

                                            <PagerStyle HorizontalAlign="Center" BackColor="#2461BF" ForeColor="White"></PagerStyle>

                                            <RowStyle BackColor="#EFF3FB"></RowStyle>

                                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                                            <SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>

                                            <SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>

                                            <SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>

                                            <SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
                                        </asp:GridView>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-6" style="text-align: center;">
                                        <asp:Button ID="btnAbrirCaso" runat="server" Text="Abrir Caso" CssClass="btn btn-primary" Enabled="false" />
                                    </div>
                                    <div class="col-sm-6" style="text-align: center;">
                                        <asp:Button ID="btnSalir" runat="server" Text="Salir" CssClass="btn btn-primary" />
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

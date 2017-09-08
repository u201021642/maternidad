<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ControlFetal.aspx.vb" Inherits="UI.ControlFetal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        function jsDecimals(e) {

            var evt = (e) ? e : window.event;
            var key = (evt.keyCode) ? evt.keyCode : evt.which;
            if (key != null) {
                key = parseInt(key, 10);
                if ((key < 48 || key > 57) && (key < 96 || key > 105)) {
                    //Aca tenemos que reemplazar "Decimals" por "NoDecimals" si queremos que no se permitan decimales
                    if (!jsIsUserFriendlyChar(key, "Decimals")) {
                        return false;
                    }
                }
                else {
                    if (evt.shiftKey) {
                        return false;
                    }
                }
            }
            return true;
        }

        // Función para las teclas especiales
        //------------------------------------------
        function jsIsUserFriendlyChar(val, step) {
            // Backspace, Tab, Enter, Insert, y Delete
            if (val == 8 || val == 9 || val == 13 || val == 45 || val == 46) {
                return true;
            }
            // Ctrl, Alt, CapsLock, Home, End, y flechas
            if ((val > 16 && val < 21) || (val > 34 && val < 41)) {
                return true;
            }
            if (step == "Decimals") {
                if (val == 190 || val == 110) {  //Check dot key code should be allowed
                    return true;
                }
            }
            // The rest
            return false;
        }
    </script>
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
                    <div class="form-horizontal">
                        <asp:UpdatePanel runat="server" ID="UpdatePanel" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="form-group">
                                    <div class="col-sm-8">
                                        <h2>Realizar Control Fetal</h2>
                                    </div>
                                    <div class="col-sm-4">
                                        <h4 style="text-align: right; padding-top: 20px;">
                                            <asp:Label runat="server" ID="lblCaso"></asp:Label></h4>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12" style="text-align: left; color: red;">
                                        <span>(*) Todos los Campos son Obligatorios</span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="cboHallazgos" class="col-sm-3 control-label">Hallazgos</label>
                                    <div class="col-sm-3">
                                        <select id="cboHallazgos" runat="server" class="form-control" datavaluefield="idCatalogo" datatextfield="descripcionCatalogo">
                                        </select>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="cboHallazgos" ValidationGroup="ControlFetal" CssClass="text-danger" ErrorMessage="El campo es obligatorio" Display="Dynamic" />
                                    </div>
                                    <div class="col-sm-6" style="text-align: right;">
                                        <asp:Button ID="btnTransferirMedidas" runat="server" Text="Transferir Medidas" CssClass="btn btn-primary" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="cboActividadCardiaca" class="col-sm-3 control-label">Actividad cardiaca fetal</label>
                                    <div class="col-sm-3">
                                        <select id="cboActividadCardiaca" runat="server" class="form-control" datavaluefield="idCatalogo" datatextfield="descripcionCatalogo">
                                        </select>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="cboActividadCardiaca" ValidationGroup="ControlFetal" CssClass="text-danger" ErrorMessage="El campo es obligatorio" Display="Dynamic" />
                                    </div>
                                    <label for="txtRangoFetal" class="col-sm-3 control-label">Rango fetal cardiaco</label>
                                    <div class="col-sm-3">
                                        <div class="col-sm-9" style="padding-left: 0px;">
                                            <asp:TextBox ID="txtRangoFetal" runat="server" CssClass="form-control" Width="100%" placeholder="" ReadOnly="true"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtRangoFetal" ValidationGroup="ControlFetal" CssClass="text-danger" ErrorMessage="El campo es obligatorio" Display="Dynamic" />
                                        </div>
                                        <div class="col-sm-3">
                                            <label class="control-label" style="font-weight: normal;">bpm</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtCrl" class="col-sm-3 control-label">CRL</label>
                                    <div class="col-sm-3">
                                        <div class="col-sm-9" style="padding-left: 0px;">
                                            <asp:TextBox ID="txtCrl" runat="server" CssClass="form-control" Width="100%" placeholder="" ReadOnly="true"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCrl" ValidationGroup="ControlFetal" CssClass="text-danger" ErrorMessage="El campo es obligatorio" Display="Dynamic" />
                                        </div>
                                        <div class="col-sm-3">
                                            <label class="control-label" style="font-weight: normal;">mm</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtNTSobre" class="col-sm-3 control-label">NT sobre cordón</label>
                                    <div class="col-sm-3">
                                        <div class="col-sm-9" style="padding-left: 0px;">
                                            <asp:TextBox ID="txtNTSobre" runat="server" CssClass="form-control" Width="100%" placeholder="" ReadOnly="true"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNTSobre" ValidationGroup="ControlFetal" CssClass="text-danger" ErrorMessage="El campo es obligatorio" Display="Dynamic" />
                                        </div>
                                        <div class="col-sm-3">
                                            <label class="control-label" style="font-weight: normal;">mm</label>
                                        </div>
                                    </div>
                                    <label for="txtNTDebajo" class="col-sm-3 control-label">NT debajo cordón</label>
                                    <div class="col-sm-3">
                                        <div class="col-sm-9" style="padding-left: 0px;">
                                            <asp:TextBox ID="txtNTDebajo" runat="server" CssClass="form-control" Width="100%" placeholder="" ReadOnly="true"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNTDebajo" ValidationGroup="ControlFetal" CssClass="text-danger" ErrorMessage="El campo es obligatorio" Display="Dynamic" />
                                        </div>
                                        <div class="col-sm-3">
                                            <label class="control-label" style="font-weight: normal;">mm</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtNT" class="col-sm-3 control-label">NT</label>
                                    <div class="col-sm-3">
                                        <div class="col-sm-9" style="padding-left: 0px;">
                                            <asp:TextBox ID="txtNT" runat="server" CssClass="form-control" Width="100%" placeholder="" ReadOnly="true"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNT" ValidationGroup="ControlFetal" CssClass="text-danger" ErrorMessage="El campo es obligatorio" Display="Dynamic" />
                                        </div>
                                        <div class="col-sm-3">
                                            <label class="control-label" style="font-weight: normal;">mm</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtBPD" class="col-sm-3 control-label">BPD</label>
                                    <div class="col-sm-3">
                                        <div class="col-sm-9" style="padding-left: 0px;">
                                            <asp:TextBox ID="txtBPD" runat="server" CssClass="form-control" Width="100%" placeholder="" ReadOnly="true"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtBPD" ValidationGroup="ControlFetal" CssClass="text-danger" ErrorMessage="El campo es obligatorio" Display="Dynamic" />
                                        </div>
                                        <div class="col-sm-3">
                                            <label class="control-label" style="font-weight: normal;">mm</label>
                                        </div>
                                    </div>
                                    <label for="txtHC" class="col-sm-3 control-label">HC</label>
                                    <div class="col-sm-3">
                                        <div class="col-sm-9" style="padding-left: 0px;">
                                            <asp:TextBox ID="txtHC" runat="server" CssClass="form-control" Width="100%" placeholder="" ReadOnly="true"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtHC" ValidationGroup="ControlFetal" CssClass="text-danger" ErrorMessage="El campo es obligatorio" Display="Dynamic" />
                                        </div>
                                        <div class="col-sm-3">
                                            <label class="control-label" style="font-weight: normal;">mm</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtAC" class="col-sm-3 control-label">AC</label>
                                    <div class="col-sm-3">
                                        <div class="col-sm-9" style="padding-left: 0px;">
                                            <asp:TextBox ID="txtAC" runat="server" CssClass="form-control" Width="100%" placeholder="" ReadOnly="true"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAC" ValidationGroup="ControlFetal" CssClass="text-danger" ErrorMessage="El campo es obligatorio" Display="Dynamic" />
                                        </div>
                                        <div class="col-sm-3">
                                            <label class="control-label" style="font-weight: normal;">mm</label>
                                        </div>
                                    </div>
                                    <label for="txtFL" class="col-sm-3 control-label">FL</label>
                                    <div class="col-sm-3">
                                        <div class="col-sm-9" style="padding-left: 0px;">
                                            <asp:TextBox ID="txtFL" runat="server" CssClass="form-control" Width="100%" placeholder="" ReadOnly="true"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFL" ValidationGroup="ControlFetal" CssClass="text-danger" ErrorMessage="El campo es obligatorio" Display="Dynamic" />
                                        </div>
                                        <div class="col-sm-3">
                                            <label class="control-label" style="font-weight: normal;">mm</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="cboGrupoEtnico" class="col-sm-3 control-label">Grupo étnico</label>
                                    <div class="col-sm-3">
                                        <select id="cboGrupoEtnico" runat="server" class="form-control" datavaluefield="idCatalogo" datatextfield="descripcionCatalogo">
                                        </select>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="cboGrupoEtnico" ValidationGroup="ControlFetal" CssClass="text-danger" ErrorMessage="El campo es obligatorio" Display="Dynamic" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="cboHuesoNasal" class="col-sm-3 control-label">Hueso nasal</label>
                                    <div class="col-sm-3">
                                        <select id="cboHuesoNasal" runat="server" class="form-control" datavaluefield="idCatalogo" datatextfield="descripcionCatalogo">
                                        </select>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="cboHuesoNasal" ValidationGroup="ControlFetal" CssClass="text-danger" ErrorMessage="El campo es obligatorio" Display="Dynamic" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtAnguloFacial" class="col-sm-3 control-label">Ángulo facial</label>
                                    <div class="col-sm-3">
                                        <div class="col-sm-9" style="padding-left: 0px;">
                                            <asp:TextBox ID="txtAnguloFacial" runat="server" CssClass="form-control" Width="100%" placeholder="" ReadOnly="true"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAnguloFacial" ValidationGroup="ControlFetal" CssClass="text-danger" ErrorMessage="El campo es obligatorio" Display="Dynamic" />
                                        </div>
                                        <div class="col-sm-3">
                                            <label class="control-label" style="font-weight: normal;">grados</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="cboTricuspideDoppler" class="col-sm-3 control-label">Tricuspide doppler</label>
                                    <div class="col-sm-3">
                                        <select id="cboTricuspideDoppler" runat="server" class="form-control" datavaluefield="idCatalogo" datatextfield="descripcionCatalogo">
                                        </select>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="cboTricuspideDoppler" ValidationGroup="ControlFetal" CssClass="text-danger" ErrorMessage="El campo es obligatorio" Display="Dynamic" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="cboVCDoppler" class="col-sm-3 control-label">VC doppler</label>
                                    <div class="col-sm-3">
                                        <select id="cboVCDoppler" runat="server" class="form-control" datavaluefield="idCatalogo" datatextfield="descripcionCatalogo">
                                        </select>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="cboVCDoppler" ValidationGroup="ControlFetal" CssClass="text-danger" ErrorMessage="El campo es obligatorio" Display="Dynamic" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="cboCraneoCerebro" class="col-sm-3 control-label">Cráneo/cerebro</label>
                                    <div class="col-sm-3">
                                        <select id="cboCraneoCerebro" runat="server" class="form-control" datavaluefield="idCatalogo" datatextfield="descripcionCatalogo">
                                        </select>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="cboCraneoCerebro" ValidationGroup="ControlFetal" CssClass="text-danger" ErrorMessage="El campo es obligatorio" Display="Dynamic" />
                                    </div>
                                    <label for="cboEspina" class="col-sm-3 control-label">Espina</label>
                                    <div class="col-sm-3">
                                        <select id="cboEspina" runat="server" class="form-control" datavaluefield="idCatalogo" datatextfield="descripcionCatalogo">
                                        </select>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="cboEspina" ValidationGroup="ControlFetal" CssClass="text-danger" ErrorMessage="El campo es obligatorio" Display="Dynamic" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="cboCorazon" class="col-sm-3 control-label">Corazón</label>
                                    <div class="col-sm-3">
                                        <select id="cboCorazon" runat="server" class="form-control" datavaluefield="idCatalogo" datatextfield="descripcionCatalogo">
                                        </select>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="cboCorazon" ValidationGroup="ControlFetal" CssClass="text-danger" ErrorMessage="El campo es obligatorio" Display="Dynamic" />
                                    </div>
                                    <label for="cboParedAbdominal" class="col-sm-3 control-label">Pared Abdominal</label>
                                    <div class="col-sm-3">
                                        <select id="cboParedAbdominal" runat="server" class="form-control" datavaluefield="idCatalogo" datatextfield="descripcionCatalogo">
                                        </select>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="cboParedAbdominal" ValidationGroup="ControlFetal" CssClass="text-danger" ErrorMessage="El campo es obligatorio" Display="Dynamic" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="cboEstomago" class="col-sm-3 control-label">Estómago</label>
                                    <div class="col-sm-3">
                                        <select id="cboEstomago" runat="server" class="form-control" datavaluefield="idCatalogo" datatextfield="descripcionCatalogo">
                                        </select>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="cboEstomago" ValidationGroup="ControlFetal" CssClass="text-danger" ErrorMessage="El campo es obligatorio" Display="Dynamic" />
                                    </div>
                                    <label for="cboVejigaRinones" class="col-sm-3 control-label">Vejiga/Riñones</label>
                                    <div class="col-sm-3">
                                        <select id="cboVejigaRinones" runat="server" class="form-control" datavaluefield="idCatalogo" datatextfield="descripcionCatalogo">
                                        </select>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="cboVejigaRinones" ValidationGroup="ControlFetal" CssClass="text-danger" ErrorMessage="El campo es obligatorio" Display="Dynamic" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="cboManos" class="col-sm-3 control-label">Manos</label>
                                    <div class="col-sm-3">
                                        <select id="cboManos" runat="server" class="form-control" datavaluefield="idCatalogo" datatextfield="descripcionCatalogo">
                                        </select>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="cboManos" ValidationGroup="ControlFetal" CssClass="text-danger" ErrorMessage="El campo es obligatorio" Display="Dynamic" />
                                    </div>
                                    <label for="cboPies" class="col-sm-3 control-label">Pies</label>
                                    <div class="col-sm-3">
                                        <select id="cboPies" runat="server" class="form-control" datavaluefield="idCatalogo" datatextfield="descripcionCatalogo">
                                        </select>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="cboPies" ValidationGroup="ControlFetal" CssClass="text-danger" ErrorMessage="El campo es obligatorio" Display="Dynamic" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="cboPlacenta" class="col-sm-3 control-label">Placenta</label>
                                    <div class="col-sm-3">
                                        <select id="cboPlacenta" runat="server" class="form-control" datavaluefield="idCatalogo" datatextfield="descripcionCatalogo">
                                        </select>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="cboPlacenta" ValidationGroup="ControlFetal" CssClass="text-danger" ErrorMessage="El campo es obligatorio" Display="Dynamic" />
                                    </div>
                                    <label for="txtComentarios" class="col-sm-3 control-label" style="text-align: left;">Comentarios</label>
                                </div>
                                <div class="col-sm-6" style="padding-left: 0px;">
                                    <div class="form-group">
                                        <label for="cboLiquidoAmniotico" class="col-sm-6 control-label">Líquido amniótico</label>
                                        <div class="col-sm-6">
                                            <select id="cboLiquidoAmniotico" runat="server" class="form-control" datavaluefield="idCatalogo" datatextfield="descripcionCatalogo">
                                            </select>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="cboLiquidoAmniotico" ValidationGroup="ControlFetal" CssClass="text-danger" ErrorMessage="El campo es obligatorio" Display="Dynamic" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="cboCordon" class="col-sm-6 control-label">Cordón</label>
                                        <div class="col-sm-6">
                                            <select id="cboCordon" runat="server" class="form-control" datavaluefield="idCatalogo" datatextfield="descripcionCatalogo">
                                            </select>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="cboCordon" ValidationGroup="ControlFetal" CssClass="text-danger" ErrorMessage="El campo es obligatorio" Display="Dynamic" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="cboInsercionCordon" class="col-sm-6 control-label">Inserción del cordón</label>
                                        <div class="col-sm-6">
                                            <select id="cboInsercionCordon" runat="server" class="form-control" datavaluefield="idCatalogo" datatextfield="descripcionCatalogo">
                                            </select>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="cboInsercionCordon" ValidationGroup="ControlFetal" CssClass="text-danger" ErrorMessage="El campo es obligatorio" Display="Dynamic" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <asp:TextBox ID="txtComentarios" runat="server" TextMode="multiline" Columns="50" Rows="6" CssClass="form-control" Width="100%" placeholder=""></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtComentarios" ValidationGroup="ControlFetal" CssClass="text-danger" ErrorMessage="El campo es obligatorio" Display="Dynamic" />
                                </div>
                                <div class="form-group col-sm-12">
                                    <div class="col-sm-6" style="text-align: right;">
                                        <asp:Button ID="btnGenerarInforme" runat="server" Text="Generar Informe" CssClass="btn btn-primary" CausesValidation="true" ValidationGroup="ControlFetal" />
                                    </div>
                                    <div class="col-sm-6">
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
<asp:Content ID="Content2" ContentPlaceHolderID="PerPageScript" runat="server">
</asp:Content>

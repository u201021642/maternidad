<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="UI._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
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

        function calcularImc(e) {
            var peso = document.getElementById('<%=txtPesoDoppler.ClientID%>').value;
            var estatura = document.getElementById('<%=txtEstatura.ClientID%>').value;
            var imc;
            if (peso && estatura) {
                imc = peso / (estatura * estatura);
            } else {
                imc = 0.0;
            }

            document.getElementById('<%=txtImc.ClientID%>').value = imc;
        }

        function mensajeBioquimica(e) {
            if (Page_ClientValidate("Bioquimica")) {
                alert("Examenes Complementarios Completados Satisfactoriamente");
            }            
        }

        function mensajeDoppler(e) {
            if (Page_ClientValidate("Doppler")) {
                alert("Examenes Complementarios Completados Satisfactoriamente");
            }
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
                        <div class="form-group">
                            <div class="col-sm-8">
                                <h2>Exámenes Complementarios</h2>
                            </div>
                            <div class="col-sm-4">
                                <h4 style="text-align: right; padding-top: 20px;">
                                    <asp:Label runat="server" ID="lblCaso"></asp:Label></h4>
                            </div>
                        </div>
                    </div>

                    <hr />
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#bioquimica" data-toggle="tab">Bioquímica</a>
                        </li>
                        <li><a href="#doppler" data-toggle="tab">Doppler Uterino</a>
                        </li>
                    </ul>

                    <div class="tab-content ">
                        <div class="tab-pane active" id="bioquimica">
                            <div class="form-horizontal" style="margin-top: 20px;">
                                <asp:UpdatePanel runat="server" ID="UpdatePanel" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div class="form-group">
                                            <div class="col-sm-12" style="text-align: left; color: red;">
                                                <span>(*) Todos los Campos son Obligatorios</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtExamen" class="col-sm-3 control-label">Examen N° </label>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txtExamen" runat="server" CssClass="form-control" Width="100%" placeholder="" onkeydown="return jsDecimals(event);"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtExamen" ValidationGroup="Bioquimica" CssClass="text-danger" ErrorMessage="El número de examen es obligatorio" display="Dynamic"/>
                                            </div>
                                            <div class="col-sm-5">
                                                <asp:Button ID="btnResultado" runat="server" Text="Resultado Laboratorio" CssClass="btn btn-primary" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtFechaMuestra" class="col-sm-3 control-label">Fecha de Muestra </label>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txtFechaMuestra" runat="server" CssClass="form-control" Width="100%" placeholder="" TextMode="Date"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFechaMuestra" ValidationGroup="Bioquimica" CssClass="text-danger" ErrorMessage="La fecha de muestra es obligatoria" display="Dynamic"/>
                                            </div>
                                            <div class="col-sm-5">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtGa" class="col-sm-3 control-label">GA por CRL </label>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txtGa" runat="server" CssClass="form-control" Width="100%" placeholder="" onkeydown="return jsDecimals(event);"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtGa" CssClass="text-danger" ValidationGroup="Bioquimica" ErrorMessage="El campo es obligatorio" display="Dynamic"/>
                                            </div>
                                            <div class="col-sm-5">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtPesoMadre" class="col-sm-3 control-label">Peso de la Madre </label>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txtPesoMadre" runat="server" CssClass="form-control" Width="100%" placeholder="" onkeydown="return jsDecimals(event);"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPesoMadre" ValidationGroup="Bioquimica" CssClass="text-danger" ErrorMessage="El campo es obligatorio" display="Dynamic"/>
                                            </div>
                                            <div class="col-sm-5">
                                                <span>Kg</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="cboGrupo" class="col-sm-3 control-label">Grupo Étnico</label>
                                            <div class="col-sm-4">
                                                <select id="cboGrupo" runat="server" class="form-control" datavaluefield="idCatalogo" datatextfield="descripcionCatalogo">
                                                </select>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="cboGrupo" ValidationGroup="Bioquimica" CssClass="text-danger" ErrorMessage="El campo es obligatorio" display="Dynamic"/>
                                            </div>
                                            <div class="col-sm-5">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="cboFumador" class="col-sm-3 control-label">Fumador</label>
                                            <div class="col-sm-4">
                                                <select id="cboFumador" runat="server" class="form-control" datavaluefield="idCatalogo" datatextfield="descripcionCatalogo">
                                                </select>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="cboFumador" ValidationGroup="Bioquimica" CssClass="text-danger" ErrorMessage="El campo es obligatorio" display="Dynamic"/>
                                            </div>
                                            <div class="col-sm-5">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="cboConcepcion" class="col-sm-3 control-label">Concepción</label>
                                            <div class="col-sm-4">
                                                <select id="cboConcepcion" runat="server" class="form-control" datavaluefield="idCatalogo" datatextfield="descripcionCatalogo">
                                                </select>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="cboConcepcion" ValidationGroup="Bioquimica" CssClass="text-danger" ErrorMessage="El campo es obligatorio" display="Dynamic"/>
                                            </div>
                                            <label for="cboOvulacion" class="col-sm-3 control-label">Ovulación Inducida</label>
                                            <div class="col-sm-2">
                                                <select id="cboOvulacion" runat="server" class="form-control" datavaluefield="idCatalogo" datatextfield="descripcionCatalogo">
                                                </select>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="cboOvulacion" ValidationGroup="Bioquimica" CssClass="text-danger" ErrorMessage="El campo es obligatorio" display="Dynamic" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtParidad" class="col-sm-3 control-label">Paridad</label>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txtParidad" runat="server" CssClass="form-control" Width="100%" placeholder="" onkeydown="return jsDecimals(event);"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtParidad" ValidationGroup="Bioquimica" CssClass="text-danger" ErrorMessage="El campo es obligatorio" display="Dynamic"/>
                                            </div>
                                            <div class="col-sm-5">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="cboFumador" class="col-sm-3 control-label">Kit Manufacturador</label>
                                            <div class="col-sm-4">
                                                <select id="cboManufacturador" runat="server" class="form-control" datavaluefield="idCatalogo" datatextfield="descripcionCatalogo">
                                                </select>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="cboManufacturador" ValidationGroup="Bioquimica" CssClass="text-danger" ErrorMessage="El campo es obligatorio" display="Dynamic"/>
                                            </div>
                                            <div class="col-sm-5">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="cboOvulacion" class="col-sm-3 control-label">Fecha de Muestra</label>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txtFechaMuestra2" runat="server" CssClass="form-control" Width="100%" placeholder="" TextMode="Date"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFechaMuestra2" ValidationGroup="Bioquimica" CssClass="text-danger" ErrorMessage="El campo es obligatorio" display="Dynamic"/>
                                            </div>
                                            <div class="col-sm-5">
                                                <span>IU/I</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="cboOvulacion" class="col-sm-3 control-label">GA por CRL</label>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txtGACrl" runat="server" CssClass="form-control" Width="100%" placeholder="" onkeydown="return jsDecimals(event);"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtGACrl" ValidationGroup="Bioquimica" CssClass="text-danger" ErrorMessage="El campo es obligatorio" display="Dynamic"/>
                                            </div>
                                            <div class="col-sm-5">
                                                <span>IU/I</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="cboOvulacion" class="col-sm-3 control-label">PIGF</label>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txtPigf" runat="server" CssClass="form-control" Width="100%" placeholder="" onkeydown="return jsDecimals(event);"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPigf" ValidationGroup="Bioquimica" CssClass="text-danger" ErrorMessage="El campo es obligatorio" display="Dynamic"/>
                                            </div>
                                            <div class="col-sm-5">
                                                <span>pg/I</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-6" style="text-align: right;">
                                                <asp:Button ID="btnEvaluarBioquimica" runat="server" Text="Evaluar Riesgo" CssClass="btn btn-primary"   OnClientClick="return mensajeBioquimica();" CausesValidation="true" ValidationGroup="Bioquimica" />
                                            </div>
                                            <div class="col-sm-6">
                                                <asp:Button ID="btnCancelarBioquimica" runat="server" Text="Cancelar" CssClass="btn btn-primary" />
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <div class="tab-pane" id="doppler">
                            <div class="form-horizontal" style="margin-top: 20px;">
                                <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div class="form-group">
                                            <div class="col-sm-12" style="text-align: left; color: red;">
                                                <span>(*) Todos los Campos son Obligatorios</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtPesoDoppler" class="col-sm-3 control-label">Peso de la Madre</label>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txtPesoDoppler" runat="server" CssClass="form-control" Width="100%" placeholder="" onkeydown="return jsDecimals(event);"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPesoDoppler" CssClass="text-danger" ValidationGroup="Doppler" ErrorMessage="El campo es obligatorio" display="Dynamic"/>
                                            </div>
                                            <div class="col-sm-5">
                                                <span>kg</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtEstatura" class="col-sm-3 control-label">Estatura de la Madre</label>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txtEstatura" runat="server" CssClass="form-control" Width="100%" placeholder="" onkeydown="return jsDecimals(event);" onBlur="return calcularImc(event);"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEstatura" CssClass="text-danger" ValidationGroup="Doppler" ErrorMessage="El campo es obligatorio" display="Dynamic"/>
                                            </div>
                                            <div class="col-sm-5">
                                                <span>cm</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtImc" class="col-sm-3 control-label">IMC</label>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txtImc" runat="server" CssClass="form-control" Width="100%" placeholder="" onkeydown="return jsDecimals(event);" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-5">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtParidadDoppler" class="col-sm-3 control-label">Paridad</label>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="txtParidadDoppler" runat="server" CssClass="form-control" Width="100%" placeholder="" onkeydown="return jsDecimals(event);"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtParidadDoppler" CssClass="text-danger" ValidationGroup="Doppler" ErrorMessage="El campo es obligatorio" display="Dynamic"/>
                                            </div>
                                            <div class="col-sm-5">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="cboGrupoDoppler" class="col-sm-3 control-label">Grupo Étnico</label>
                                            <div class="col-sm-4">
                                                <select id="cboGrupoDoppler" runat="server" class="form-control" datavaluefield="idCatalogo" datatextfield="descripcionCatalogo">
                                                </select>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="cboGrupoDoppler" CssClass="text-danger" ValidationGroup="Doppler" ErrorMessage="El campo es obligatorio" display="Dynamic"/>
                                            </div>
                                            <div class="col-sm-5">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="cboFumadorDoppler" class="col-sm-3 control-label">Fumador</label>
                                            <div class="col-sm-4">
                                                <select id="cboFumadorDoppler" runat="server" class="form-control" datavaluefield="idCatalogo" datatextfield="descripcionCatalogo">
                                                </select>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="cboFumadorDoppler" CssClass="text-danger" ValidationGroup="Doppler" ErrorMessage="El campo es obligatorio" display="Dynamic"/>
                                            </div>
                                            <div class="col-sm-5">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="cboOvulacionDoppler" class="col-sm-3 control-label">Ovulación Inducida</label>
                                            <div class="col-sm-4">
                                                <select id="cboOvulacionDoppler" runat="server" class="form-control" datavaluefield="idCatalogo" datatextfield="descripcionCatalogo">
                                                </select>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="cboOvulacionDoppler" CssClass="text-danger" ValidationGroup="Doppler" ErrorMessage="El campo es obligatorio" display="Dynamic"/>
                                            </div>
                                            <div class="col-sm-5">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="cboHipertension" class="col-sm-3 control-label">Hipertensión crónica</label>
                                            <div class="col-sm-4">
                                                <select id="cboHipertension" runat="server" class="form-control" datavaluefield="idCatalogo" datatextfield="descripcionCatalogo">
                                                </select>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="cboHipertension" CssClass="text-danger" ValidationGroup="Doppler" ErrorMessage="El campo es obligatorio" display="Dynamic"/>
                                            </div>
                                            <div class="col-sm-5">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="cboPrevEmbarazo" class="col-sm-3 control-label">PET en prev.embarazo</label>
                                            <div class="col-sm-4">
                                                <select id="cboPrevEmbarazo" runat="server" class="form-control" datavaluefield="idCatalogo" datatextfield="descripcionCatalogo">
                                                </select>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="cboPrevEmbarazo" CssClass="text-danger" ValidationGroup="Doppler" ErrorMessage="El campo es obligatorio" display="Dynamic"/>
                                            </div>
                                            <div class="col-sm-5">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="cboPetMadre" class="col-sm-3 control-label">PET en madre paciente</label>
                                            <div class="col-sm-4">
                                                <select id="cboPetMadre" runat="server" class="form-control" datavaluefield="idCatalogo" datatextfield="descripcionCatalogo">
                                                </select>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="cboPetMadre" CssClass="text-danger" ValidationGroup="Doppler" ErrorMessage="El campo es obligatorio" display="Dynamic"/>
                                            </div>
                                            <div class="col-sm-5">
                                                <asp:Button ID="btnTransferir" runat="server" Text="Transferir Medidas" CssClass="btn btn-primary" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="pet" class="col-sm-3 control-label">Arteria Uterina</label>
                                            <div class="col-sm-2">
                                                <span>PI izquierdo</span>
                                            </div>
                                            <div class="col-sm-7">
                                                <asp:TextBox ID="txtPiIzquierdo" runat="server" CssClass="form-control" Width="100%" placeholder="" onkeydown="return jsDecimals(event);"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPiIzquierdo" CssClass="text-danger" ValidationGroup="Doppler" ErrorMessage="El campo es obligatorio" display="Dynamic"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="pet" class="col-sm-3 control-label"></label>
                                            <div class="col-sm-2">
                                                <span>PI derecho</span>
                                            </div>
                                            <div class="col-sm-7">
                                                <asp:TextBox ID="txtPiDerecho" runat="server" CssClass="form-control" Width="100%" placeholder="" onkeydown="return jsDecimals(event);"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPiDerecho" CssClass="text-danger" ValidationGroup="Doppler" ErrorMessage="El campo es obligatorio" display="Dynamic"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="pet" class="col-sm-3 control-label"></label>
                                            <div class="col-sm-2">
                                                <span>PI más bajo</span>
                                            </div>
                                            <div class="col-sm-2">
                                                <asp:TextBox ID="txtPiBajo" runat="server" CssClass="form-control" Width="100%" placeholder="" onkeydown="return jsDecimals(event);"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPiBajo" CssClass="text-danger" ValidationGroup="Doppler" ErrorMessage="El campo es obligatorio" display="Dynamic"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="pet" class="col-sm-3 control-label">Presión Arterial Principal</label>
                                            <div class="col-sm-2">
                                                <span>Brazo Izquierdo</span>
                                            </div>
                                            <div class="col-sm-2">
                                                <span>Medidas</span>
                                            </div>
                                            <div class="col-sm-2">
                                                <asp:TextBox ID="txtMedidasMapIzq" runat="server" CssClass="form-control" Width="100%" placeholder="" onkeydown="return jsDecimals(event);"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMedidasMapIzq" CssClass="text-danger" ValidationGroup="Doppler" ErrorMessage="El campo es obligatorio" display="Dynamic"/>
                                            </div>
                                            <div class="col-sm-2">
                                                <span>MAP</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="pet" class="col-sm-3 control-label"></label>
                                            <div class="col-sm-2">
                                                <span>Sístole</span>
                                            </div>
                                            <div class="col-sm-2">
                                                <asp:TextBox ID="txtSistoleIzq" runat="server" CssClass="form-control" Width="100%" placeholder="" onkeydown="return jsDecimals(event);"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtSistoleIzq" CssClass="text-danger" ValidationGroup="Doppler" ErrorMessage="El campo es obligatorio" display="Dynamic"/>
                                            </div>
                                            <div class="col-sm-2">
                                                <span>Diástole</span>
                                            </div>
                                            <div class="col-sm-2">
                                                <asp:TextBox ID="txtDiastoleIzq" runat="server" CssClass="form-control" Width="100%" placeholder="" onkeydown="return jsDecimals(event);"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDiastoleIzq" CssClass="text-danger" ValidationGroup="Doppler" ErrorMessage="El campo es obligatorio" display="Dynamic"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="pet" class="col-sm-3 control-label"></label>
                                            <div class="col-sm-2">
                                                <span>Brazo Derecho</span>
                                            </div>
                                            <div class="col-sm-2">
                                                <span>Medidas</span>
                                            </div>
                                            <div class="col-sm-2">
                                                <asp:TextBox ID="txtMedidasMapDer" runat="server" CssClass="form-control" Width="100%" placeholder="" onkeydown="return jsDecimals(event);"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMedidasMapDer" CssClass="text-danger" ValidationGroup="Doppler" ErrorMessage="El campo es obligatorio" display="Dynamic"/>
                                            </div>
                                            <div class="col-sm-2">
                                                <span>MAP</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="pet" class="col-sm-3 control-label"></label>
                                            <div class="col-sm-2">
                                                <span>Sístole</span>
                                            </div>
                                            <div class="col-sm-2">
                                                <asp:TextBox ID="txtSistoleDer" runat="server" CssClass="form-control" Width="100%" placeholder="" onkeydown="return jsDecimals(event);"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtSistoleDer" CssClass="text-danger" ValidationGroup="Doppler" ErrorMessage="El campo es obligatorio" display="Dynamic"/>
                                            </div>
                                            <div class="col-sm-2">
                                                <span>Diástole</span>
                                            </div>
                                            <div class="col-sm-2">
                                                <asp:TextBox ID="txtDiastoleDer" runat="server" CssClass="form-control" Width="100%" placeholder="" onkeydown="return jsDecimals(event);"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDiastoleDer" CssClass="text-danger" ValidationGroup="Doppler" ErrorMessage="El campo es obligatorio" display="Dynamic"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="pet" class="col-sm-3 control-label"></label>
                                            <div class="col-sm-2">
                                                <span>MAP</span>
                                            </div>
                                            <div class="col-sm-2">
                                                <asp:TextBox ID="txtMap" runat="server" CssClass="form-control" Width="100%" placeholder="" onkeydown="return jsDecimals(event);"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMap" CssClass="text-danger" ValidationGroup="Doppler" ErrorMessage="El campo es obligatorio" display="Dynamic"/>
                                            </div>
                                            <div class="col-sm-2">
                                                <span>mmHg</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-6" style="text-align: right;">
                                                <asp:Button ID="btnEvaluarDoppler" runat="server" Text="Evaluar Riesgo" CssClass="btn btn-primary" OnClientClick="return mensajeDoppler();" CausesValidation="true" ValidationGroup="Doppler" />
                                            </div>
                                            <div class="col-sm-6">
                                                <asp:Button ID="btnCancelarDoppler" runat="server" Text="Cancelar" CssClass="btn btn-primary" />
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</asp:Content>

<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="EvaluarEmbarazoEctopico.aspx.vb" Inherits="UI.EvaluarEmbarazoEctopico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="app-evaluarEmbarazo" class="container">

        {{ getInit(<%= Session("listas") %>) }}
        <div class="row spacer">
            <div class="col-lg-4">
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
                                            <asp:TextBox ID="txtEdad" runat="server" CssClass="form-control" MaxLength="3" Width="100%" placeholder="" value="28" ReadOnly="true"></asp:TextBox>
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
            <div class="col-lg-8">
                <div class="panel panel-default">
                    <div class="panel-body">
                         <div class="row vertical-align">
                            <div class="col-lg-7 ">
                                <p class="h2">Evaluar Embarazo Ectópico</p>
                            </div>
                            <div class="col-lg-5 text-right">
                                <p class="h4"><asp:Label runat="server" ID="lblCaso" >Caso N° FM-0025</asp:Label></p>
                            </div>
                        </div>
                        <div class="spacer"></div>
                        <div class="row vertical-align form-group">           
                            <div class="col-sm-3"><label for="sel1">Test embarazo - orina:</label></div>
                            <div class="col-sm-3">
                                <select class="form-control" id="cboTestEmbarazosOrinas" >
                                    <option value="" selected>Seleccione</option>
                                    <option v-for="item in testEmbarazoOrinas" :value="item.IdCatalogo">{{item.DescripcionCatalogo}}</option>                  
                                </select>
                            </div>
                            <div class="col-sm-3">
                                <button type="button" class="btn btn-primary" @click.stop.prevent="transferirMedidad">Transferir medidas</button>
                            </div>                               
                        </div>
                        <div class="row vertical-align form-group">           
                            <div class="col-sm-3"><label for="sel1">Fecha último período:</label></div>
                            <div class="col-sm-3">
                                <input class="form-control disabled" type="text" value="04/08/2017" disabled/>
                            </div>
                            <div class="col-sm-3">
                                <label for="sel1">Tamaño - ancho:</label>
                            </div>  
                            <div class="col-sm-2">
                                <input class="form-control disabled" type="text" v-model="objEvaluarEmbarazoEctopico.tamanioAncho" disabled />
                            </div>
                            <div class="col-sm-1">
                                mm
                            </div>
                        </div>
                        <div class="row vertical-align form-group">
                            <div class="col-sm-3"><label for="sel1">Localización:</label></div>
                            <div class="col-sm-3">
                                <select class="form-control" id="cboLocalizaciones" >
                                    <option value="" selected>Seleccione</option>
                                    <option v-for="item in localizaciones" :value="item.IdCatalogo">{{item.DescripcionCatalogo}}</option>                  
                                </select>
                            </div>                            
                            <div class="col-sm-3">
                                <label for="sel1">Tamaño - largo:</label>
                            </div>  
                            <div class="col-sm-2">
                                <input class="form-control disabled" type="text" v-model="objEvaluarEmbarazoEctopico.tamanioLargo" disabled />
                            </div>
                            <div class="col-sm-1">
                                mm
                            </div>
                        </div>
                        <div class="row vertical-align form-group">
                            <div class="col-sm-3"><label for="sel1">Morfología:</label></div>
                            <div class="col-sm-3">
                                <select class="form-control" id="cboMorfologias" >
                                    <option value="" selected>Seleccione</option>
                                    <option v-for="item in morfologias" :value="item.IdCatalogo">{{item.DescripcionCatalogo}}</option>                  
                                </select>
                            </div>                            
                            <div class="col-sm-3">
                                <label for="sel1">Tamaño - altura:</label>
                            </div>  
                            <div class="col-sm-2">
                                <input class="form-control disabled" type="text" v-model="objEvaluarEmbarazoEctopico.tamanioAltura" disabled />
                            </div>
                            <div class="col-sm-1">
                                mm
                            </div>
                        </div>
                        <div class="row vertical-align form-group">
                            <div class="col-sm-3"><label for="sel1">Sangrado vaginal:</label></div>
                            <div class="col-sm-3">
                                <select class="form-control" id="cboSangradoVaginales" >
                                    <option value="" selected>Seleccione</option>
                                    <option v-for="item in sangradoVaginales" :value="item.IdCatalogo">{{item.DescripcionCatalogo}}</option>                  
                                </select>
                            </div>                            
                            <div class="col-sm-3">
                                <label for="sel1">Diámetro máximo:</label>
                            </div>  
                            <div class="col-sm-2">
                                <input class="form-control disabled" type="text" v-model="objEvaluarEmbarazoEctopico.diametroMaximo" disabled />
                            </div>
                            <div class="col-sm-1">
                                mm
                            </div>
                        </div>
                        <div class="row vertical-align form-group">
                            <div class="col-sm-3"><label for="sel1">Dolor:</label></div>
                            <div class="col-sm-3">
                                <select class="form-control" id="cboDolores" >
                                    <option value="" selected>Seleccione</option>
                                    <option v-for="item in dolores" :value="item.IdCatalogo">{{item.DescripcionCatalogo}}</option>                  
                                </select>
                            </div>                            
                            <div class="col-sm-3">
                                <label for="sel1">Volúmen:</label>
                            </div>  
                            <div class="col-sm-2">
                                <input class="form-control disabled" type="text" v-model="objEvaluarEmbarazoEctopico.volumen" disabled />
                            </div>
                            <div class="col-sm-1">
                                ml
                            </div>
                        </div>
                        <div class="row vertical-align form-group">
                            <div class="col-sm-3"><label for="sel1">Estructura:</label></div>
                            <div class="col-sm-3">
                                <select class="form-control" id="cboEstructuras" >
                                    <option value="" selected>Seleccione</option>
                                    <option v-for="item in estructuras" :value="item.IdCatalogo">{{item.DescripcionCatalogo}}</option>                  
                                </select>
                            </div>                            
                            <div class="col-sm-3">
                                <label for="sel1">Espesor endometrial:</label>
                            </div>  
                            <div class="col-sm-2">
                                <input class="form-control disabled" type="text" v-model="objEvaluarEmbarazoEctopico.espesorEndometrial" disabled />
                            </div>
                            <div class="col-sm-1">
                                ml
                            </div>
                        </div>
                        <div class="row vertical-align form-group">
                            <div class="col-sm-6 checkbox">
                                <label><input type="checkbox" value="">Muestra de sangre p/ monitorear hCG - PRGT</label>
                            </div>  
                            <div class="col-sm-2">
                                <input class="form-control disabled" type="text" v-model="objEvaluarEmbarazoEctopico.horaHcgPrgt" disabled />
                            </div>
                        </div>
                        <div class="row vertical-align form-group">  
                            <div class="col-sm-3"><label for="sel1">Beta hCG en 0 horas:</label></div>   
                            <div class="col-sm-2">
                                <input class="form-control disabled" type="text" v-model="objEvaluarEmbarazoEctopico.betaHcg0Horas" disabled />
                            </div>
                             <div class="col-sm-1">
                                UI/I
                            </div>
                        </div>
                        <div class="row vertical-align form-group">  
                            <div class="col-sm-3"><label for="sel1">PRGT en 0 horas:</label></div>   
                            <div class="col-sm-2">
                                <input class="form-control disabled" type="text" v-model="objEvaluarEmbarazoEctopico.prgt0Horas" disabled />
                            </div>
                             <div class="col-sm-1">
                                UI/I
                            </div>
                        </div>
                        <div class="row vertical-align form-group">  
                            <div class="col-sm-3"><label for="sel1">Acción a tomar:</label></div>   
                            <div class="col-sm-3">
                                <select class="form-control" id="cboAcciones" >
                                    <option value="" selected>Seleccione</option>
                                    <option v-for="item in acciones" :value="item.IdCatalogo">{{item.DescripcionCatalogo}}</option>                  
                                </select>
                            </div>         
                        </div>
                        <div class="row vertical-align form-group">  
                            <div class="col-sm-3"><label for="sel1">Fecha de muestra 48h:</label></div>   
                            <div class="col-sm-3">                                
                                <%--<div class='input-group date' id='datetimepicker1'>
                                    <input type='text' name="date" class="form-control" />
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>--%>
                                <div class='input-group date' id='datetimepicker6'>
                                    <input type='text' class="form-control" v-model="fechaActual" />
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>                           
                            </div>     
                            <div class="col-sm-3"><label for="sel1">Hora de muestra 48h:</label></div>   
                            <div class="col-sm-3">
                                <input class="form-control disabled" type="text" v-model="objEvaluarEmbarazoEctopico.muestra48Horas" disabled />
                            </div>
                        </div>
                        <div class="row vertical-align form-group">  
                            <div class="col-sm-3"><label for="sel1">Beta hCG en 48 horas:</label></div>   
                            <div class="col-sm-2">
                                 <input class="form-control disabled" type="text" v-model="objEvaluarEmbarazoEctopico.betaHcg48Horas" disabled />
                            </div> 
                            <div class="col-sm-1">
                                UI/I
                            </div>
                        </div>
                        <div class="row vertical-align form-group">  
                            <div class="col-sm-3"><label for="sel1">PRGT en 48 horas:</label></div>   
                            <div class="col-sm-2">
                                 <input class="form-control disabled" type="text" v-model="objEvaluarEmbarazoEctopico.prgt48Horas" disabled />
                            </div>    
                            <div class="col-sm-1">
                                UI/I
                            </div>
                        </div>
                        <div class="row vertical-align form-group">  
                            <div class="col-sm-3"><label for="sel1">Impresión subjetiva:</label></div>   
                            <div class="col-sm-3">
                                <select class="form-control" id="cboImpresiones" >
                                    <option value="" selected>Seleccione</option>
                                    <option v-for="item in impresionSubjetivas" :value="item.IdCatalogo">{{item.DescripcionCatalogo}}</option>                  
                                </select>
                            </div> 
                            <div class="col-sm-3"><label for="sel1">Grado de certeza:</label></div>   
                            <div class="col-sm-3">
                                <select class="form-control" id="cboGradosCertezas" >
                                    <option value="" selected>Seleccione</option>
                                    <option v-for="item in gradosCertezas" :value="item.IdCatalogo">{{item.DescripcionCatalogo}}</option>                  
                                </select>
                            </div>  
                        </div>
                        <div class="row vertical-align form-group">
                            <div class="col-sm-6 checkbox">
                                <label>
                                    <input type="checkbox" value="">Usar modelo predictivo</label>
                            </div>
                            <div class="col-sm-2">
                                <label>Comentarios</label>
                            </div>
                        </div>
                        <div class="row vertical-align form-group top">
                            <div class="col-sm-6">
                                <div class="row">
                                    <div class="form-group col-sm-12">                                         
                                        <label>Probabilidad:</label>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="row vertical-align form-group">
                                            <div class="col-sm-7">
                                                <label>Embarazo ectópico:</label>
                                            </div>
                                            <div class="col-sm-3">
                                               <input class="form-control disabled" type="text" v-model="objEvaluarEmbarazoEctopico.embarazoEctopico" disabled />
                                            </div>
                                            <div class="col-sm-2">
                                               <label>%</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="row vertical-align form-group">
                                            <div class="col-sm-7">
                                                <label>Embarazo intrauterino:</label>
                                            </div>
                                            <div class="col-sm-3">
                                               <input class="form-control disabled" type="text" v-model="objEvaluarEmbarazoEctopico.embarazoIntrauterino" disabled />
                                            </div>
                                            <div class="col-sm-2">
                                               <label>%</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <textarea class="form-control" cols="" rows="">
                                </textarea>
                            </div>                            
                        </div>
                        <div class="row vertical-align form-group">
                            <div class="col-sm-6 text-right">
                                <button type="button" class="btn btn-primary ">Generar Informe</button>
                            </div>
                            <div class="col-sm-6 text-left">
                                <asp:button ID="btnSalir" runat="server" class="btn btn-primary" text="Salir"></asp:button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="../Scripts/viewmodel/EvaluarEmbarazoEctopico.js">        
    </script>
    <script>
        $('#datetimepicker6').datetimepicker(
            {
                format: 'DD/MM/YYYY'
            }
        );
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PerPageScript" runat="server">
</asp:Content>

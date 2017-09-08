<%@ Page Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeBehind="EvaluarRiesgoFetal.aspx.vb" Inherits="UI.EvaluarRiesgoFetal" %>
<%@ Import Namespace="Newtonsoft.Json" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">         
     <div class="container" id="app-evaluar">  
        <% 
            Dim usuario = Session("Usuario")
            Dim serUsuario = JsonConvert.SerializeObject(usuario.empleado, Formatting.Indented)
        %>
        
         {{ getInit(<%= serUsuario %>) }}
                        
        <div class="row spacer">
           <div class="col-lg-4">
                <div class="panel panel-default">                 
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-sm-12" style="text-align: center;">
                                 <asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar Sesión" CssClass="btn btn-default" style="width:100%;"/>
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
                                        <label for="txtCaso" class="col-sm-4">Caso: </label>
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
                                        <label for="txtUsuario" class="col-sm-4">Usuario: </label>
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
                                <p class="h2">Evaluar Riesgo Fetal</p>
                            </div>
                            <div class="col-lg-5 text-right">
                                <p class="h4">Caso N° <asp:Label runat="server" ID="lblCaso" ></asp:Label></p>
                            </div>
                        </div>          
                        <div class="spacer"></div>
                        <div v-show="!camposValidos">
                            <div class="alert alert-danger" role="alert">Por favor corriga los errores</div>
                        </div>
                        <div class="spacer"></div>
                        <div class="row vertical-align form-group">           
                            <div class="col-sm-3">
                                <label for="sel1">Operador FMF:</label>
                            </div>
                            <div class="col-sm-4">
                                <input type="hidden" value="objEvaluacion.IdFMF" />
                                <input class="form-control" type="text" value="" v-model="nombreOperador" disabled /> 
                            </div>
                            <div class="col-sm-2">
                                 <label class="col-form-label" for="txtCodigo">Código FMF:</label>
                            </div>  
                            <div class="col-sm-3">
                                  <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control" Width="100%" placeholder="" ReadOnly="true" v-model="idFmf"></asp:TextBox>
                            </div>                              
                        </div>
                        <div class="spacer-2"></div>
                        <div class="row vertical-align form-group margin-bottom-cero">           
                            <div class="col-sm-3">
                                <label for="sel1">Concepción:</label></div>
                            <div class="col-sm-4 vertical-align">
                                <div class="form-group margin-bottom-cero">
                                    <select class="form-control" id="cboConcepcion" v-model="objEvaluacion.IdConcepcion"
                                        >
                                        <option value="" selected>Seleccione</option>
                                        <option v-for="item in lstConcepciones" :value="item.IdCatalogo">{{item.DescripcionCatalogo}}</option>                  
                                    </select>
                                   <%-- <div v-show="!validation.IdConcepcion" class="label label-danger">Debe seleccionar un concepción</div>--%>
                                     <span v-show="!validation.IdConcepcion" class="text-danger field-validation-error" >Debe seleccionar un concepción</span>
                                </div>                               
                            </div>
                            <div class="col-sm-2">
                                 <label class="col-form-label" for="txtCodigo">Ovulación Inducida:</label>
                            </div>  
                            <div class="col-sm-3 vertical-align">
                                <div class="form-group margin-bottom-cero">
                                    <select class="form-control" id="cboOvulacion" v-model="objEvaluacion.IdCatalogo"> 
                                        <option value="" selected>Seleccione</option>
                                        <option v-for="item in lstOvulacionInducida" :value="item.IdCatalogo">{{item.DescripcionCatalogo}}</option>
                                    </select>
                                   <%-- <div v-show="!validation.IdCatalogo" class="label label-danger">Debe seleccionar una ovulación</div>--%>
                                     <span v-show="!validation.IdCatalogo" class="text-danger field-validation-error">Debe seleccionar una ovulación</span>
                                 </div>
                            </div>                              
                        </div>

                        <div class="row vertical-align form-group">                            
                            <div class="col-sm-6">                             
                                <label><input type="checkbox" value="">Concentimiento informado de paciente</label>
                            </div>
                        </div>
                        <div class="row vertical-align form-group">                         
                            <div class="col-sm-6">
                                <asp:Button ID="btnExamenes" runat="server" Text="Realizar exámenes complementarios" CssClass="btn btn-primary" />
                            </div>
                        </div>
                        <div class="row vertical-align form-group">
                            <div class="col-sm-4 col-lg-2">
                                <label class="col-form-label" for="txtEdadMadre">Edad de la madre:</label>
                            </div>
                             <div class="col-sm-2 col-lg-3 text-left">
                                <input type="text" class="form-control" id="txtEdadMadre" maxlength="3" v-model="objEvaluacion.EdadMadre" v-on:keypress="isNumber">
                            </div>
                            <div class="col-sm-1 col-lg-1 text-left">
                                <p>años</p>
                            </div>
                            <div class="col-sm-3 col-lg-2 text-center">
                                <p>Trisomía 21</p>
                            </div>
                             <div class="col-sm-3 col-lg-2 text-center">
                                <p>Trisomía 18</p>
                            </div>
                             <div class="col-sm-3 col-lg-2 text-center">
                                <p>Trisomía 13</p>
                            </div>
                        </div>
                    
                    
               
                        <div class="row vertical-align form-group">
                            <div class="col-sm-4 col-lg-2">
                                <label class="col-form-label" for="txtEdadMadre">Riesgo de fondo:</label>
                            </div>
                            <div class="col-sm-2 col-lg-3 text-left">               
                            </div>
                            <div class="col-sm-1 col-lg-1 text-left">
                                <p class="">1:</p>
                            </div>
                            <div class="col-sm-3 col-lg-2 text-center">
                                 <input type="text" class="form-control" id="txtRiesgoFondo1" v-model="objEvaluacion.RiesgoFondo_t21">
                            </div>
                             <div class="col-sm-3 col-lg-2 text-center">
                                 <input type="text" class="form-control" id="txtRiesgoFondo2" v-model="objEvaluacion.RiesgoFondo_t18">
                            </div>
                             <div class="col-sm-3 col-lg-2 text-center">
                                 <input type="text" class="form-control" id="txtRiesgoFondo3" v-model="objEvaluacion.RiesgoFondo_t13">
                            </div>
                        </div>
                        <div class="row vertical-align form-group">
                            <div class="col-sm-4 col-lg-2">
                                <label class="col-form-label">Riesgo ajustado:</label>
                            </div>
                            <div class="col-sm-2 col-lg-3 text-left">
                            </div>
                            <div class="col-sm-1 col-lg-1 text-left">
                                <p class="">1:</p>
                            </div>
                            <div class="col-sm-3 col-lg-2 text-center">
                                <input type="text" class="form-control" id="txtRiesgoAjustado1" v-model="objEvaluacion.RiesgoAjustado_t21">
                            </div>
                            <div class="col-sm-3 col-lg-2 text-center">
                                <input type="text" class="form-control" id="txtRiesgoAjustado2" v-model="objEvaluacion.RiesgoAjustado_t18">
                            </div>
                            <div class="col-sm-3 col-lg-2 text-center">
                                <input type="text" class="form-control" id="txtRiesgoAjustado3" v-model="objEvaluacion.RiesgoAjustado_t13">
                            </div>
                        </div>
                        <div class="row vertical-align form-group">
                            <div class="col-sm-3 col-lg-2">
                                <label class="col-form-label">Riesgo p/ preeclampsia:</label>
                            </div>
                            <div class="col-lg-3 text-left">
                                <input type="text" class="form-control" id="txtRiesgoPreeclampsia" v-model="objEvaluacion.RiesgoPreEclampsia">
                            </div>        
                        </div>
                        <div class="row vertical-align form-group">
                            <div class="col-sm-3 col-lg-2">
                                <label class="col-form-label">Riesgo p/ desor.hipert.:</label>
                            </div>
                            <div class="col-lg-3 text-left">
                                <input type="text" class="form-control"  MaxLength="3" id="txtRiesgoDesorden" v-model="objEvaluacion.RiesgoDesorHipert" v-on:keypress="isNumber">
                            </div>
                            <div class="col-lg-1 text-left">
                                <p class="">%</p>
                            </div>
                        </div>
                        <div class="row vertical-align form-group">
                            <div class="col-sm-3 col-lg-2">
                                <label class="col-form-label">Muerte fetal:</label>
                            </div>
                            <div class="col-lg-3 text-left">
                                <input type="text" class="form-control"  MaxLength="3" id="txtMuerteFetal" v-model="objEvaluacion.MuerteFetal" v-on:keypress="isNumber">
                            </div>
                            <div class="col-lg-1 text-left">
                                <p class="">%</p>
                            </div>
                        </div>
                        <div class="row vertical-align form-group top">
                            <div class="col-sm-3 col-lg-2">
                                <label class="col-form-label">Conclusiones:</label>
                            </div>
                             <div class="col-sm-9 col-md-12 col-lg-10 text-right">
                                <textarea class="form-control" cols="5" rows="5" maxlength="450" v-model="objEvaluacion.Conclusiones"></textarea>
                            </div>
                        </div>
                        <div class="row vertical-align form-group top">
                            <div class="col-lg-3 col-xs-offset-3 text-right">
                                <button type="button" class="btn btn-primary btn-block" @click="addNuevaEvaluacion">Generar Informe</button>
                            </div>
                             <div class="col-lg-3 text-left">
                                 <asp:Button ID="btnSalir" runat="server" Text="Salir" CssClass="btn btn-primary" />
                            </div>
                        </div>
                    </div>                    
                </div>
            </div>
        </div>
    </div>   
    <script type="text/javascript" src="../Scripts/viewmodel/EvaluarRiesgoFetal.js">
    
    </script>
</asp:Content>



var vm = new Vue({
    el: '#app-evaluar',
    data: {
        nombre: 'Hola',
        lstOvulacionInducida: [],
        lstOperadores: [],
        lstConcepciones: [],
        nombreOperador: '',
        idOperador: '',
        camposValidos: true,
        idFmf:'',
        objEvaluacion: {            
            IdFMF: '',
            IdCatalogo: '',            
            EdadMadre: '',            
            RiesgoFondo_t21: '',
            RiesgoFondo_t18: '',
            RiesgoFondo_t13: '',
            RiesgoAjustado_t21: '',
            RiesgoAjustado_t18: '',
            RiesgoAjustado_t13: '',
            RiesgoPreEclampsia: '',
            RiesgoDesorHipert: '',
            MuerteFetal: '',
            Conclusiones: '',
            IdConcepcion:''
        },
        
        
    },
    created: function (response) {
        //this.getInit();
        axios.get('api/EvaluarRiesgoFetal')
            .then(response => {
                // JSON responses are automatically parsed.
                this.lstOperadores = response.data.operadores;
                this.lstConcepciones = response.data.concepciones;
                this.lstOvulacionInducida = response.data.ovulaciones;
                this.nombreOperador = response.data.nombreOperador;
                //console.log((response.data))
            })
            .catch(e => {
                //this.errors.push(e)
            })
    },
    methods: {
        getInit: function (data) {
            this.nombreOperador = data.Nombre;    
            this.objEvaluacion.IdFMF = data.Id;
            console.log(data);
            //alert('Entre ' + this.nombreOperador);
        },
        addNuevaEvaluacion: function () {       
            if (this.isValid) {
                axios.post('api/EvaluarRiesgoFetal', this.objEvaluacion, { headers: { 'content-type': 'application/json' } })
                    .then(response => {         
                        this.idFmf = response.data.id;
                        this.downloadFile(response.data.id);
                    })
                    .catch(e => {
                        //this.errors.push(e)
                    })
            }   
            else {
                this.camposValidos = false;
            }
        },
        downloadFile: function (id) {                        
            window.open('/Reportes/ReporteEvaluarRiesgoFetal.aspx' + '?id=' + id, '_blank');
        },
        isNumber: function (evt) {
            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if ((charCode > 31 && (charCode < 48 || charCode > 57)) && charCode !== 46) {
                evt.preventDefault();
            } else {
                return true;
            }
        }
    },
    computed: {
        validation: function () {
            return {
                IdCatalogo: !!this.objEvaluacion.IdCatalogo,
                IdConcepcion: !!this.objEvaluacion.IdConcepcion
            }
        },
        isValid: function () {
            var validation = this.validation
            return Object.keys(validation).every(function (key) {
                return validation[key]
            })
        }
    }
});

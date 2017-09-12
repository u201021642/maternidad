var vm_1 = new Vue({
    el: '#app-evaluarEmbarazo',
    data: {
        testEmbarazoOrinas: [],
        localizaciones: [],
        morfologias: [],
        sangradoVaginales: [],
        dolores: [],
        estructuras: [],
        acciones: [],        
        impresionSubjetivas: [],
        gradosCertezas: [],
        camposValidos: true,
        fechaActual: ''   ,
        objEvaluarEmbarazoEctopico: 
        {            
            fechaUltimoPeriodo: '',
            idTestEmbarazoOrina: '',
            idLocalizacion: '',
            idMorfologia: '',
            idSangradoVaginal: '',
            idDolor: '',
            idEstructura: '',
            idAccionTomar: '',
            idImpresionSubjetiva: '',
            idGradoCerteza: '',
            tamanoAncho: '0-50',
            tamanoLargo: '0-45',
            tamanoAlto: '0-30',
            diametroMaximo: '0-100',
            volumen: '0-30',
            espesorEndometrial: '0-30',
            horaHcgPrgt:'',
            beta_Hcg: '',
            prgt: '',
            muestra48Horas:'',
            beta_Hcg_48h: '',
            prgt_48h: '',
            embarazoEctopico: '0-100',
            embarazoIntrauterino: '0-100',
            comentarios: '',
            fechaMuestra: '',
            fechaUltimoPeriodo: '',
            hcg_prgt: false,
            idCasoPaciente: ''
        }
        
    },
    methods: {
        getInit: function (response) {
                       
            this.testEmbarazoOrinas = response.testEmbarazoOrinas;
            this.localizaciones = response.localizaciones;
            this.morfologias = response.morfologias;
            this.sangradoVaginales = response.sangradoVaginales;
            this.dolores = response.dolores;
            this.estructuras = response.estructuras;
            this.acciones = response.acciones;
            this.impresionSubjetivas = response.impresionSubjetivas;
            this.gradosCertezas = response.gradosCertezas;
            this.objEvaluarEmbarazoEctopico.idCasoPaciente = response.idCaso;
            this.fechaActual = moment(new Date()).format("DD/MM/YYYY");        
        },
        addNuevaEvaluacionEmbarazo: function () {
            if (this.isValid) {
                axios.post('api/EvaluarEmbarazoEctopico', this.objEvaluarEmbarazoEctopico, { headers: { 'content-type': 'application/json' } })
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
            window.open('/Reportes/ReporteEvaluarEmbarazoEctopico.aspx' + '?id=' + id, '_blank');
        }
        ,
        transferirMedidad: function () {                 
            this.objEvaluarEmbarazoEctopico.tamanoAncho = this.randomNumber(0, 50);
            this.objEvaluarEmbarazoEctopico.tamanoLargo = this.randomNumber(0, 45);
            this.objEvaluarEmbarazoEctopico.tamanoAlto = this.randomNumber(0, 30);
            this.objEvaluarEmbarazoEctopico.diametroMaximo = this.randomNumber(0, 100);
            this.objEvaluarEmbarazoEctopico.volumen = this.randomNumber(0, 30);
            this.objEvaluarEmbarazoEctopico.espesorEndometrial = this.randomNumber(0, 30);
            this.objEvaluarEmbarazoEctopico.embarazoEctopico = this.randomNumber(0, 100);
            this.objEvaluarEmbarazoEctopico.embarazoIntrauterino = this.randomNumber(0, 100);
            var horaActual = moment(new Date()).format("hh:mm:ss a");
            this.objEvaluarEmbarazoEctopico.horaHcgPrgt = horaActual;
            this.objEvaluarEmbarazoEctopico.beta_Hcg = horaActual;
            this.objEvaluarEmbarazoEctopico.prgt = horaActual;
            this.objEvaluarEmbarazoEctopico.muestra48Horas = horaActual;
            this.objEvaluarEmbarazoEctopico.beta_Hcg_48h = horaActual;
            this.objEvaluarEmbarazoEctopico.prgt_48h = horaActual;
            this.fechaActual = moment(new Date()).format("DD/MM/YYYY");    
            this.objEvaluarEmbarazoEctopico.fechaMuestra = moment(new Date()).format("DD/MM/YYYY");
            this.objEvaluarEmbarazoEctopico.fechaUltimoPeriodo = moment(new Date()).format("DD/MM/YYYY");            
        },
        randomNumber: function (min,max) {
            var result = Math.floor(Math.random() * (max - 0 + min)) + min;
            return result;
        }
    },
    computed: {
        validation: function () {
            return {
                IdTestEmbarazoOrina: !!this.objEvaluarEmbarazoEctopico.idTestEmbarazoOrina,
                IdLocalizacion: !!this.objEvaluarEmbarazoEctopico.idLocalizacion,
                IdMorfologia: !!this.objEvaluarEmbarazoEctopico.idMorfologia,
                IdSangradoVaginal: !!this.objEvaluarEmbarazoEctopico.idSangradoVaginal,
                IdDolor: !!this.objEvaluarEmbarazoEctopico.idDolor,
                IdEstructura: !!this.objEvaluarEmbarazoEctopico.idEstructura,
                IdAccionTomar: !!this.objEvaluarEmbarazoEctopico.idAccionTomar,
                IdImpresionSubjetiva: !!this.objEvaluarEmbarazoEctopico.idImpresionSubjetiva,
                IdGradoCerteza: !!this.objEvaluarEmbarazoEctopico.idGradoCerteza
            }
        },
        isValid: function () {
            var validation = this.validation
            return Object.keys(validation).every(function (key) {
                return validation[key]
            })
        }
    }
})
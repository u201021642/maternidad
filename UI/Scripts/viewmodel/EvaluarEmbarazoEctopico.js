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
        fechaActual: '',
        objEvaluarEmbarazoEctopico: 
        {
            tamanioAncho: '0-50',
            tamanioLargo: '0-45',
            tamanioAltura: '0-30',
            diametroMaximo: '0-100',
            volumen: '0-30',
            espesorEndometrial: '0-30',
            horaHcgPrgt:'',
            betaHcg0Horas: '',
            prgt0Horas: '',
            muestra48Horas:'',
            betaHcg48Horas: '',
            prgt48Horas: '',
            embarazoEctopico: '0-100',
            embarazoIntrauterino:'0-100'
        }
        
    },
    methods: {
        getInit: function (response) {
            moment.locale("");
            
            this.testEmbarazoOrinas = response.testEmbarazoOrinas;
            this.localizaciones = response.localizaciones;
            this.morfologias = response.morfologias;
            this.sangradoVaginales = response.sangradoVaginales;
            this.dolores = response.dolores;
            this.estructuras = response.estructuras;
            this.acciones = response.acciones;
            this.impresionSubjetivas = response.impresionSubjetivas;
            this.gradosCertezas = response.gradosCertezas;
            
            this.fechaActual = moment(new Date()).format("DD/MM/YYYY")            
        },
        transferirMedidad: function () {
            
            this.objEvaluarEmbarazoEctopico.tamanioAncho = this.randomNumber(0, 50);
            this.objEvaluarEmbarazoEctopico.tamanioLargo = this.randomNumber(0, 45);
            this.objEvaluarEmbarazoEctopico.tamanioAltura = this.randomNumber(0, 30);
            this.objEvaluarEmbarazoEctopico.diametroMaximo = this.randomNumber(0, 100);
            this.objEvaluarEmbarazoEctopico.volumen = this.randomNumber(0, 30);
            this.objEvaluarEmbarazoEctopico.espesorEndometrial = this.randomNumber(0, 30);
            this.objEvaluarEmbarazoEctopico.embarazoEctopico = this.randomNumber(0, 100);
            this.objEvaluarEmbarazoEctopico.embarazoIntrauterino = this.randomNumber(0, 100);
            var horaActual = moment(new Date()).format("hh:mm:ss a");
            this.objEvaluarEmbarazoEctopico.horaHcgPrgt = horaActual;
            this.objEvaluarEmbarazoEctopico.betaHcg0Horas = horaActual;
            this.objEvaluarEmbarazoEctopico.prgt0Horas = horaActual;
            this.objEvaluarEmbarazoEctopico.muestra48Horas = horaActual;
            this.objEvaluarEmbarazoEctopico.betaHcg48Horas = horaActual;
            this.objEvaluarEmbarazoEctopico.prgt48Horas = horaActual;
        },
        randomNumber: function (min,max) {
            var result = Math.floor(Math.random() * (max - 0 + min)) + min;
            return result;
        }
    }
})
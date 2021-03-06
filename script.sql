USE [BD_CLINICA_RP]
GO
CREATE SEQUENCE [dbo].[SQ_CASO] 
 AS [bigint]
 START WITH 67
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE
GO
/****** Object:  Table [dbo].[T_ANTECEDENTES]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_ANTECEDENTES](
	[idAntecedentes] [int] NOT NULL,
	[dscAntecedentes] [varchar](100) NULL,
	[fechaCreacion] [datetime] NULL,
	[idHistoriaClinica] [int] NOT NULL,
 CONSTRAINT [XPKT_ANTECEDENTES] PRIMARY KEY CLUSTERED 
(
	[idAntecedentes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_BIEN]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_BIEN](
	[codBien] [int] NOT NULL,
	[dscBien] [varchar](100) NULL,
	[fecAdquisicion] [datetime] NULL,
 CONSTRAINT [XPKT_BIEN] PRIMARY KEY CLUSTERED 
(
	[codBien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_CASO_PACIENTE]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_CASO_PACIENTE](
	[idCasoPaciente] [int] IDENTITY(1,1) NOT NULL,
	[idPaciente] [int] NOT NULL,
	[idEspecialidad] [int] NOT NULL,
	[idEmpleado] [int] NOT NULL,
	[numeroCaso] [nvarchar](10) NOT NULL DEFAULT (concat('FM-',right('00000'+CONVERT([varchar],NEXT VALUE FOR [SQ_CASO]),(5)))),
	[fechaCaso] [datetime] NOT NULL DEFAULT (getdate()),
 CONSTRAINT [PK_CASO] PRIMARY KEY CLUSTERED 
(
	[idCasoPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_CATALOGO]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_CATALOGO](
	[idCatalogo] [int] IDENTITY(1,1) NOT NULL,
	[codCatalogo] [varchar](150) NULL,
	[descripcionCatalogo] [varchar](150) NULL,
 CONSTRAINT [PK__T_CATALO__C615E0E8E0CCDA87] PRIMARY KEY CLUSTERED 
(
	[idCatalogo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_CONTROL_FETAL]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_CONTROL_FETAL](
	[idControlFetal] [int] IDENTITY(1,1) NOT NULL,
	[rangoFetalCardiaco] [varchar](10) NOT NULL,
	[CRL] [varchar](10) NULL,
	[NTsobreCordon] [varchar](10) NULL,
	[NTdebajoCordon] [varchar](10) NULL,
	[NT] [varchar](10) NULL,
	[BPD] [varchar](10) NULL,
	[HC] [varchar](10) NULL,
	[AC] [varchar](10) NULL,
	[FL] [varchar](10) NULL,
	[anguloFacial] [varchar](10) NULL,
	[comentarios] [varchar](200) NULL,
	[idHallazgos] [int] NOT NULL,
	[idActividadCardiacaFetal] [int] NOT NULL,
	[idGrupoEtnico] [int] NOT NULL,
	[idHuesoNasal] [int] NOT NULL,
	[idTricuspideDoppler] [int] NOT NULL,
	[idVCdoppler] [int] NOT NULL,
	[idCerebro] [int] NOT NULL,
	[idEespina] [int] NOT NULL,
	[idCorazon] [int] NOT NULL,
	[idParedAbdominal] [int] NOT NULL,
	[idEstomago] [int] NOT NULL,
	[idVejiga] [int] NOT NULL,
	[idManos] [int] NOT NULL,
	[idPies] [int] NOT NULL,
	[idPlacenta] [int] NOT NULL,
	[idLiquidoAmniotico] [int] NOT NULL,
	[idCordon] [int] NOT NULL,
	[idInsercionCordon] [int] NOT NULL,
	[idCasoPaciente] [int] NOT NULL DEFAULT ((5)),
PRIMARY KEY CLUSTERED 
(
	[idControlFetal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_EC_BIOQUIMICA]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_EC_BIOQUIMICA](
	[idBioquimica] [int] IDENTITY(1,1) NOT NULL,
	[numeroExamen] [int] NOT NULL,
	[fechaMuestra] [datetime] NOT NULL,
	[GAporCRL] [varchar](50) NOT NULL,
	[pesoMadre] [int] NOT NULL,
	[paridad] [varchar](50) NOT NULL,
	[fechaMuestra_IU] [datetime] NOT NULL,
	[GAporCRL_IU] [varchar](50) NOT NULL,
	[PIGF] [varchar](50) NOT NULL,
	[idGrupoEtnico] [int] NOT NULL DEFAULT ((0)),
	[idFumador] [int] NOT NULL DEFAULT ((0)),
	[idConcepcion] [int] NOT NULL DEFAULT ((0)),
	[idOvulacion] [int] NOT NULL DEFAULT ((0)),
	[idKitManufacturador] [int] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[idBioquimica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_EC_DOPPLER_UTERINO]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_EC_DOPPLER_UTERINO](
	[idDoppler] [int] IDENTITY(1,1) NOT NULL,
	[pesoMadre] [int] NOT NULL,
	[estaturaMadre] [int] NOT NULL,
	[IMC] [varchar](50) NOT NULL,
	[paridad] [varchar](50) NOT NULL,
	[au_Pizquierdo] [varchar](50) NOT NULL,
	[au_Pderecho] [varchar](50) NOT NULL,
	[au_Pbajo] [varchar](50) NOT NULL,
	[pap_brazoIzquierdo_Medidas] [varchar](50) NOT NULL,
	[pap_brazoIzquierdo_sistole] [varchar](50) NOT NULL,
	[pap_brazoIzquierdo_diastole] [varchar](50) NOT NULL,
	[pap_brazoDerecho_Medidas] [varchar](50) NOT NULL,
	[pap_brazoDerecho_sistole] [varchar](50) NOT NULL,
	[pap_brazoDerecho_diastole] [varchar](50) NOT NULL,
	[pap_map] [varchar](50) NOT NULL,
	[idGrupoEtnico] [int] NOT NULL DEFAULT ((0)),
	[idFumador] [int] NOT NULL DEFAULT ((0)),
	[idOvulacion] [int] NOT NULL DEFAULT ((0)),
	[idHipertension] [int] NOT NULL DEFAULT ((0)),
	[idPetEmbarazo] [int] NOT NULL DEFAULT ((0)),
	[idPetMadre] [int] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[idDoppler] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_EMBARAZO_ECTOPICO]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_EMBARAZO_ECTOPICO](
	[idEmbarazoEctopico] [int] IDENTITY(1,1) NOT NULL,
	[idCasoPaciente] [int] NULL,
	[fechaUltimoPeriodo] [datetime] NULL,
	[tamanoAncho] [decimal](5, 2) NULL,
	[tamanoLargo] [decimal](5, 2) NULL,
	[tamanoAlto] [decimal](5, 2) NULL,
	[diametroMaximo] [decimal](5, 2) NULL,
	[volumen] [decimal](5, 2) NULL,
	[espesorEndometrial] [decimal](5, 2) NULL,
	[hCG_PRGT] [varchar](15) NULL,
	[beta_hCG] [varchar](15) NULL,
	[PRGT] [varchar](15) NULL,
	[fechaMuestra] [datetime] NULL,
	[beta_hCG_48h] [varchar](15) NULL,
	[PRGT_48h] [varchar](15) NULL,
	[Comentarios] [varchar](200) NULL,
	[EmbarazoEctopico] [int] NULL,
	[EmbarazoIntrauterino] [int] NULL,
	[idTestEmbarazoOrina] [int] NOT NULL,
	[idLocalizacion] [int] NOT NULL,
	[idMorfologia] [int] NOT NULL,
	[idSangradoVaginal] [int] NOT NULL,
	[idDolor] [int] NOT NULL,
	[idEstructura] [int] NOT NULL,
	[idAccionTomar] [int] NOT NULL,
	[idImpresionSubjetiva] [int] NOT NULL,
	[idGradoCerteza] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idEmbarazoEctopico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_EMPLEADO]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_EMPLEADO](
	[idEmpleado] [int] NOT NULL,
	[nroDni] [int] NULL,
	[nomEmpleado] [varchar](200) NULL,
	[fecIngreso] [datetime] NULL,
	[stdEmplead] [char](3) NULL,
	[dscCargo] [varchar](100) NULL,
	[dscProfesion] [varchar](100) NULL,
	[dscArea] [varchar](100) NULL,
	[dscCorreo] [varchar](100) NULL,
	[idEspecialidad] [int] NULL,
	[codPersona] [int] NULL,
 CONSTRAINT [XPKT_EMPLEADO] PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_EMPRESA]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_EMPRESA](
	[codEmpresa] [int] NOT NULL,
	[nroRuc] [varchar](20) NULL,
	[razonSocial] [varchar](300) NULL,
	[direccion] [varchar](300) NULL,
	[telefono] [varchar](20) NULL,
	[codPersona] [int] NULL,
 CONSTRAINT [XPKT_EMPRESA] PRIMARY KEY CLUSTERED 
(
	[codEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_ESPECIALIDAD_MEDICA]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_ESPECIALIDAD_MEDICA](
	[idEspecialidad] [int] NOT NULL,
	[nomEspecialidad] [varchar](100) NULL,
 CONSTRAINT [XPKT_ESPECIALIDAD_MEDICA] PRIMARY KEY CLUSTERED 
(
	[idEspecialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_EVALUACION_RIESGO_FETAL]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_EVALUACION_RIESGO_FETAL](
	[idRiesgoFetal] [int] IDENTITY(1,1) NOT NULL,
	[idFMF] [int] NOT NULL,
	[idCatalogo] [int] NOT NULL,
	[edadMadre] [int] NOT NULL,
	[riesgoFondo_T21] [varchar](150) NOT NULL,
	[riesgoFondo_T18] [varchar](150) NOT NULL,
	[riesgoFondo_T13] [varchar](150) NOT NULL,
	[riesgoAjustado_T21] [varchar](150) NOT NULL,
	[riesgoAjustado_T18] [varchar](150) NOT NULL,
	[riesgoAjustado_T13] [varchar](150) NOT NULL,
	[riesgoPreEclampsia] [varchar](150) NOT NULL,
	[riesgoDesorHipert] [int] NOT NULL,
	[muerteFetal] [int] NOT NULL,
	[conclusiones] [varchar](450) NOT NULL,
 CONSTRAINT [PK__T_EVALUA__DA9CE57D6911A619] PRIMARY KEY CLUSTERED 
(
	[idRiesgoFetal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_EVALUACION_SIGNOS_VITALES]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_EVALUACION_SIGNOS_VITALES](
	[idEvaluacionSignosVitales] [int] NOT NULL,
	[pulso] [int] NULL,
	[temperatura] [decimal](8, 2) NULL,
	[presionSistolica] [decimal](8, 2) NULL,
	[presionDiastolica] [decimal](8, 2) NULL,
	[idResultadoExamen] [int] NULL,
 CONSTRAINT [XPKT_EVALUACION_] PRIMARY KEY CLUSTERED 
(
	[idEvaluacionSignosVitales] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_EVALUACION_TISS]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_EVALUACION_TISS](
	[idEvaluacionTiss] [int] NOT NULL,
	[definicion] [varchar](100) NULL,
	[puntuacion] [varchar](100) NULL,
	[clase] [varchar](100) NULL,
	[idResultadoExamen] [int] NULL,
 CONSTRAINT [XPKT_] PRIMARY KEY CLUSTERED 
(
	[idEvaluacionTiss] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_EVENTO_HISTORIA_CLINICA]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_EVENTO_HISTORIA_CLINICA](
	[idDetalleHC] [int] NOT NULL,
	[idResultado] [int] NULL,
	[fechaEjecucion] [datetime] NULL,
	[idResultadoExamen] [int] NULL,
	[idHistoriaClinica] [int] NOT NULL,
	[nroHistoriaClinica] [varchar](20) NOT NULL,
	[idPaciente] [int] NOT NULL,
	[tipoEvento] [varchar](50) NULL,
 CONSTRAINT [XPKT_DETALLE_HISTORIA_CLINICA] PRIMARY KEY CLUSTERED 
(
	[idDetalleHC] ASC,
	[idHistoriaClinica] ASC,
	[nroHistoriaClinica] ASC,
	[idPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_EXAMEN_TRATAMIENTO]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_EXAMEN_TRATAMIENTO](
	[idExamenTratamiento] [int] NOT NULL,
	[idTratamiento] [int] NOT NULL,
	[idResultadoExamen] [int] NOT NULL,
 CONSTRAINT [XPKT_EXAMEN_TRATAMIENTO] PRIMARY KEY CLUSTERED 
(
	[idExamenTratamiento] ASC,
	[idTratamiento] ASC,
	[idResultadoExamen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_FMF]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_FMF](
	[idFMF] [int] NOT NULL,
	[idEmpleado] [int] NOT NULL,
	[codPersona] [int] NOT NULL,
	[codFMF]  AS (concat('FMF-',right('0000'+CONVERT([varchar],[codPersona]),(4)))),
PRIMARY KEY CLUSTERED 
(
	[idFMF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_HISTORIA_CLINICA]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_HISTORIA_CLINICA](
	[idHistoriaClinica] [int] NOT NULL,
	[nroHistoriaClinica] [varchar](20) NOT NULL,
	[fechaCreacion] [datetime] NULL,
	[tipoEvento] [varchar](100) NULL,
	[idPaciente] [int] NOT NULL,
 CONSTRAINT [XPKT_HISTORIA_CLINICA] PRIMARY KEY CLUSTERED 
(
	[idHistoriaClinica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_INMUEBLE]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_INMUEBLE](
	[codInmueble] [int] NOT NULL,
	[dscTipoEstado] [varchar](100) NULL,
	[estado] [bit] NULL,
 CONSTRAINT [XPKT_INMUEBLE] PRIMARY KEY CLUSTERED 
(
	[codInmueble] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_MODELO]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_MODELO](
	[codModelo] [int] NOT NULL,
	[nomModelo] [varchar](100) NULL,
	[dscMarca] [varchar](100) NULL,
 CONSTRAINT [XPKT_MODELO] PRIMARY KEY CLUSTERED 
(
	[codModelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_MUEBLE]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_MUEBLE](
	[codMueble] [int] NOT NULL,
	[dscFuncion] [varchar](100) NULL,
	[dscAplicacionMedica] [varchar](100) NULL,
	[garantia] [bit] NULL,
	[tipoMueble] [char](3) NULL,
	[codBien] [int] NULL,
	[codEmpresa] [int] NULL,
	[codModelo] [int] NULL,
 CONSTRAINT [XPKT_MUEBLE] PRIMARY KEY CLUSTERED 
(
	[codMueble] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_ORDEN_ATENCION]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_ORDEN_ATENCION](
	[idAtencion] [int] NOT NULL,
	[fechaInicio] [datetime] NULL,
	[fechaFin] [datetime] NULL,
	[tipoEntregaResultado] [varchar](100) NULL,
	[estado] [char](3) NULL,
	[idReserva] [int] NULL,
 CONSTRAINT [XPKT_ORDEN_ATENCION] PRIMARY KEY CLUSTERED 
(
	[idAtencion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_PACIENTE]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_PACIENTE](
	[idPaciente] [int] NOT NULL,
	[dniPaciente] [varchar](10) NULL,
	[fechNacimiento] [datetime] NULL,
	[segmentacion] [varchar](100) NULL,
	[estado] [char](3) NULL,
	[codPersona] [int] NULL,
	[dscCorreoFamiliar] [varchar](100) NULL,
 CONSTRAINT [XPKT_PACIENTE] PRIMARY KEY CLUSTERED 
(
	[idPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_PERSONA]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_PERSONA](
	[codPersona] [int] NOT NULL,
	[nompersona] [varchar](100) NULL,
 CONSTRAINT [XPKT_PERSONA] PRIMARY KEY CLUSTERED 
(
	[codPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_REGISTRO_UCI]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_REGISTRO_UCI](
	[idRegistro] [int] NOT NULL,
	[fechaIngreso] [datetime] NULL,
	[fechaSalida] [datetime] NULL,
 CONSTRAINT [XPKT_REGISTRO_UCI] PRIMARY KEY CLUSTERED 
(
	[idRegistro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_RESERVA_SERVICIO]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_RESERVA_SERVICIO](
	[idReserva] [int] NOT NULL,
	[fecReserva] [datetime] NULL,
	[tipoAtencion] [varchar](100) NULL,
	[tipoCliente] [varchar](100) NULL,
	[estado] [char](3) NULL,
	[idEmpleado] [int] NULL,
	[idServicio] [int] NULL,
	[idPaciente] [int] NULL,
 CONSTRAINT [XPKT_RESERVA_SERVICIO] PRIMARY KEY CLUSTERED 
(
	[idReserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_RESULTADO_ATENCION]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_RESULTADO_ATENCION](
	[idResultado] [int] NOT NULL,
	[diagnostico] [varchar](100) NULL,
	[tratamiento] [varchar](100) NULL,
	[fecResultado] [datetime] NULL,
	[estado] [char](3) NULL,
	[idAtencion] [int] NULL,
	[idEmpleado] [int] NULL,
 CONSTRAINT [XPKT_RESULTADO_ATENCION] PRIMARY KEY CLUSTERED 
(
	[idResultado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_RESULTADO_EXAMEN]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_RESULTADO_EXAMEN](
	[idResultadoExamen] [int] NOT NULL,
	[fechaExamen] [datetime] NULL,
	[fechaResultado] [datetime] NULL,
	[diagnostico] [varchar](200) NULL,
	[tipoExamen] [varchar](100) NULL,
	[imagenResultado] [image] NULL,
	[idResultado] [int] NULL,
 CONSTRAINT [XPKT_RESULTADO_EXAMEN] PRIMARY KEY CLUSTERED 
(
	[idResultadoExamen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_ROL]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_ROL](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[nombreRol] [varchar](100) NULL,
	[estRol] [char](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_SERVICIO_SALUD]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_SERVICIO_SALUD](
	[idServicio] [int] NOT NULL,
	[tipoServicio] [varchar](100) NULL,
	[nomServicio] [varchar](100) NULL,
	[idEspecialidad] [int] NULL,
 CONSTRAINT [XPKT_SERVICIO_SALUD] PRIMARY KEY CLUSTERED 
(
	[idServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_SOLICITUD_UCI]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_SOLICITUD_UCI](
	[idSolicitud] [int] NOT NULL,
	[fechaSolicitud] [datetime] NULL,
	[observacion] [varchar](50) NULL,
	[estadoSolicitud] [char](3) NULL,
	[gravedadPaciente] [varchar](30) NULL,
	[idPaciente] [int] NULL,
	[numeroSolicitud] [varchar](20) NULL,
	[fechaEvaluacion] [datetime] NULL,
	[tipoTraslado] [varchar](150) NULL,
	[dscMedicinaTraslado] [varchar](100) NULL,
	[tipoEquipoMedico] [varchar](100) NULL,
	[idEmpleado] [int] NULL,
	[idResultado] [int] NULL,
	[idRegistro] [int] NULL,
 CONSTRAINT [XPKT_SOLICITUD_MANTENIMIENTO] PRIMARY KEY CLUSTERED 
(
	[idSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_TRATAMIENTO_UCI]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_TRATAMIENTO_UCI](
	[idTratamiento] [int] IDENTITY(1,1) NOT NULL,
	[fechaTratamiento] [datetime] NULL,
	[resultado] [varchar](200) NULL,
	[observacion] [varchar](200) NULL,
	[medicinaTratamiento] [varchar](200) NULL,
	[frecuencia] [varchar](15) NULL,
	[idSolicitud] [int] NULL,
 CONSTRAINT [XPKT_T_TRATAMIENTO_UCI] PRIMARY KEY CLUSTERED 
(
	[idTratamiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_USUARIO]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_USUARIO](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombreUsuario] [varchar](100) NULL,
	[email] [varchar](200) NULL,
	[contrasena] [varchar](100) NULL,
	[idEmpleado] [int] NULL,
	[EstUsuario] [char](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_USUARIO_ROL]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_USUARIO_ROL](
	[idUsuario] [int] NOT NULL,
	[idRol] [int] NOT NULL,
 CONSTRAINT [PK_T_USUARIO_ROL] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC,
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[BuscarPacientes]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[BuscarPacientes] AS
SELECT	A.[idPaciente] AS [Id], 
		RTRIM(SUBSTRING(B.nompersona,1,CHARINDEX(' ', B.nompersona)-1)) AS [Nombres], 
		RTRIM(SUBSTRING(B.nompersona,CHARINDEX(' ', B.nompersona)+1, LEN(B.nompersona))) AS [Apellidos],
		C.nroHistoriaClinica AS [hc],
		CONVERT(varchar, D.fechaEjecucion, 101) AS [ultima_visita],
		cast(datediff(dd,A.fechNacimiento,GETDATE()) / 365.25 as int) AS [Edad]
FROM	[dbo].[T_PACIENTE] A
INNER JOIN	[dbo].[T_PERSONA] B
ON			A.codPersona = B.codPersona
INNER JOIN	[dbo].[T_HISTORIA_CLINICA] C
ON			A.idPaciente = C.idPaciente
INNER JOIN	[dbo].[T_EVENTO_HISTORIA_CLINICA] D
ON			C.idHistoriaClinica = D.idHistoriaClinica
WHERE		a.idPaciente <> 1



GO
/****** Object:  View [dbo].[OperadorFMF]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[OperadorFMF] AS
SELECT	CONCAT('Dr. ', [nomEmpleado]) AS [Operador FMF],
		[codFMF] AS [Código FMF]
FROM	T_FMF F
INNER JOIN	[dbo].[T_EMPLEADO] E
ON			F.idEmpleado = E.idEmpleado

GO
INSERT [dbo].[T_ANTECEDENTES] ([idAntecedentes], [dscAntecedentes], [fechaCreacion], [idHistoriaClinica]) VALUES (1, N'Familiares con diabetes', CAST(N'2015-04-09 08:40:00.000' AS DateTime), 1)
INSERT [dbo].[T_ANTECEDENTES] ([idAntecedentes], [dscAntecedentes], [fechaCreacion], [idHistoriaClinica]) VALUES (2, N'Familiares con hipertensión', CAST(N'2015-04-09 08:40:00.000' AS DateTime), 1)
INSERT [dbo].[T_ANTECEDENTES] ([idAntecedentes], [dscAntecedentes], [fechaCreacion], [idHistoriaClinica]) VALUES (3, N'Tuberculosis en la infancia', CAST(N'2015-03-09 08:20:00.000' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[T_CASO_PACIENTE] ON 

INSERT [dbo].[T_CASO_PACIENTE] ([idCasoPaciente], [idPaciente], [idEspecialidad], [idEmpleado], [numeroCaso], [fechaCaso]) VALUES (5, 4, 15, 14, N'FM-00064', CAST(N'2017-06-30 10:30:00.000' AS DateTime))
INSERT [dbo].[T_CASO_PACIENTE] ([idCasoPaciente], [idPaciente], [idEspecialidad], [idEmpleado], [numeroCaso], [fechaCaso]) VALUES (6, 5, 15, 14, N'FM-00065', CAST(N'2017-06-28 15:20:00.000' AS DateTime))
INSERT [dbo].[T_CASO_PACIENTE] ([idCasoPaciente], [idPaciente], [idEspecialidad], [idEmpleado], [numeroCaso], [fechaCaso]) VALUES (7, 6, 15, 14, N'FM-00066', CAST(N'2017-06-29 11:50:00.000' AS DateTime))
INSERT [dbo].[T_CASO_PACIENTE] ([idCasoPaciente], [idPaciente], [idEspecialidad], [idEmpleado], [numeroCaso], [fechaCaso]) VALUES (8, 4, 15, 14, N'FM-00067', CAST(N'2017-06-30 09:10:00.000' AS DateTime))
INSERT [dbo].[T_CASO_PACIENTE] ([idCasoPaciente], [idPaciente], [idEspecialidad], [idEmpleado], [numeroCaso], [fechaCaso]) VALUES (9, 4, 11, 11, N'FM-00055', CAST(N'2017-09-04 15:58:48.303' AS DateTime))
INSERT [dbo].[T_CASO_PACIENTE] ([idCasoPaciente], [idPaciente], [idEspecialidad], [idEmpleado], [numeroCaso], [fechaCaso]) VALUES (11, 6, 11, 11, N'FM-00068', CAST(N'2017-09-04 16:01:22.637' AS DateTime))
INSERT [dbo].[T_CASO_PACIENTE] ([idCasoPaciente], [idPaciente], [idEspecialidad], [idEmpleado], [numeroCaso], [fechaCaso]) VALUES (12, 4, 11, 11, N'FM-00069', CAST(N'2017-09-04 16:07:36.037' AS DateTime))
INSERT [dbo].[T_CASO_PACIENTE] ([idCasoPaciente], [idPaciente], [idEspecialidad], [idEmpleado], [numeroCaso], [fechaCaso]) VALUES (13, 6, 11, 11, N'FM-00070', CAST(N'2017-09-04 17:55:41.330' AS DateTime))
INSERT [dbo].[T_CASO_PACIENTE] ([idCasoPaciente], [idPaciente], [idEspecialidad], [idEmpleado], [numeroCaso], [fechaCaso]) VALUES (14, 5, 11, 11, N'FM-00071', CAST(N'2017-09-04 18:07:58.420' AS DateTime))
INSERT [dbo].[T_CASO_PACIENTE] ([idCasoPaciente], [idPaciente], [idEspecialidad], [idEmpleado], [numeroCaso], [fechaCaso]) VALUES (15, 4, 11, 11, N'FM-00072', CAST(N'2017-09-04 18:08:19.473' AS DateTime))
INSERT [dbo].[T_CASO_PACIENTE] ([idCasoPaciente], [idPaciente], [idEspecialidad], [idEmpleado], [numeroCaso], [fechaCaso]) VALUES (16, 4, 11, 11, N'FM-00073', CAST(N'2017-09-06 11:02:51.990' AS DateTime))
SET IDENTITY_INSERT [dbo].[T_CASO_PACIENTE] OFF
SET IDENTITY_INSERT [dbo].[T_CATALOGO] ON 

INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (1, N'Concepcion', N'Espontánea')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (2, N'Concepcion', N'No Espontánea')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (3, N'OvulacionInducida', N'No')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (4, N'OvulacionInducida', N'Si')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (5, N'GrupoEtnico', N'Etnico1')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (6, N'GrupoEtnico', N'Etnico2')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (7, N'GrupoEtnico', N'Etnico3')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (8, N'GrupoEtnico', N'Etnico4')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (9, N'GrupoEtnico', N'Etnico5')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (10, N'Fumador', N'No')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (11, N'Fumador', N'Si')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (12, N'KitManufacturador', N'BRAHMS Krypt')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (13, N'KitManufacturador', N'BRAHMS')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (14, N'HipertensionCronica', N'No')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (15, N'HipertensionCronica', N'Si')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (16, N'PETenPrevEmbarazo', N'No')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (17, N'PETenPrevEmbarazo', N'Si')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (18, N'PETenMadrePaciente', N'No')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (19, N'PETenMadrePaciente', N'Si')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (20, N'Hallazgos', N'Feto vivo')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (21, N'Hallazgos', N'Feto sin vida')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (22, N'ActividadCardiacaFetal', N'Presente')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (23, N'ActividadCardiacaFetal', N'No Presente')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (24, N'HuesoNasal', N'Presente')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (25, N'HuesoNasal', N'No Presente')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (26, N'TricuspideDoppler', N'Normal')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (27, N'TricuspideDoppler', N'Anormal')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (28, N'VCDoppler', N'Normal')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (29, N'VCDoppler', N'Anormal')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (30, N'Cerebro', N'Normal')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (31, N'Cerebro', N'Anormal')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (32, N'Espina', N'Normal')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (33, N'Espina', N'Anormal')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (34, N'Corazon', N'Normal')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (35, N'Corazon', N'Anormal')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (36, N'ParedAbdominal', N'Normal')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (37, N'ParedAbdominal', N'Anormal')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (38, N'Estomago', N'Visible')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (39, N'Estomago', N'No Visible')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (40, N'Vejiga', N'Visible')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (41, N'Vejiga', N'No Visible')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (42, N'Manos', N'Ambas visibles')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (43, N'Manos', N'Derecha visible')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (44, N'Manos', N'Izquierda visible')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (45, N'Pies', N'Ambas visibles')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (46, N'Pies', N'Derecha visible')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (47, N'Pies', N'Izquierda visible')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (48, N'Placenta', N'Alta anterior')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (49, N'Placenta', N'Baja posterior')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (50, N'LiquidoAmniotico', N'Normal')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (51, N'LiquidoAmniotico', N'Anormal')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (52, N'Cordon', N'3 vessels')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (53, N'Cordon', N'2 vessels')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (54, N'InsercionCordon', N'Central')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (55, N'InsercionCordon', N'Derecho')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (56, N'InsercionCordon', N'Izquierdo')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (57, N'TestEmbarazoOrina', N'Positivo')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (58, N'TestEmbarazoOrina', N'Negativo')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (59, N'Localizacion', N'TF derecha')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (60, N'Localizacion', N'TF izquierda')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (61, N'Morfologia', N'Masa no Homg.')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (62, N'Morfologia', N'Masa Homg.')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (63, N'SangradoVaginal', N'Ninguno')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (64, N'SangradoVaginal', N'Presente')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (65, N'Dolor', N'Ninguno')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (66, N'Dolor', N'Presente')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (67, N'Estructura', N'Intacta')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (68, N'Estructura', N'Defectuosa')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (69, N'AccionTomar', N'Repetir en 48h')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (70, N'AccionTomar', N'Repetir en 24h')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (71, N'ImpresionSubjectiva', N'Embarazo Ectop.')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (72, N'ImpresionSubjectiva', N'Embarazo Intra.')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (73, N'GradoCerteza', N'Alto')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (74, N'GradoCerteza', N'Medio')
INSERT [dbo].[T_CATALOGO] ([idCatalogo], [codCatalogo], [descripcionCatalogo]) VALUES (75, N'GradoCerteza', N'Bajo')
SET IDENTITY_INSERT [dbo].[T_CATALOGO] OFF
SET IDENTITY_INSERT [dbo].[T_CONTROL_FETAL] ON 

INSERT [dbo].[T_CONTROL_FETAL] ([idControlFetal], [rangoFetalCardiaco], [CRL], [NTsobreCordon], [NTdebajoCordon], [NT], [BPD], [HC], [AC], [FL], [anguloFacial], [comentarios], [idHallazgos], [idActividadCardiacaFetal], [idGrupoEtnico], [idHuesoNasal], [idTricuspideDoppler], [idVCdoppler], [idCerebro], [idEespina], [idCorazon], [idParedAbdominal], [idEstomago], [idVejiga], [idManos], [idPies], [idPlacenta], [idLiquidoAmniotico], [idCordon], [idInsercionCordon], [idCasoPaciente]) VALUES (1, N'150', N'56', N'61', N'74', N'135', N'36', N'57', N'40', N'20', N'87', N'aaa', 20, 22, 5, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 45, 48, 50, 52, 54, 5)
INSERT [dbo].[T_CONTROL_FETAL] ([idControlFetal], [rangoFetalCardiaco], [CRL], [NTsobreCordon], [NTdebajoCordon], [NT], [BPD], [HC], [AC], [FL], [anguloFacial], [comentarios], [idHallazgos], [idActividadCardiacaFetal], [idGrupoEtnico], [idHuesoNasal], [idTricuspideDoppler], [idVCdoppler], [idCerebro], [idEespina], [idCorazon], [idParedAbdominal], [idEstomago], [idVejiga], [idManos], [idPies], [idPlacenta], [idLiquidoAmniotico], [idCordon], [idInsercionCordon], [idCasoPaciente]) VALUES (2, N'174', N'48', N'134', N'126', N'64', N'20', N'44', N'57', N'17', N'109', N'as', 20, 22, 5, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 45, 48, 50, 52, 54, 16)
INSERT [dbo].[T_CONTROL_FETAL] ([idControlFetal], [rangoFetalCardiaco], [CRL], [NTsobreCordon], [NTdebajoCordon], [NT], [BPD], [HC], [AC], [FL], [anguloFacial], [comentarios], [idHallazgos], [idActividadCardiacaFetal], [idGrupoEtnico], [idHuesoNasal], [idTricuspideDoppler], [idVCdoppler], [idCerebro], [idEespina], [idCorazon], [idParedAbdominal], [idEstomago], [idVejiga], [idManos], [idPies], [idPlacenta], [idLiquidoAmniotico], [idCordon], [idInsercionCordon], [idCasoPaciente]) VALUES (3, N'173', N'51', N'95', N'86', N'57', N'20', N'81', N'43', N'7', N'115', N'aa', 20, 22, 5, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 45, 48, 50, 52, 54, 16)
INSERT [dbo].[T_CONTROL_FETAL] ([idControlFetal], [rangoFetalCardiaco], [CRL], [NTsobreCordon], [NTdebajoCordon], [NT], [BPD], [HC], [AC], [FL], [anguloFacial], [comentarios], [idHallazgos], [idActividadCardiacaFetal], [idGrupoEtnico], [idHuesoNasal], [idTricuspideDoppler], [idVCdoppler], [idCerebro], [idEespina], [idCorazon], [idParedAbdominal], [idEstomago], [idVejiga], [idManos], [idPies], [idPlacenta], [idLiquidoAmniotico], [idCordon], [idInsercionCordon], [idCasoPaciente]) VALUES (4, N'173', N'53', N'77', N'53', N'116', N'1', N'60', N'52', N'16', N'63', N'ww', 20, 22, 5, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 45, 48, 50, 52, 54, 16)
INSERT [dbo].[T_CONTROL_FETAL] ([idControlFetal], [rangoFetalCardiaco], [CRL], [NTsobreCordon], [NTdebajoCordon], [NT], [BPD], [HC], [AC], [FL], [anguloFacial], [comentarios], [idHallazgos], [idActividadCardiacaFetal], [idGrupoEtnico], [idHuesoNasal], [idTricuspideDoppler], [idVCdoppler], [idCerebro], [idEespina], [idCorazon], [idParedAbdominal], [idEstomago], [idVejiga], [idManos], [idPies], [idPlacenta], [idLiquidoAmniotico], [idCordon], [idInsercionCordon], [idCasoPaciente]) VALUES (5, N'171', N'41', N'81', N'104', N'73', N'37', N'84', N'41', N'13', N'73', N'Comentarios acerca del control Fetal
Dos comentarios.', 20, 22, 5, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 45, 48, 50, 52, 54, 16)
INSERT [dbo].[T_CONTROL_FETAL] ([idControlFetal], [rangoFetalCardiaco], [CRL], [NTsobreCordon], [NTdebajoCordon], [NT], [BPD], [HC], [AC], [FL], [anguloFacial], [comentarios], [idHallazgos], [idActividadCardiacaFetal], [idGrupoEtnico], [idHuesoNasal], [idTricuspideDoppler], [idVCdoppler], [idCerebro], [idEespina], [idCorazon], [idParedAbdominal], [idEstomago], [idVejiga], [idManos], [idPies], [idPlacenta], [idLiquidoAmniotico], [idCordon], [idInsercionCordon], [idCasoPaciente]) VALUES (6, N'149', N'58', N'61', N'144', N'110', N'5', N'53', N'48', N'4', N'109', N'Comentarios 1
Comentarios 1
Comentarios 1', 20, 22, 5, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 45, 48, 50, 52, 54, 16)
INSERT [dbo].[T_CONTROL_FETAL] ([idControlFetal], [rangoFetalCardiaco], [CRL], [NTsobreCordon], [NTdebajoCordon], [NT], [BPD], [HC], [AC], [FL], [anguloFacial], [comentarios], [idHallazgos], [idActividadCardiacaFetal], [idGrupoEtnico], [idHuesoNasal], [idTricuspideDoppler], [idVCdoppler], [idCerebro], [idEespina], [idCorazon], [idParedAbdominal], [idEstomago], [idVejiga], [idManos], [idPies], [idPlacenta], [idLiquidoAmniotico], [idCordon], [idInsercionCordon], [idCasoPaciente]) VALUES (7, N'149', N'55', N'106', N'140', N'132', N'6', N'47', N'55', N'19', N'118', N'asas', 20, 22, 5, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 45, 48, 50, 52, 54, 16)
INSERT [dbo].[T_CONTROL_FETAL] ([idControlFetal], [rangoFetalCardiaco], [CRL], [NTsobreCordon], [NTdebajoCordon], [NT], [BPD], [HC], [AC], [FL], [anguloFacial], [comentarios], [idHallazgos], [idActividadCardiacaFetal], [idGrupoEtnico], [idHuesoNasal], [idTricuspideDoppler], [idVCdoppler], [idCerebro], [idEespina], [idCorazon], [idParedAbdominal], [idEstomago], [idVejiga], [idManos], [idPies], [idPlacenta], [idLiquidoAmniotico], [idCordon], [idInsercionCordon], [idCasoPaciente]) VALUES (8, N'168', N'61', N'118', N'115', N'69', N'6', N'85', N'59', N'18', N'72', N'qaaa', 20, 22, 5, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 45, 48, 50, 52, 54, 16)
INSERT [dbo].[T_CONTROL_FETAL] ([idControlFetal], [rangoFetalCardiaco], [CRL], [NTsobreCordon], [NTdebajoCordon], [NT], [BPD], [HC], [AC], [FL], [anguloFacial], [comentarios], [idHallazgos], [idActividadCardiacaFetal], [idGrupoEtnico], [idHuesoNasal], [idTricuspideDoppler], [idVCdoppler], [idCerebro], [idEespina], [idCorazon], [idParedAbdominal], [idEstomago], [idVejiga], [idManos], [idPies], [idPlacenta], [idLiquidoAmniotico], [idCordon], [idInsercionCordon], [idCasoPaciente]) VALUES (9, N'166', N'54', N'55', N'50', N'124', N'29', N'60', N'43', N'8', N'87', N'aa', 20, 22, 5, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 45, 48, 50, 52, 54, 16)
INSERT [dbo].[T_CONTROL_FETAL] ([idControlFetal], [rangoFetalCardiaco], [CRL], [NTsobreCordon], [NTdebajoCordon], [NT], [BPD], [HC], [AC], [FL], [anguloFacial], [comentarios], [idHallazgos], [idActividadCardiacaFetal], [idGrupoEtnico], [idHuesoNasal], [idTricuspideDoppler], [idVCdoppler], [idCerebro], [idEespina], [idCorazon], [idParedAbdominal], [idEstomago], [idVejiga], [idManos], [idPies], [idPlacenta], [idLiquidoAmniotico], [idCordon], [idInsercionCordon], [idCasoPaciente]) VALUES (10, N'129', N'69', N'101', N'149', N'120', N'3', N'76', N'50', N'1', N'90', N'asdsad', 20, 22, 5, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 45, 48, 50, 52, 54, 14)
SET IDENTITY_INSERT [dbo].[T_CONTROL_FETAL] OFF
SET IDENTITY_INSERT [dbo].[T_EC_BIOQUIMICA] ON 

INSERT [dbo].[T_EC_BIOQUIMICA] ([idBioquimica], [numeroExamen], [fechaMuestra], [GAporCRL], [pesoMadre], [paridad], [fechaMuestra_IU], [GAporCRL_IU], [PIGF], [idGrupoEtnico], [idFumador], [idConcepcion], [idOvulacion], [idKitManufacturador]) VALUES (1, 1, CAST(N'2017-09-15 00:00:00.000' AS DateTime), N'77', 34, N'11', CAST(N'2017-09-06 00:00:00.000' AS DateTime), N'23', N'34', 5, 10, 1, 1, 12)
INSERT [dbo].[T_EC_BIOQUIMICA] ([idBioquimica], [numeroExamen], [fechaMuestra], [GAporCRL], [pesoMadre], [paridad], [fechaMuestra_IU], [GAporCRL_IU], [PIGF], [idGrupoEtnico], [idFumador], [idConcepcion], [idOvulacion], [idKitManufacturador]) VALUES (2, 2, CAST(N'2017-09-10 00:00:00.000' AS DateTime), N'0002', 55, N'55', CAST(N'2017-09-08 00:00:00.000' AS DateTime), N'55', N'55', 8, 11, 2, 2, 13)
INSERT [dbo].[T_EC_BIOQUIMICA] ([idBioquimica], [numeroExamen], [fechaMuestra], [GAporCRL], [pesoMadre], [paridad], [fechaMuestra_IU], [GAporCRL_IU], [PIGF], [idGrupoEtnico], [idFumador], [idConcepcion], [idOvulacion], [idKitManufacturador]) VALUES (3, 1, CAST(N'2017-09-05 00:00:00.000' AS DateTime), N'22222', 34, N'11', CAST(N'2017-09-06 00:00:00.000' AS DateTime), N'23', N'34', 5, 10, 1, 1, 12)
INSERT [dbo].[T_EC_BIOQUIMICA] ([idBioquimica], [numeroExamen], [fechaMuestra], [GAporCRL], [pesoMadre], [paridad], [fechaMuestra_IU], [GAporCRL_IU], [PIGF], [idGrupoEtnico], [idFumador], [idConcepcion], [idOvulacion], [idKitManufacturador]) VALUES (4, 4, CAST(N'2017-09-24 00:00:00.000' AS DateTime), N'1000', 1, N'1', CAST(N'2017-09-15 00:00:00.000' AS DateTime), N'121', N'1', 5, 10, 1, 1, 12)
INSERT [dbo].[T_EC_BIOQUIMICA] ([idBioquimica], [numeroExamen], [fechaMuestra], [GAporCRL], [pesoMadre], [paridad], [fechaMuestra_IU], [GAporCRL_IU], [PIGF], [idGrupoEtnico], [idFumador], [idConcepcion], [idOvulacion], [idKitManufacturador]) VALUES (5, 3, CAST(N'2017-09-05 00:00:00.000' AS DateTime), N'2222', 34, N'11', CAST(N'2017-09-06 00:00:00.000' AS DateTime), N'23', N'34', 5, 10, 1, 1, 12)
INSERT [dbo].[T_EC_BIOQUIMICA] ([idBioquimica], [numeroExamen], [fechaMuestra], [GAporCRL], [pesoMadre], [paridad], [fechaMuestra_IU], [GAporCRL_IU], [PIGF], [idGrupoEtnico], [idFumador], [idConcepcion], [idOvulacion], [idKitManufacturador]) VALUES (6, 5, CAST(N'2017-09-05 00:00:00.000' AS DateTime), N'0000', 34, N'11', CAST(N'2017-09-06 00:00:00.000' AS DateTime), N'23', N'34', 5, 10, 1, 1, 12)
SET IDENTITY_INSERT [dbo].[T_EC_BIOQUIMICA] OFF
SET IDENTITY_INSERT [dbo].[T_EC_DOPPLER_UTERINO] ON 

INSERT [dbo].[T_EC_DOPPLER_UTERINO] ([idDoppler], [pesoMadre], [estaturaMadre], [IMC], [paridad], [au_Pizquierdo], [au_Pderecho], [au_Pbajo], [pap_brazoIzquierdo_Medidas], [pap_brazoIzquierdo_sistole], [pap_brazoIzquierdo_diastole], [pap_brazoDerecho_Medidas], [pap_brazoDerecho_sistole], [pap_brazoDerecho_diastole], [pap_map], [idGrupoEtnico], [idFumador], [idOvulacion], [idHipertension], [idPetEmbarazo], [idPetMadre]) VALUES (1, 23, 23, N'0,0434782608695652', N'23', N'95/79', N'121/56', N'95/56', N'139/55', N'139', N'55', N'133/55', N'133', N'55', N'133/55', 5, 10, 3, 14, 16, 18)
INSERT [dbo].[T_EC_DOPPLER_UTERINO] ([idDoppler], [pesoMadre], [estaturaMadre], [IMC], [paridad], [au_Pizquierdo], [au_Pderecho], [au_Pbajo], [pap_brazoIzquierdo_Medidas], [pap_brazoIzquierdo_sistole], [pap_brazoIzquierdo_diastole], [pap_brazoDerecho_Medidas], [pap_brazoDerecho_sistole], [pap_brazoDerecho_diastole], [pap_map], [idGrupoEtnico], [idFumador], [idOvulacion], [idHipertension], [idPetEmbarazo], [idPetMadre]) VALUES (2, 12, 12, N'0,0833333333333333', N'12', N'156/57', N'173/81', N'156/57', N'178/83', N'178', N'83', N'120/81', N'120', N'81', N'120/81', 5, 10, 3, 14, 16, 18)
INSERT [dbo].[T_EC_DOPPLER_UTERINO] ([idDoppler], [pesoMadre], [estaturaMadre], [IMC], [paridad], [au_Pizquierdo], [au_Pderecho], [au_Pbajo], [pap_brazoIzquierdo_Medidas], [pap_brazoIzquierdo_sistole], [pap_brazoIzquierdo_diastole], [pap_brazoDerecho_Medidas], [pap_brazoDerecho_sistole], [pap_brazoDerecho_diastole], [pap_map], [idGrupoEtnico], [idFumador], [idOvulacion], [idHipertension], [idPetEmbarazo], [idPetMadre]) VALUES (3, 12, 33, N'0,0110192837465565', N'23', N'110/80', N'166/66', N'110/66', N'148/59', N'148', N'59', N'174/96', N'174', N'96', N'148/59', 5, 10, 3, 14, 16, 18)
INSERT [dbo].[T_EC_DOPPLER_UTERINO] ([idDoppler], [pesoMadre], [estaturaMadre], [IMC], [paridad], [au_Pizquierdo], [au_Pderecho], [au_Pbajo], [pap_brazoIzquierdo_Medidas], [pap_brazoIzquierdo_sistole], [pap_brazoIzquierdo_diastole], [pap_brazoDerecho_Medidas], [pap_brazoDerecho_sistole], [pap_brazoDerecho_diastole], [pap_map], [idGrupoEtnico], [idFumador], [idOvulacion], [idHipertension], [idPetEmbarazo], [idPetMadre]) VALUES (4, 40, 45, N'0,0197530864197531', N'24', N'168/62', N'109/80', N'109/62', N'113/91', N'113', N'91', N'71/75', N'71', N'75', N'71/75', 5, 10, 3, 14, 16, 18)
INSERT [dbo].[T_EC_DOPPLER_UTERINO] ([idDoppler], [pesoMadre], [estaturaMadre], [IMC], [paridad], [au_Pizquierdo], [au_Pderecho], [au_Pbajo], [pap_brazoIzquierdo_Medidas], [pap_brazoIzquierdo_sistole], [pap_brazoIzquierdo_diastole], [pap_brazoDerecho_Medidas], [pap_brazoDerecho_sistole], [pap_brazoDerecho_diastole], [pap_map], [idGrupoEtnico], [idFumador], [idOvulacion], [idHipertension], [idPetEmbarazo], [idPetMadre]) VALUES (5, 23, 34, N'0,0198961937716263', N'2', N'86/52', N'106/85', N'86/52', N'72/95', N'72', N'95', N'113/91', N'113', N'91', N'72/91', 5, 10, 3, 14, 16, 18)
SET IDENTITY_INSERT [dbo].[T_EC_DOPPLER_UTERINO] OFF
INSERT [dbo].[T_EMPLEADO] ([idEmpleado], [nroDni], [nomEmpleado], [fecIngreso], [stdEmplead], [dscCargo], [dscProfesion], [dscArea], [dscCorreo], [idEspecialidad], [codPersona]) VALUES (1, 47347920, N'Cesar Aldana Montero', CAST(N'2017-04-02 07:58:47.447' AS DateTime), N'ACT', N'Jefe de Mantenimiento', N'Ingeniero Eléctrico', N'Pediatria', N'cesaraldanam@gmail.com', 1, 5)
INSERT [dbo].[T_EMPLEADO] ([idEmpleado], [nroDni], [nomEmpleado], [fecIngreso], [stdEmplead], [dscCargo], [dscProfesion], [dscArea], [dscCorreo], [idEspecialidad], [codPersona]) VALUES (2, 44347423, N'Vicente Martel', CAST(N'2015-12-04 00:00:00.000' AS DateTime), N'ACT', N'Jefe de Mantenimiento', N'Ingeniero Eléctrico', N'Mantenimiento de Equipos Médicos', N'vmartelanaya1@gmail.com', 2, 6)
INSERT [dbo].[T_EMPLEADO] ([idEmpleado], [nroDni], [nomEmpleado], [fecIngreso], [stdEmplead], [dscCargo], [dscProfesion], [dscArea], [dscCorreo], [idEspecialidad], [codPersona]) VALUES (3, 54336425, N'Katherine Aylas', CAST(N'2015-12-04 00:00:00.000' AS DateTime), N'ACT', N'Técnico de Mantenimiento Interno', N'Ingeniero Eléctrico', N'Mantenimiento de Equipos Médicos', N'kaylasaguilar@gmail.com', 3, 7)
INSERT [dbo].[T_EMPLEADO] ([idEmpleado], [nroDni], [nomEmpleado], [fecIngreso], [stdEmplead], [dscCargo], [dscProfesion], [dscArea], [dscCorreo], [idEspecialidad], [codPersona]) VALUES (4, 42578316, N'Frank Chara', CAST(N'2012-05-11 00:00:00.000' AS DateTime), N'ACT', N'Jefe de Mantenimiento', N'Ingeniero Electrico', N'Medicina General', N'chara.20.90@gmail.com', 4, 8)
INSERT [dbo].[T_EMPLEADO] ([idEmpleado], [nroDni], [nomEmpleado], [fecIngreso], [stdEmplead], [dscCargo], [dscProfesion], [dscArea], [dscCorreo], [idEspecialidad], [codPersona]) VALUES (5, 42261235, N'Miguel Ventura', CAST(N'2015-02-10 00:00:00.000' AS DateTime), N'ACT', N'Jefe de Pediatria', N'Médico', N'Pediatria', N'mguel.navarro@gmail.com', 5, 9)
INSERT [dbo].[T_EMPLEADO] ([idEmpleado], [nroDni], [nomEmpleado], [fecIngreso], [stdEmplead], [dscCargo], [dscProfesion], [dscArea], [dscCorreo], [idEspecialidad], [codPersona]) VALUES (6, 31374178, N'Yaqui Soliz', CAST(N'2011-02-11 00:00:00.000' AS DateTime), N'ACT', N'Enfermero', N'Licenciado en Enfermeria', N'Medicina General', N'ysoliz11111@gmail.com', 6, 10)
INSERT [dbo].[T_EMPLEADO] ([idEmpleado], [nroDni], [nomEmpleado], [fecIngreso], [stdEmplead], [dscCargo], [dscProfesion], [dscArea], [dscCorreo], [idEspecialidad], [codPersona]) VALUES (7, 52451238, N'Claudia Paredes', CAST(N'2015-09-07 00:00:00.000' AS DateTime), N'ACT', N'Técnico de Mantenimiento Interno', N'Ingeniero Eléctrico', N'Mantenimiento de Equipos Médicos', N'cparedes888888@gmail.com', 7, 11)
INSERT [dbo].[T_EMPLEADO] ([idEmpleado], [nroDni], [nomEmpleado], [fecIngreso], [stdEmplead], [dscCargo], [dscProfesion], [dscArea], [dscCorreo], [idEspecialidad], [codPersona]) VALUES (8, 42457191, N'Angeli Jimenez', CAST(N'2011-03-10 00:00:00.000' AS DateTime), N'ACT', N'Médico', N'Doctor', N'Cardiología', N'angeli312@gmail.com', 8, 12)
INSERT [dbo].[T_EMPLEADO] ([idEmpleado], [nroDni], [nomEmpleado], [fecIngreso], [stdEmplead], [dscCargo], [dscProfesion], [dscArea], [dscCorreo], [idEspecialidad], [codPersona]) VALUES (9, 41363169, N'Pamela Hernandez', CAST(N'2012-10-04 00:00:00.000' AS DateTime), N'ACT', N'Médico', N'Doctor', N'Mantenimiento de Equipos Médicos', N'pamehernandez312@gmail.com', 9, 13)
INSERT [dbo].[T_EMPLEADO] ([idEmpleado], [nroDni], [nomEmpleado], [fecIngreso], [stdEmplead], [dscCargo], [dscProfesion], [dscArea], [dscCorreo], [idEspecialidad], [codPersona]) VALUES (10, 32464234, N'Rosa Morales', CAST(N'2012-05-13 00:00:00.000' AS DateTime), N'ACT', N'Auxiliar de Mantenimiento', N'Ingeniero Eléctrico', N'Cardiología', N'rosamorales312@gmail.com', 10, 14)
INSERT [dbo].[T_EMPLEADO] ([idEmpleado], [nroDni], [nomEmpleado], [fecIngreso], [stdEmplead], [dscCargo], [dscProfesion], [dscArea], [dscCorreo], [idEspecialidad], [codPersona]) VALUES (11, 42475235, N'Daniel Medina', CAST(N'2012-10-04 00:00:00.000' AS DateTime), N'ACT', N'Auxiliar de Mantenimiento', N'Ingeniero Eléctrico', N'Mantenimiento de Equipos Médicos', N'danielMedina123@gmail.com', 11, 15)
INSERT [dbo].[T_EMPLEADO] ([idEmpleado], [nroDni], [nomEmpleado], [fecIngreso], [stdEmplead], [dscCargo], [dscProfesion], [dscArea], [dscCorreo], [idEspecialidad], [codPersona]) VALUES (12, 42475299, N'Joselyn Rojas', CAST(N'2012-11-06 00:00:00.000' AS DateTime), N'ACT', N'Médico Intensivista', N'Doctor', N'Unidad de Cuidados Intensivos', N'joselynrojas91@gmail.com', 12, 16)
INSERT [dbo].[T_EMPLEADO] ([idEmpleado], [nroDni], [nomEmpleado], [fecIngreso], [stdEmplead], [dscCargo], [dscProfesion], [dscArea], [dscCorreo], [idEspecialidad], [codPersona]) VALUES (13, 46462347, N'Jonathan Bolo', CAST(N'2017-01-01 00:00:00.000' AS DateTime), N'ACT', N'Médico Intensivista', N'Doctor', N'Unidad de Cuidados Intensivos', N'jbolo.des@gmail.com', 13, 17)
INSERT [dbo].[T_EMPLEADO] ([idEmpleado], [nroDni], [nomEmpleado], [fecIngreso], [stdEmplead], [dscCargo], [dscProfesion], [dscArea], [dscCorreo], [idEspecialidad], [codPersona]) VALUES (14, 46474849, N'David Campodónico', CAST(N'2011-01-01 00:00:00.000' AS DateTime), N'ACT', N'Médico', N'Doctor', N'Ginecología', N'dcampordonico@crp.com.pe', 15, 22)
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (1, N'Anatomía Patológica')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (2, N'Anestesiología y Recuperación')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (3, N'Anestesiología Pediátrica')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (4, N'Cardiología')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (5, N'Cardiología Pediátrica')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (6, N'Cirugía General')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (7, N'Cirugía Pediátrica')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (8, N'Cirugía Plástica y Reconstructiva')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (9, N'Cirugía Torácica General')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (10, N'Cirugía Cardiovascular Torácica')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (11, N'Dermatología')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (12, N'Endocrinología')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (13, N'Gastroenterología')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (14, N'Geriatría y Gerontología')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (15, N'Ginecología y Obstetricia')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (16, N'Ginecología Oncológica')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (17, N'Hematología')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (18, N'Hematología Pediátrica')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (19, N'Infectología')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (20, N'Infectología Pediátrica')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (21, N'Inmunología Clínica Médica')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (22, N'Medicina Crítica Pediátrica')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (23, N'Medicina Crítica y Terapia Intensiva')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (24, N'Medicina de Emergencias')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (25, N'Medicina Interna')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (26, N'Medicina Familiar y Comunitaria')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (27, N'Medicina Física y Rehabilitación')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (28, N'Medicina Materno Fetal')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (29, N'Medicina Paliativa')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (30, N'Nefrología')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (31, N'Nefrología Pediátrica')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (32, N'Neonatología')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (33, N'Neumología')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (34, N'Neumología Pediátrica')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (35, N'Neurocirugía')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (36, N'Neurología')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (37, N'Oftalmología')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (38, N'Oftalmología Pediátrica')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (39, N'Oncología Médica')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (40, N'Oncología Quirúrgica')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (41, N'Ortopedia y Traumatología')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (42, N'Ortopedia y Traumatología')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (43, N'Otorrinolaringología')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (44, N'Patología Pediátrica')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (45, N'Pediatría')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (46, N'Psicología Clínica')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (47, N'Psiquiatría')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (48, N'Radiología e Imágenes Médicas')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (49, N'Radioterapia')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (50, N'Reumatología')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (51, N'Urología')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (52, N'Urología Pediátrica')
INSERT [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad], [nomEspecialidad]) VALUES (53, N'Vascular Periférico')
SET IDENTITY_INSERT [dbo].[T_EVALUACION_RIESGO_FETAL] ON 

INSERT [dbo].[T_EVALUACION_RIESGO_FETAL] ([idRiesgoFetal], [idFMF], [idCatalogo], [edadMadre], [riesgoFondo_T21], [riesgoFondo_T18], [riesgoFondo_T13], [riesgoAjustado_T21], [riesgoAjustado_T18], [riesgoAjustado_T13], [riesgoPreEclampsia], [riesgoDesorHipert], [muerteFetal], [conclusiones]) VALUES (1, 1, 4, 34, N'43', N'43', N'3', N'43', N'43', N'3', N'4234', 32, 4, N'23423')
INSERT [dbo].[T_EVALUACION_RIESGO_FETAL] ([idRiesgoFetal], [idFMF], [idCatalogo], [edadMadre], [riesgoFondo_T21], [riesgoFondo_T18], [riesgoFondo_T13], [riesgoAjustado_T21], [riesgoAjustado_T18], [riesgoAjustado_T13], [riesgoPreEclampsia], [riesgoDesorHipert], [muerteFetal], [conclusiones]) VALUES (2, 1, 4, 34, N'43', N'43', N'3', N'43', N'43', N'3', N'4234', 32, 4, N'23423')
INSERT [dbo].[T_EVALUACION_RIESGO_FETAL] ([idRiesgoFetal], [idFMF], [idCatalogo], [edadMadre], [riesgoFondo_T21], [riesgoFondo_T18], [riesgoFondo_T13], [riesgoAjustado_T21], [riesgoAjustado_T18], [riesgoAjustado_T13], [riesgoPreEclampsia], [riesgoDesorHipert], [muerteFetal], [conclusiones]) VALUES (4, 1, 3, 45, N'43', N'5', N'534', N'43', N'5', N'534', N'534', 5, 345, N'5345')
INSERT [dbo].[T_EVALUACION_RIESGO_FETAL] ([idRiesgoFetal], [idFMF], [idCatalogo], [edadMadre], [riesgoFondo_T21], [riesgoFondo_T18], [riesgoFondo_T13], [riesgoAjustado_T21], [riesgoAjustado_T18], [riesgoAjustado_T13], [riesgoPreEclampsia], [riesgoDesorHipert], [muerteFetal], [conclusiones]) VALUES (5, 1, 3, 45, N'43', N'5', N'534', N'43', N'5', N'534', N'534', 5, 345, N'5345')
INSERT [dbo].[T_EVALUACION_RIESGO_FETAL] ([idRiesgoFetal], [idFMF], [idCatalogo], [edadMadre], [riesgoFondo_T21], [riesgoFondo_T18], [riesgoFondo_T13], [riesgoAjustado_T21], [riesgoAjustado_T18], [riesgoAjustado_T13], [riesgoPreEclampsia], [riesgoDesorHipert], [muerteFetal], [conclusiones]) VALUES (6, 1, 4, 45, N'534', N'534', N'534', N'534', N'534', N'534', N'534', 534, 534, N'34534')
INSERT [dbo].[T_EVALUACION_RIESGO_FETAL] ([idRiesgoFetal], [idFMF], [idCatalogo], [edadMadre], [riesgoFondo_T21], [riesgoFondo_T18], [riesgoFondo_T13], [riesgoAjustado_T21], [riesgoAjustado_T18], [riesgoAjustado_T13], [riesgoPreEclampsia], [riesgoDesorHipert], [muerteFetal], [conclusiones]) VALUES (7, 1, 3, 34, N'32', N'34', N'4', N'32', N'34', N'4', N'432', 4, 324, N'234')
INSERT [dbo].[T_EVALUACION_RIESGO_FETAL] ([idRiesgoFetal], [idFMF], [idCatalogo], [edadMadre], [riesgoFondo_T21], [riesgoFondo_T18], [riesgoFondo_T13], [riesgoAjustado_T21], [riesgoAjustado_T18], [riesgoAjustado_T13], [riesgoPreEclampsia], [riesgoDesorHipert], [muerteFetal], [conclusiones]) VALUES (12, 7, 3, 4, N'44', N'4', N'', N'44', N'4', N'', N'4', 4, 4, N'4')
INSERT [dbo].[T_EVALUACION_RIESGO_FETAL] ([idRiesgoFetal], [idFMF], [idCatalogo], [edadMadre], [riesgoFondo_T21], [riesgoFondo_T18], [riesgoFondo_T13], [riesgoAjustado_T21], [riesgoAjustado_T18], [riesgoAjustado_T13], [riesgoPreEclampsia], [riesgoDesorHipert], [muerteFetal], [conclusiones]) VALUES (13, 7, 3, 2, N'2', N'2', N'', N'2', N'2', N'', N'2', 2, 2, N'2')
INSERT [dbo].[T_EVALUACION_RIESGO_FETAL] ([idRiesgoFetal], [idFMF], [idCatalogo], [edadMadre], [riesgoFondo_T21], [riesgoFondo_T18], [riesgoFondo_T13], [riesgoAjustado_T21], [riesgoAjustado_T18], [riesgoAjustado_T13], [riesgoPreEclampsia], [riesgoDesorHipert], [muerteFetal], [conclusiones]) VALUES (14, 7, 3, 2, N'2', N'2', N'', N'2', N'2', N'', N'2', 2, 2, N'2')
SET IDENTITY_INSERT [dbo].[T_EVALUACION_RIESGO_FETAL] OFF
INSERT [dbo].[T_EVALUACION_SIGNOS_VITALES] ([idEvaluacionSignosVitales], [pulso], [temperatura], [presionSistolica], [presionDiastolica], [idResultadoExamen]) VALUES (1, 130, CAST(38.00 AS Decimal(8, 2)), CAST(140.00 AS Decimal(8, 2)), CAST(145.00 AS Decimal(8, 2)), 1)
INSERT [dbo].[T_EVALUACION_SIGNOS_VITALES] ([idEvaluacionSignosVitales], [pulso], [temperatura], [presionSistolica], [presionDiastolica], [idResultadoExamen]) VALUES (2, 130, CAST(39.00 AS Decimal(8, 2)), CAST(140.00 AS Decimal(8, 2)), CAST(145.00 AS Decimal(8, 2)), 2)
INSERT [dbo].[T_EVALUACION_SIGNOS_VITALES] ([idEvaluacionSignosVitales], [pulso], [temperatura], [presionSistolica], [presionDiastolica], [idResultadoExamen]) VALUES (3, 130, CAST(37.00 AS Decimal(8, 2)), CAST(140.00 AS Decimal(8, 2)), CAST(145.00 AS Decimal(8, 2)), 3)
INSERT [dbo].[T_EVALUACION_TISS] ([idEvaluacionTiss], [definicion], [puntuacion], [clase], [idResultadoExamen]) VALUES (1, N'Paro cardiaco o desfibrilación dentro de las 48 hrs', N'4', N'Muy grave', NULL)
INSERT [dbo].[T_EVALUACION_TISS] ([idEvaluacionTiss], [definicion], [puntuacion], [clase], [idResultadoExamen]) VALUES (2, N'Ventilación controlada con o sin PEEP', N'4', N'Muy grave', NULL)
INSERT [dbo].[T_EVALUACION_TISS] ([idEvaluacionTiss], [definicion], [puntuacion], [clase], [idResultadoExamen]) VALUES (3, N'Ventilación controlada con o sin PEEP', N'4', N'Muy grave', NULL)
INSERT [dbo].[T_EVALUACION_TISS] ([idEvaluacionTiss], [definicion], [puntuacion], [clase], [idResultadoExamen]) VALUES (4, N'Ventilación controlada con relajantes musculares continuos o intermitentes', N'4', N'Muy grave', NULL)
INSERT [dbo].[T_EVALUACION_TISS] ([idEvaluacionTiss], [definicion], [puntuacion], [clase], [idResultadoExamen]) VALUES (5, N'Infusión arterial contínua', N'4', N'Muy grave', NULL)
INSERT [dbo].[T_EVALUACION_TISS] ([idEvaluacionTiss], [definicion], [puntuacion], [clase], [idResultadoExamen]) VALUES (6, N'Alimentación endovenosa central', N'3', N'Grave', NULL)
INSERT [dbo].[T_EVALUACION_TISS] ([idEvaluacionTiss], [definicion], [puntuacion], [clase], [idResultadoExamen]) VALUES (7, N'Marcapaso en estado de espera', N'3', N'Grave', NULL)
INSERT [dbo].[T_EVALUACION_TISS] ([idEvaluacionTiss], [definicion], [puntuacion], [clase], [idResultadoExamen]) VALUES (8, N'Drenajes toráxicos', N'3', N'Grave', NULL)
INSERT [dbo].[T_EVALUACION_TISS] ([idEvaluacionTiss], [definicion], [puntuacion], [clase], [idResultadoExamen]) VALUES (9, N'Ventilación mecánica controlada o asistida', N'3', N'Grave', NULL)
INSERT [dbo].[T_EVALUACION_TISS] ([idEvaluacionTiss], [definicion], [puntuacion], [clase], [idResultadoExamen]) VALUES (10, N'CPAP', N'2', N'Grave', NULL)
INSERT [dbo].[T_EVALUACION_TISS] ([idEvaluacionTiss], [definicion], [puntuacion], [clase], [idResultadoExamen]) VALUES (11, N'Medición de presión venosa central', N'2', N'Moderado', NULL)
INSERT [dbo].[T_EVALUACION_TISS] ([idEvaluacionTiss], [definicion], [puntuacion], [clase], [idResultadoExamen]) VALUES (12, N'Catéteres periféricos intravenosos (02)', N'2', N'Moderado', NULL)
INSERT [dbo].[T_EVALUACION_TISS] ([idEvaluacionTiss], [definicion], [puntuacion], [clase], [idResultadoExamen]) VALUES (13, N'Hemodiálisis en paciente estable', N'2', N'Moderado', NULL)
INSERT [dbo].[T_EVALUACION_TISS] ([idEvaluacionTiss], [definicion], [puntuacion], [clase], [idResultadoExamen]) VALUES (14, N'Respiración espontánea por tubo endotraqueal o traqueotomía (Tubo en T o máscara para traqueotomía)', N'2', N'Moderado', NULL)
INSERT [dbo].[T_EVALUACION_TISS] ([idEvaluacionTiss], [definicion], [puntuacion], [clase], [idResultadoExamen]) VALUES (15, N'Alimentación por sonda naso u orogástrica', N'2', N'Moderado', NULL)
INSERT [dbo].[T_EVALUACION_TISS] ([idEvaluacionTiss], [definicion], [puntuacion], [clase], [idResultadoExamen]) VALUES (16, N'Monitoreo de EKG', N'1', N'Leve', NULL)
INSERT [dbo].[T_EVALUACION_TISS] ([idEvaluacionTiss], [definicion], [puntuacion], [clase], [idResultadoExamen]) VALUES (17, N'Signos vitales horarios', N'1', N'Leve', NULL)
INSERT [dbo].[T_EVALUACION_TISS] ([idEvaluacionTiss], [definicion], [puntuacion], [clase], [idResultadoExamen]) VALUES (18, N'Catéter venoso periférico (01)', N'1', N'Leve', NULL)
INSERT [dbo].[T_EVALUACION_TISS] ([idEvaluacionTiss], [definicion], [puntuacion], [clase], [idResultadoExamen]) VALUES (19, N'Anticoagulación terapia crónica', N'1', N'Leve', NULL)
INSERT [dbo].[T_EVALUACION_TISS] ([idEvaluacionTiss], [definicion], [puntuacion], [clase], [idResultadoExamen]) VALUES (20, N'Registro de ingresos y egresos (cada 24 horas)', N'1', N'Leve', NULL)
INSERT [dbo].[T_EVALUACION_TISS] ([idEvaluacionTiss], [definicion], [puntuacion], [clase], [idResultadoExamen]) VALUES (21, N'Exámenes de sangre STAT', N'1', N'Leve', NULL)
INSERT [dbo].[T_EVALUACION_TISS] ([idEvaluacionTiss], [definicion], [puntuacion], [clase], [idResultadoExamen]) VALUES (22, N'Medicación intravenosa programada', N'1', N'Leve', NULL)
INSERT [dbo].[T_EVALUACION_TISS] ([idEvaluacionTiss], [definicion], [puntuacion], [clase], [idResultadoExamen]) VALUES (23, N'Curaciones de rutina', N'1', N'Leve', NULL)
INSERT [dbo].[T_EVALUACION_TISS] ([idEvaluacionTiss], [definicion], [puntuacion], [clase], [idResultadoExamen]) VALUES (24, N'Tracción ortopédica normal', N'1', N'Leve', NULL)
INSERT [dbo].[T_EVALUACION_TISS] ([idEvaluacionTiss], [definicion], [puntuacion], [clase], [idResultadoExamen]) VALUES (25, N'Cuidados de traqueotomía', N'1', N'Leve', NULL)
INSERT [dbo].[T_EVALUACION_TISS] ([idEvaluacionTiss], [definicion], [puntuacion], [clase], [idResultadoExamen]) VALUES (26, N'Úlcera por decúbito', N'1', N'Leve', NULL)
INSERT [dbo].[T_EVALUACION_TISS] ([idEvaluacionTiss], [definicion], [puntuacion], [clase], [idResultadoExamen]) VALUES (27, N'Traqueotomía reciente (menos de 48 horas)', N'2', N'Moderado', NULL)
INSERT [dbo].[T_EVENTO_HISTORIA_CLINICA] ([idDetalleHC], [idResultado], [fechaEjecucion], [idResultadoExamen], [idHistoriaClinica], [nroHistoriaClinica], [idPaciente], [tipoEvento]) VALUES (1, 1, CAST(N'2016-07-03 08:40:00.000' AS DateTime), NULL, 1, N'HC00000001', 1, N'CONSULTA')
INSERT [dbo].[T_EVENTO_HISTORIA_CLINICA] ([idDetalleHC], [idResultado], [fechaEjecucion], [idResultadoExamen], [idHistoriaClinica], [nroHistoriaClinica], [idPaciente], [tipoEvento]) VALUES (2, 2, CAST(N'2016-08-03 08:40:00.000' AS DateTime), NULL, 1, N'HC00000001', 2, N'CONSULTA')
INSERT [dbo].[T_EVENTO_HISTORIA_CLINICA] ([idDetalleHC], [idResultado], [fechaEjecucion], [idResultadoExamen], [idHistoriaClinica], [nroHistoriaClinica], [idPaciente], [tipoEvento]) VALUES (3, 3, CAST(N'2016-09-03 08:40:00.000' AS DateTime), NULL, 1, N'HC00000001', 3, N'CONSULTA')
INSERT [dbo].[T_EVENTO_HISTORIA_CLINICA] ([idDetalleHC], [idResultado], [fechaEjecucion], [idResultadoExamen], [idHistoriaClinica], [nroHistoriaClinica], [idPaciente], [tipoEvento]) VALUES (4, 4, CAST(N'2015-06-06 00:00:00.000' AS DateTime), NULL, 4, N'HC00000004', 4, N'CONSULTA')
INSERT [dbo].[T_EVENTO_HISTORIA_CLINICA] ([idDetalleHC], [idResultado], [fechaEjecucion], [idResultadoExamen], [idHistoriaClinica], [nroHistoriaClinica], [idPaciente], [tipoEvento]) VALUES (5, 5, CAST(N'2014-02-13 00:00:00.000' AS DateTime), NULL, 5, N'HC00000005', 5, N'CONSULTA')
INSERT [dbo].[T_EVENTO_HISTORIA_CLINICA] ([idDetalleHC], [idResultado], [fechaEjecucion], [idResultadoExamen], [idHistoriaClinica], [nroHistoriaClinica], [idPaciente], [tipoEvento]) VALUES (6, 6, CAST(N'2016-10-04 00:00:00.000' AS DateTime), NULL, 6, N'HC00000006', 6, N'CONSULTA')
INSERT [dbo].[T_FMF] ([idFMF], [idEmpleado], [codPersona]) VALUES (1, 14, 22)
INSERT [dbo].[T_FMF] ([idFMF], [idEmpleado], [codPersona]) VALUES (2, 5, 9)
INSERT [dbo].[T_FMF] ([idFMF], [idEmpleado], [codPersona]) VALUES (3, 8, 12)
INSERT [dbo].[T_FMF] ([idFMF], [idEmpleado], [codPersona]) VALUES (4, 9, 13)
INSERT [dbo].[T_FMF] ([idFMF], [idEmpleado], [codPersona]) VALUES (5, 12, 16)
INSERT [dbo].[T_FMF] ([idFMF], [idEmpleado], [codPersona]) VALUES (6, 13, 17)
INSERT [dbo].[T_FMF] ([idFMF], [idEmpleado], [codPersona]) VALUES (7, 11, 15)
INSERT [dbo].[T_FMF] ([idFMF], [idEmpleado], [codPersona]) VALUES (8, 1, 5)
INSERT [dbo].[T_FMF] ([idFMF], [idEmpleado], [codPersona]) VALUES (9, 3, 7)
INSERT [dbo].[T_FMF] ([idFMF], [idEmpleado], [codPersona]) VALUES (10, 10, 14)
INSERT [dbo].[T_HISTORIA_CLINICA] ([idHistoriaClinica], [nroHistoriaClinica], [fechaCreacion], [tipoEvento], [idPaciente]) VALUES (1, N'HC00000001', CAST(N'2015-04-09 08:40:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[T_HISTORIA_CLINICA] ([idHistoriaClinica], [nroHistoriaClinica], [fechaCreacion], [tipoEvento], [idPaciente]) VALUES (2, N'HC00000002', CAST(N'2015-03-09 08:20:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[T_HISTORIA_CLINICA] ([idHistoriaClinica], [nroHistoriaClinica], [fechaCreacion], [tipoEvento], [idPaciente]) VALUES (3, N'HC00000003', CAST(N'2015-08-09 15:16:00.000' AS DateTime), NULL, 3)
INSERT [dbo].[T_HISTORIA_CLINICA] ([idHistoriaClinica], [nroHistoriaClinica], [fechaCreacion], [tipoEvento], [idPaciente]) VALUES (4, N'HC00000004', CAST(N'2015-01-04 00:00:00.000' AS DateTime), NULL, 4)
INSERT [dbo].[T_HISTORIA_CLINICA] ([idHistoriaClinica], [nroHistoriaClinica], [fechaCreacion], [tipoEvento], [idPaciente]) VALUES (5, N'HC00000005', CAST(N'2015-05-10 00:00:00.000' AS DateTime), NULL, 5)
INSERT [dbo].[T_HISTORIA_CLINICA] ([idHistoriaClinica], [nroHistoriaClinica], [fechaCreacion], [tipoEvento], [idPaciente]) VALUES (6, N'HC00000006', CAST(N'2015-06-04 00:00:00.000' AS DateTime), NULL, 6)
INSERT [dbo].[T_ORDEN_ATENCION] ([idAtencion], [fechaInicio], [fechaFin], [tipoEntregaResultado], [estado], [idReserva]) VALUES (1, CAST(N'2016-07-01 07:40:00.000' AS DateTime), CAST(N'2016-07-01 08:40:00.000' AS DateTime), N'ACT', N'   ', 1)
INSERT [dbo].[T_ORDEN_ATENCION] ([idAtencion], [fechaInicio], [fechaFin], [tipoEntregaResultado], [estado], [idReserva]) VALUES (2, CAST(N'2016-08-02 07:40:00.000' AS DateTime), CAST(N'2016-08-02 08:40:00.000' AS DateTime), N'ACT', N'   ', 2)
INSERT [dbo].[T_ORDEN_ATENCION] ([idAtencion], [fechaInicio], [fechaFin], [tipoEntregaResultado], [estado], [idReserva]) VALUES (3, CAST(N'2016-09-03 07:40:00.000' AS DateTime), CAST(N'2016-09-03 08:40:00.000' AS DateTime), N'ACT', N'   ', 3)
INSERT [dbo].[T_ORDEN_ATENCION] ([idAtencion], [fechaInicio], [fechaFin], [tipoEntregaResultado], [estado], [idReserva]) VALUES (4, CAST(N'2016-10-04 09:00:00.000' AS DateTime), CAST(N'2016-10-04 09:30:00.000' AS DateTime), N'ACT', N'   ', 4)
INSERT [dbo].[T_ORDEN_ATENCION] ([idAtencion], [fechaInicio], [fechaFin], [tipoEntregaResultado], [estado], [idReserva]) VALUES (5, CAST(N'2016-11-04 09:30:00.000' AS DateTime), CAST(N'2016-11-04 10:00:00.000' AS DateTime), N'ACT', N'   ', 5)
INSERT [dbo].[T_ORDEN_ATENCION] ([idAtencion], [fechaInicio], [fechaFin], [tipoEntregaResultado], [estado], [idReserva]) VALUES (6, CAST(N'2016-12-04 00:00:00.000' AS DateTime), CAST(N'2016-12-04 00:00:00.000' AS DateTime), N'ACT', N'   ', 6)
INSERT [dbo].[T_PACIENTE] ([idPaciente], [dniPaciente], [fechNacimiento], [segmentacion], [estado], [codPersona], [dscCorreoFamiliar]) VALUES (1, N'46462347', CAST(N'1990-12-08 00:00:00.000' AS DateTime), N'A', N'ACT', 16, N'modulouci@gmail.com')
INSERT [dbo].[T_PACIENTE] ([idPaciente], [dniPaciente], [fechNacimiento], [segmentacion], [estado], [codPersona], [dscCorreoFamiliar]) VALUES (2, N'46462452', CAST(N'1991-05-17 00:00:00.000' AS DateTime), N'A', N'ACT', 17, N'modulouci@gmail.com')
INSERT [dbo].[T_PACIENTE] ([idPaciente], [dniPaciente], [fechNacimiento], [segmentacion], [estado], [codPersona], [dscCorreoFamiliar]) VALUES (3, N'46462999', CAST(N'1989-11-11 00:00:00.000' AS DateTime), N'A', N'ACT', 18, N'modulouci@gmail.com')
INSERT [dbo].[T_PACIENTE] ([idPaciente], [dniPaciente], [fechNacimiento], [segmentacion], [estado], [codPersona], [dscCorreoFamiliar]) VALUES (4, N'45640359', CAST(N'1989-03-23 00:00:00.000' AS DateTime), N'A', N'ACT', 19, N'klaurel@gmail.com')
INSERT [dbo].[T_PACIENTE] ([idPaciente], [dniPaciente], [fechNacimiento], [segmentacion], [estado], [codPersona], [dscCorreoFamiliar]) VALUES (5, N'46462526', CAST(N'1990-01-10 00:00:00.000' AS DateTime), N'A', N'ACT', 20, N'kgonazales@gmail.com')
INSERT [dbo].[T_PACIENTE] ([idPaciente], [dniPaciente], [fechNacimiento], [segmentacion], [estado], [codPersona], [dscCorreoFamiliar]) VALUES (6, N'46462728', CAST(N'1991-05-16 00:00:00.000' AS DateTime), N'A', N'ACT', 21, N'manyosa@gmail.com')
INSERT [dbo].[T_PERSONA] ([codPersona], [nompersona]) VALUES (1, N'Proveedores Juanita SAC')
INSERT [dbo].[T_PERSONA] ([codPersona], [nompersona]) VALUES (2, N'Proveedores Cesar SAC')
INSERT [dbo].[T_PERSONA] ([codPersona], [nompersona]) VALUES (3, N'Proveedores Martel SAC')
INSERT [dbo].[T_PERSONA] ([codPersona], [nompersona]) VALUES (4, N'Expertos en Mantenimiento de Equipos Médicos SAC')
INSERT [dbo].[T_PERSONA] ([codPersona], [nompersona]) VALUES (5, N'Cesar Aldana Montero')
INSERT [dbo].[T_PERSONA] ([codPersona], [nompersona]) VALUES (6, N'Vicente Martel')
INSERT [dbo].[T_PERSONA] ([codPersona], [nompersona]) VALUES (7, N'Katherine Aylas')
INSERT [dbo].[T_PERSONA] ([codPersona], [nompersona]) VALUES (8, N'Frank Chara')
INSERT [dbo].[T_PERSONA] ([codPersona], [nompersona]) VALUES (9, N'Miguel Ventura')
INSERT [dbo].[T_PERSONA] ([codPersona], [nompersona]) VALUES (10, N'Yaqui Soliz')
INSERT [dbo].[T_PERSONA] ([codPersona], [nompersona]) VALUES (11, N'Claudia Paredes')
INSERT [dbo].[T_PERSONA] ([codPersona], [nompersona]) VALUES (12, N'Angeli Jimenez')
INSERT [dbo].[T_PERSONA] ([codPersona], [nompersona]) VALUES (13, N'Pamela Hernandez')
INSERT [dbo].[T_PERSONA] ([codPersona], [nompersona]) VALUES (14, N'Rosa Morales')
INSERT [dbo].[T_PERSONA] ([codPersona], [nompersona]) VALUES (15, N'Daniel Medina')
INSERT [dbo].[T_PERSONA] ([codPersona], [nompersona]) VALUES (16, N'Joselyn Rojas')
INSERT [dbo].[T_PERSONA] ([codPersona], [nompersona]) VALUES (17, N'Jonathan Bolo')
INSERT [dbo].[T_PERSONA] ([codPersona], [nompersona]) VALUES (18, N'Erika Abregu')
INSERT [dbo].[T_PERSONA] ([codPersona], [nompersona]) VALUES (19, N'Katherine Laurel Diaz')
INSERT [dbo].[T_PERSONA] ([codPersona], [nompersona]) VALUES (20, N'Kathiuska Gonzales Perez')
INSERT [dbo].[T_PERSONA] ([codPersona], [nompersona]) VALUES (21, N'Margarita Anyosa Cisneros')
INSERT [dbo].[T_PERSONA] ([codPersona], [nompersona]) VALUES (22, N'David Campodónico')
INSERT [dbo].[T_RESERVA_SERVICIO] ([idReserva], [fecReserva], [tipoAtencion], [tipoCliente], [estado], [idEmpleado], [idServicio], [idPaciente]) VALUES (1, CAST(N'2016-01-04 00:00:00.000' AS DateTime), N'Ambulatoria', N'Asegurado', N'ACT', 12, 7, 1)
INSERT [dbo].[T_RESERVA_SERVICIO] ([idReserva], [fecReserva], [tipoAtencion], [tipoCliente], [estado], [idEmpleado], [idServicio], [idPaciente]) VALUES (2, CAST(N'2016-02-05 00:00:00.000' AS DateTime), N'Ambulatoria', N'Asegurado', N'ACT', 12, 7, 2)
INSERT [dbo].[T_RESERVA_SERVICIO] ([idReserva], [fecReserva], [tipoAtencion], [tipoCliente], [estado], [idEmpleado], [idServicio], [idPaciente]) VALUES (3, CAST(N'2016-03-06 00:00:00.000' AS DateTime), N'Ambulatoria', N'Asegurado', N'ACT', 12, 7, 3)
INSERT [dbo].[T_RESERVA_SERVICIO] ([idReserva], [fecReserva], [tipoAtencion], [tipoCliente], [estado], [idEmpleado], [idServicio], [idPaciente]) VALUES (4, CAST(N'2016-04-05 00:00:00.000' AS DateTime), N'Ambulatoria', N'Asegurado', N'ACT', 14, 8, 4)
INSERT [dbo].[T_RESERVA_SERVICIO] ([idReserva], [fecReserva], [tipoAtencion], [tipoCliente], [estado], [idEmpleado], [idServicio], [idPaciente]) VALUES (5, CAST(N'2016-05-04 00:00:00.000' AS DateTime), N'Ambulatoria', N'Asegurado', N'ACT', 14, 8, 5)
INSERT [dbo].[T_RESERVA_SERVICIO] ([idReserva], [fecReserva], [tipoAtencion], [tipoCliente], [estado], [idEmpleado], [idServicio], [idPaciente]) VALUES (6, CAST(N'2016-03-07 00:00:00.000' AS DateTime), N'Ambulatoria', N'Asegurado', N'ACT', 14, 8, 6)
INSERT [dbo].[T_RESULTADO_ATENCION] ([idResultado], [diagnostico], [tratamiento], [fecResultado], [estado], [idAtencion], [idEmpleado]) VALUES (1, N'Asma Bronquial', N'Uso de inhalador', CAST(N'2016-07-03 08:40:00.000' AS DateTime), N'ACT', 1, 12)
INSERT [dbo].[T_RESULTADO_ATENCION] ([idResultado], [diagnostico], [tratamiento], [fecResultado], [estado], [idAtencion], [idEmpleado]) VALUES (2, N'Faringitis', N'Amoxicilina + acido Clavulanico', CAST(N'2016-08-03 08:40:00.000' AS DateTime), N'ACT', 2, 12)
INSERT [dbo].[T_RESULTADO_ATENCION] ([idResultado], [diagnostico], [tratamiento], [fecResultado], [estado], [idAtencion], [idEmpleado]) VALUES (3, N'Neumonia bronquila', N'Penicilina 1mill', CAST(N'2016-09-03 08:40:00.000' AS DateTime), N'ACT', 3, 12)
INSERT [dbo].[T_RESULTADO_ATENCION] ([idResultado], [diagnostico], [tratamiento], [fecResultado], [estado], [idAtencion], [idEmpleado]) VALUES (4, N'Control Fetal', N'Alimentación blanda', CAST(N'2016-10-04 00:00:00.000' AS DateTime), N'ACT', 4, 14)
INSERT [dbo].[T_RESULTADO_ATENCION] ([idResultado], [diagnostico], [tratamiento], [fecResultado], [estado], [idAtencion], [idEmpleado]) VALUES (5, N'Control Fetal', N'Alimentación blanda', CAST(N'2016-10-04 00:00:00.000' AS DateTime), N'ACT', 5, 14)
INSERT [dbo].[T_RESULTADO_ATENCION] ([idResultado], [diagnostico], [tratamiento], [fecResultado], [estado], [idAtencion], [idEmpleado]) VALUES (6, N'Control Fetal', N'Alimentación blanda', CAST(N'2016-10-04 00:00:00.000' AS DateTime), N'ACT', 6, 14)
INSERT [dbo].[T_RESULTADO_EXAMEN] ([idResultadoExamen], [fechaExamen], [fechaResultado], [diagnostico], [tipoExamen], [imagenResultado], [idResultado]) VALUES (1, CAST(N'2016-03-10 08:40:00.000' AS DateTime), CAST(N'2016-03-11 08:40:00.000' AS DateTime), N'PRESION ALTA/FIEBRE', N'SIGNOS VITALES', NULL, 3)
INSERT [dbo].[T_RESULTADO_EXAMEN] ([idResultadoExamen], [fechaExamen], [fechaResultado], [diagnostico], [tipoExamen], [imagenResultado], [idResultado]) VALUES (2, CAST(N'2016-03-12 08:40:00.000' AS DateTime), CAST(N'2016-03-13 08:40:00.000' AS DateTime), N'PRESION ALTA/FIEBRE', N'SIGNOS VITALES', NULL, 3)
INSERT [dbo].[T_RESULTADO_EXAMEN] ([idResultadoExamen], [fechaExamen], [fechaResultado], [diagnostico], [tipoExamen], [imagenResultado], [idResultado]) VALUES (3, CAST(N'2016-03-14 08:40:00.000' AS DateTime), CAST(N'2016-03-15 08:40:00.000' AS DateTime), N'PRESION ALTA/FIEBRE', N'SIGNOS VITALES', NULL, 3)
INSERT [dbo].[T_RESULTADO_EXAMEN] ([idResultadoExamen], [fechaExamen], [fechaResultado], [diagnostico], [tipoExamen], [imagenResultado], [idResultado]) VALUES (4, CAST(N'2016-03-14 09:50:00.000' AS DateTime), CAST(N'2016-03-14 13:20:00.000' AS DateTime), N'Se muestra pequeño bulto circular en la rodilla derecha, de 1 cm de diámetro. Se observa sustancia líquida interna', N'RX', NULL, 1)
SET IDENTITY_INSERT [dbo].[T_ROL] ON 

INSERT [dbo].[T_ROL] ([idRol], [nombreRol], [estRol]) VALUES (1, N'Administrador de Sistema', N'ACT')
INSERT [dbo].[T_ROL] ([idRol], [nombreRol], [estRol]) VALUES (2, N'Solicitante', N'ACT')
INSERT [dbo].[T_ROL] ([idRol], [nombreRol], [estRol]) VALUES (3, N'Auxiliar de Mantenimiento', N'ACT')
INSERT [dbo].[T_ROL] ([idRol], [nombreRol], [estRol]) VALUES (4, N'Jefe de Mantenimiento', N'ACT')
INSERT [dbo].[T_ROL] ([idRol], [nombreRol], [estRol]) VALUES (5, N'Médico', N'ACT')
INSERT [dbo].[T_ROL] ([idRol], [nombreRol], [estRol]) VALUES (6, N'Técnico de Mantenimiento Interno', N'ACT')
INSERT [dbo].[T_ROL] ([idRol], [nombreRol], [estRol]) VALUES (7, N'Servicio de Mantenimiento Externo', N'ACT')
SET IDENTITY_INSERT [dbo].[T_ROL] OFF
INSERT [dbo].[T_SERVICIO_SALUD] ([idServicio], [tipoServicio], [nomServicio], [idEspecialidad]) VALUES (1, N'Cardiología', N'Colocación de Stent Intracoronario', 4)
INSERT [dbo].[T_SERVICIO_SALUD] ([idServicio], [tipoServicio], [nomServicio], [idEspecialidad]) VALUES (2, N'Cardiología', N'Colocación de marcapasos', 4)
INSERT [dbo].[T_SERVICIO_SALUD] ([idServicio], [tipoServicio], [nomServicio], [idEspecialidad]) VALUES (3, N'Medicina Interna', N'Diagnostico de Osteoporosis', 25)
INSERT [dbo].[T_SERVICIO_SALUD] ([idServicio], [tipoServicio], [nomServicio], [idEspecialidad]) VALUES (4, N'Medicina Interna', N'Densitometria osea', 25)
INSERT [dbo].[T_SERVICIO_SALUD] ([idServicio], [tipoServicio], [nomServicio], [idEspecialidad]) VALUES (5, N'Neumología', N'Espirometría', 33)
INSERT [dbo].[T_SERVICIO_SALUD] ([idServicio], [tipoServicio], [nomServicio], [idEspecialidad]) VALUES (6, N'Neumología', N'Fibrobroncoscopía', 33)
INSERT [dbo].[T_SERVICIO_SALUD] ([idServicio], [tipoServicio], [nomServicio], [idEspecialidad]) VALUES (7, N'Neumología', N'Consulta Medica', 33)
INSERT [dbo].[T_SERVICIO_SALUD] ([idServicio], [tipoServicio], [nomServicio], [idEspecialidad]) VALUES (8, N'Ginecología', N'Control Fetal', 15)
INSERT [dbo].[T_SOLICITUD_UCI] ([idSolicitud], [fechaSolicitud], [observacion], [estadoSolicitud], [gravedadPaciente], [idPaciente], [numeroSolicitud], [fechaEvaluacion], [tipoTraslado], [dscMedicinaTraslado], [tipoEquipoMedico], [idEmpleado], [idResultado], [idRegistro]) VALUES (3, CAST(N'2016-03-16 08:40:00.000' AS DateTime), N'PACIENTE CON SIGNOS VITALES CRITICOS', N'APR', N'DISFUNCIÒN ORGÀNICA COMPLETA', 1, N'SUCI0000001', CAST(N'2017-04-02 22:51:49.887' AS DateTime), N'CAMILLA RIGIDA (CAMILLA NORMAL)', N'SUERO FISIOLÒGICO MANTENIMIENTO', N'VENTILADOR DE TRANSPORTE', 12, 1, NULL)
INSERT [dbo].[T_SOLICITUD_UCI] ([idSolicitud], [fechaSolicitud], [observacion], [estadoSolicitud], [gravedadPaciente], [idPaciente], [numeroSolicitud], [fechaEvaluacion], [tipoTraslado], [dscMedicinaTraslado], [tipoEquipoMedico], [idEmpleado], [idResultado], [idRegistro]) VALUES (4, CAST(N'2016-03-16 08:40:00.000' AS DateTime), N'PACIENTE CON INSUFICIENCIA RENAL', N'PEN', N'DISFUNCIÒN ORGÀNICA AGUDA', 2, N'SUCI0000002', NULL, NULL, NULL, NULL, 12, 2, NULL)
INSERT [dbo].[T_SOLICITUD_UCI] ([idSolicitud], [fechaSolicitud], [observacion], [estadoSolicitud], [gravedadPaciente], [idPaciente], [numeroSolicitud], [fechaEvaluacion], [tipoTraslado], [dscMedicinaTraslado], [tipoEquipoMedico], [idEmpleado], [idResultado], [idRegistro]) VALUES (5, CAST(N'2016-03-16 08:40:00.000' AS DateTime), N'PACIENTE EN ESTADO DE COMA', N'PEN', N'DISFUNCIÒN ORGÀNICA AGUDA', 3, N'SUCI0000003', NULL, NULL, NULL, NULL, 12, 3, NULL)
SET IDENTITY_INSERT [dbo].[T_TRATAMIENTO_UCI] ON 

INSERT [dbo].[T_TRATAMIENTO_UCI] ([idTratamiento], [fechaTratamiento], [resultado], [observacion], [medicinaTratamiento], [frecuencia], [idSolicitud]) VALUES (1, CAST(N'2017-04-02 16:44:24.023' AS DateTime), NULL, N'jhh', NULL, NULL, NULL)
INSERT [dbo].[T_TRATAMIENTO_UCI] ([idTratamiento], [fechaTratamiento], [resultado], [observacion], [medicinaTratamiento], [frecuencia], [idSolicitud]) VALUES (2, CAST(N'2017-04-02 16:47:00.730' AS DateTime), NULL, N'xsxs', NULL, NULL, NULL)
INSERT [dbo].[T_TRATAMIENTO_UCI] ([idTratamiento], [fechaTratamiento], [resultado], [observacion], [medicinaTratamiento], [frecuencia], [idSolicitud]) VALUES (3, CAST(N'2017-04-02 16:47:05.807' AS DateTime), NULL, N'xsxs', NULL, NULL, NULL)
INSERT [dbo].[T_TRATAMIENTO_UCI] ([idTratamiento], [fechaTratamiento], [resultado], [observacion], [medicinaTratamiento], [frecuencia], [idSolicitud]) VALUES (4, CAST(N'2017-04-02 16:47:49.623' AS DateTime), NULL, N'xsxs', NULL, NULL, NULL)
INSERT [dbo].[T_TRATAMIENTO_UCI] ([idTratamiento], [fechaTratamiento], [resultado], [observacion], [medicinaTratamiento], [frecuencia], [idSolicitud]) VALUES (5, CAST(N'2017-04-02 16:55:52.367' AS DateTime), NULL, N'', NULL, NULL, NULL)
INSERT [dbo].[T_TRATAMIENTO_UCI] ([idTratamiento], [fechaTratamiento], [resultado], [observacion], [medicinaTratamiento], [frecuencia], [idSolicitud]) VALUES (6, CAST(N'2017-04-02 16:57:37.643' AS DateTime), NULL, N'', NULL, NULL, NULL)
INSERT [dbo].[T_TRATAMIENTO_UCI] ([idTratamiento], [fechaTratamiento], [resultado], [observacion], [medicinaTratamiento], [frecuencia], [idSolicitud]) VALUES (7, CAST(N'2017-04-02 22:51:49.987' AS DateTime), NULL, N'', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[T_TRATAMIENTO_UCI] OFF
SET IDENTITY_INSERT [dbo].[T_USUARIO] ON 

INSERT [dbo].[T_USUARIO] ([idUsuario], [nombreUsuario], [email], [contrasena], [idEmpleado], [EstUsuario]) VALUES (1, N'CALDANAMONT', N'cesaraldanam@gmail.com', N'123', 1, N'ACT')
INSERT [dbo].[T_USUARIO] ([idUsuario], [nombreUsuario], [email], [contrasena], [idEmpleado], [EstUsuario]) VALUES (2, N'KAYLAS', N'katy1234@gmail.com', N'123456', 3, N'ACT')
INSERT [dbo].[T_USUARIO] ([idUsuario], [nombreUsuario], [email], [contrasena], [idEmpleado], [EstUsuario]) VALUES (3, N'ANGEJIMENEZ', N'angelijimenez321@gmail.com', N'123456', 8, N'ACT')
INSERT [dbo].[T_USUARIO] ([idUsuario], [nombreUsuario], [email], [contrasena], [idEmpleado], [EstUsuario]) VALUES (4, N'PAMEHERNANDEZ', N'pameladiaz123@gmail.com', N'222', 9, N'ACT')
INSERT [dbo].[T_USUARIO] ([idUsuario], [nombreUsuario], [email], [contrasena], [idEmpleado], [EstUsuario]) VALUES (5, N'ROSAMORALES', N'rosamorales@gmail.com', N'111', 10, N'ACT')
INSERT [dbo].[T_USUARIO] ([idUsuario], [nombreUsuario], [email], [contrasena], [idEmpleado], [EstUsuario]) VALUES (6, N'DANIELMEDINA', N'danielMedina@gmail.com', N'333', 11, N'ACT')
INSERT [dbo].[T_USUARIO] ([idUsuario], [nombreUsuario], [email], [contrasena], [idEmpleado], [EstUsuario]) VALUES (7, N'210147852645', N'juanitaSACMANT@gmail.com', N'123', 1, N'ACT')
INSERT [dbo].[T_USUARIO] ([idUsuario], [nombreUsuario], [email], [contrasena], [idEmpleado], [EstUsuario]) VALUES (8, N'DCAMPODONICO', N'dcampodonico@crp.gob.pe', N'1234', 14, N'ACT')
SET IDENTITY_INSERT [dbo].[T_USUARIO] OFF
INSERT [dbo].[T_USUARIO_ROL] ([idUsuario], [idRol]) VALUES (1, 4)
INSERT [dbo].[T_USUARIO_ROL] ([idUsuario], [idRol]) VALUES (2, 6)
INSERT [dbo].[T_USUARIO_ROL] ([idUsuario], [idRol]) VALUES (3, 5)
INSERT [dbo].[T_USUARIO_ROL] ([idUsuario], [idRol]) VALUES (4, 5)
INSERT [dbo].[T_USUARIO_ROL] ([idUsuario], [idRol]) VALUES (5, 3)
INSERT [dbo].[T_USUARIO_ROL] ([idUsuario], [idRol]) VALUES (6, 3)
INSERT [dbo].[T_USUARIO_ROL] ([idUsuario], [idRol]) VALUES (7, 7)
INSERT [dbo].[T_USUARIO_ROL] ([idUsuario], [idRol]) VALUES (8, 5)
/****** Object:  Index [UHC_idPaciente]    Script Date: 08/09/2017 17:24:26 ******/
ALTER TABLE [dbo].[T_HISTORIA_CLINICA] ADD  CONSTRAINT [UHC_idPaciente] UNIQUE NONCLUSTERED 
(
	[idPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UHC_nroHistoriaClinica]    Script Date: 08/09/2017 17:24:26 ******/
ALTER TABLE [dbo].[T_HISTORIA_CLINICA] ADD  CONSTRAINT [UHC_nroHistoriaClinica] UNIQUE NONCLUSTERED 
(
	[nroHistoriaClinica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[T_ANTECEDENTES]  WITH CHECK ADD  CONSTRAINT [R_93] FOREIGN KEY([idHistoriaClinica])
REFERENCES [dbo].[T_HISTORIA_CLINICA] ([idHistoriaClinica])
GO
ALTER TABLE [dbo].[T_ANTECEDENTES] CHECK CONSTRAINT [R_93]
GO
ALTER TABLE [dbo].[T_CASO_PACIENTE]  WITH CHECK ADD  CONSTRAINT [FK_EMPLEADO_CASO] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[T_EMPLEADO] ([idEmpleado])
GO
ALTER TABLE [dbo].[T_CASO_PACIENTE] CHECK CONSTRAINT [FK_EMPLEADO_CASO]
GO
ALTER TABLE [dbo].[T_CASO_PACIENTE]  WITH CHECK ADD  CONSTRAINT [FK_ESPECIALIDAD_CASO] FOREIGN KEY([idEspecialidad])
REFERENCES [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad])
GO
ALTER TABLE [dbo].[T_CASO_PACIENTE] CHECK CONSTRAINT [FK_ESPECIALIDAD_CASO]
GO
ALTER TABLE [dbo].[T_CASO_PACIENTE]  WITH CHECK ADD  CONSTRAINT [FK_PACIENTE_CASO] FOREIGN KEY([idPaciente])
REFERENCES [dbo].[T_PACIENTE] ([idPaciente])
GO
ALTER TABLE [dbo].[T_CASO_PACIENTE] CHECK CONSTRAINT [FK_PACIENTE_CASO]
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL]  WITH CHECK ADD  CONSTRAINT [FK__T_CONTROL__idAct__09746778] FOREIGN KEY([idActividadCardiacaFetal])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL] CHECK CONSTRAINT [FK__T_CONTROL__idAct__09746778]
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL]  WITH CHECK ADD  CONSTRAINT [FK__T_CONTROL__idAct__SDS8] FOREIGN KEY([idCasoPaciente])
REFERENCES [dbo].[T_CASO_PACIENTE] ([idCasoPaciente])
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL] CHECK CONSTRAINT [FK__T_CONTROL__idAct__SDS8]
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL]  WITH CHECK ADD  CONSTRAINT [FK__T_CONTROL__idCer__0E391C95] FOREIGN KEY([idCerebro])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL] CHECK CONSTRAINT [FK__T_CONTROL__idCer__0E391C95]
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL]  WITH CHECK ADD  CONSTRAINT [FK__T_CONTROL__idCor__10216507] FOREIGN KEY([idCorazon])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL] CHECK CONSTRAINT [FK__T_CONTROL__idCor__10216507]
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL]  WITH CHECK ADD  CONSTRAINT [FK__T_CONTROL__idCor__17C286CF] FOREIGN KEY([idCordon])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL] CHECK CONSTRAINT [FK__T_CONTROL__idCor__17C286CF]
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL]  WITH CHECK ADD  CONSTRAINT [FK__T_CONTROL__idEes__0F2D40CE] FOREIGN KEY([idEespina])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL] CHECK CONSTRAINT [FK__T_CONTROL__idEes__0F2D40CE]
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL]  WITH CHECK ADD  CONSTRAINT [FK__T_CONTROL__idEst__1209AD79] FOREIGN KEY([idEstomago])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL] CHECK CONSTRAINT [FK__T_CONTROL__idEst__1209AD79]
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL]  WITH CHECK ADD  CONSTRAINT [FK__T_CONTROL__idGru__0A688BB1] FOREIGN KEY([idGrupoEtnico])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL] CHECK CONSTRAINT [FK__T_CONTROL__idGru__0A688BB1]
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL]  WITH CHECK ADD  CONSTRAINT [FK__T_CONTROL__idHal__0880433F] FOREIGN KEY([idHallazgos])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL] CHECK CONSTRAINT [FK__T_CONTROL__idHal__0880433F]
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL]  WITH CHECK ADD  CONSTRAINT [FK__T_CONTROL__idHue__0B5CAFEA] FOREIGN KEY([idHuesoNasal])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL] CHECK CONSTRAINT [FK__T_CONTROL__idHue__0B5CAFEA]
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL]  WITH CHECK ADD  CONSTRAINT [FK__T_CONTROL__idIns__18B6AB08] FOREIGN KEY([idInsercionCordon])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL] CHECK CONSTRAINT [FK__T_CONTROL__idIns__18B6AB08]
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL]  WITH CHECK ADD  CONSTRAINT [FK__T_CONTROL__idLiq__16CE6296] FOREIGN KEY([idLiquidoAmniotico])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL] CHECK CONSTRAINT [FK__T_CONTROL__idLiq__16CE6296]
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL]  WITH CHECK ADD  CONSTRAINT [FK__T_CONTROL__idMan__13F1F5EB] FOREIGN KEY([idManos])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL] CHECK CONSTRAINT [FK__T_CONTROL__idMan__13F1F5EB]
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL]  WITH CHECK ADD  CONSTRAINT [FK__T_CONTROL__idPar__11158940] FOREIGN KEY([idParedAbdominal])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL] CHECK CONSTRAINT [FK__T_CONTROL__idPar__11158940]
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL]  WITH CHECK ADD  CONSTRAINT [FK__T_CONTROL__idPie__14E61A24] FOREIGN KEY([idPies])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL] CHECK CONSTRAINT [FK__T_CONTROL__idPie__14E61A24]
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL]  WITH CHECK ADD  CONSTRAINT [FK__T_CONTROL__idPla__15DA3E5D] FOREIGN KEY([idPlacenta])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL] CHECK CONSTRAINT [FK__T_CONTROL__idPla__15DA3E5D]
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL]  WITH CHECK ADD  CONSTRAINT [FK__T_CONTROL__idTri__0C50D423] FOREIGN KEY([idTricuspideDoppler])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL] CHECK CONSTRAINT [FK__T_CONTROL__idTri__0C50D423]
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL]  WITH CHECK ADD  CONSTRAINT [FK__T_CONTROL__idVCd__0D44F85C] FOREIGN KEY([idVCdoppler])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL] CHECK CONSTRAINT [FK__T_CONTROL__idVCd__0D44F85C]
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL]  WITH CHECK ADD  CONSTRAINT [FK__T_CONTROL__idVej__12FDD1B2] FOREIGN KEY([idVejiga])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_CONTROL_FETAL] CHECK CONSTRAINT [FK__T_CONTROL__idVej__12FDD1B2]
GO
ALTER TABLE [dbo].[T_EC_BIOQUIMICA]  WITH CHECK ADD  CONSTRAINT [R_20] FOREIGN KEY([idGrupoEtnico])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_EC_BIOQUIMICA] CHECK CONSTRAINT [R_20]
GO
ALTER TABLE [dbo].[T_EC_BIOQUIMICA]  WITH CHECK ADD  CONSTRAINT [R_21] FOREIGN KEY([idFumador])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_EC_BIOQUIMICA] CHECK CONSTRAINT [R_21]
GO
ALTER TABLE [dbo].[T_EC_BIOQUIMICA]  WITH CHECK ADD  CONSTRAINT [R_22] FOREIGN KEY([idConcepcion])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_EC_BIOQUIMICA] CHECK CONSTRAINT [R_22]
GO
ALTER TABLE [dbo].[T_EC_BIOQUIMICA]  WITH CHECK ADD  CONSTRAINT [R_23] FOREIGN KEY([idOvulacion])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_EC_BIOQUIMICA] CHECK CONSTRAINT [R_23]
GO
ALTER TABLE [dbo].[T_EC_BIOQUIMICA]  WITH CHECK ADD  CONSTRAINT [R_24] FOREIGN KEY([idKitManufacturador])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_EC_BIOQUIMICA] CHECK CONSTRAINT [R_24]
GO
ALTER TABLE [dbo].[T_EC_DOPPLER_UTERINO]  WITH CHECK ADD  CONSTRAINT [R_25] FOREIGN KEY([idGrupoEtnico])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_EC_DOPPLER_UTERINO] CHECK CONSTRAINT [R_25]
GO
ALTER TABLE [dbo].[T_EC_DOPPLER_UTERINO]  WITH CHECK ADD  CONSTRAINT [R_26] FOREIGN KEY([idFumador])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_EC_DOPPLER_UTERINO] CHECK CONSTRAINT [R_26]
GO
ALTER TABLE [dbo].[T_EC_DOPPLER_UTERINO]  WITH CHECK ADD  CONSTRAINT [R_27] FOREIGN KEY([idOvulacion])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_EC_DOPPLER_UTERINO] CHECK CONSTRAINT [R_27]
GO
ALTER TABLE [dbo].[T_EC_DOPPLER_UTERINO]  WITH CHECK ADD  CONSTRAINT [R_28] FOREIGN KEY([idHipertension])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_EC_DOPPLER_UTERINO] CHECK CONSTRAINT [R_28]
GO
ALTER TABLE [dbo].[T_EC_DOPPLER_UTERINO]  WITH CHECK ADD  CONSTRAINT [R_29] FOREIGN KEY([idPetEmbarazo])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_EC_DOPPLER_UTERINO] CHECK CONSTRAINT [R_29]
GO
ALTER TABLE [dbo].[T_EC_DOPPLER_UTERINO]  WITH CHECK ADD  CONSTRAINT [R_30] FOREIGN KEY([idPetMadre])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_EC_DOPPLER_UTERINO] CHECK CONSTRAINT [R_30]
GO
ALTER TABLE [dbo].[T_EMBARAZO_ECTOPICO]  WITH CHECK ADD FOREIGN KEY([idAccionTomar])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_EMBARAZO_ECTOPICO]  WITH CHECK ADD FOREIGN KEY([idCasoPaciente])
REFERENCES [dbo].[T_CASO_PACIENTE] ([idCasoPaciente])
GO
ALTER TABLE [dbo].[T_EMBARAZO_ECTOPICO]  WITH CHECK ADD FOREIGN KEY([idDolor])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_EMBARAZO_ECTOPICO]  WITH CHECK ADD FOREIGN KEY([idEstructura])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_EMBARAZO_ECTOPICO]  WITH CHECK ADD FOREIGN KEY([idGradoCerteza])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_EMBARAZO_ECTOPICO]  WITH CHECK ADD FOREIGN KEY([idImpresionSubjetiva])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_EMBARAZO_ECTOPICO]  WITH CHECK ADD FOREIGN KEY([idLocalizacion])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_EMBARAZO_ECTOPICO]  WITH CHECK ADD FOREIGN KEY([idMorfologia])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_EMBARAZO_ECTOPICO]  WITH CHECK ADD FOREIGN KEY([idSangradoVaginal])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_EMBARAZO_ECTOPICO]  WITH CHECK ADD FOREIGN KEY([idTestEmbarazoOrina])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_EMPLEADO]  WITH CHECK ADD  CONSTRAINT [R_11] FOREIGN KEY([idEspecialidad])
REFERENCES [dbo].[T_ESPECIALIDAD_MEDICA] ([idEspecialidad])
GO
ALTER TABLE [dbo].[T_EMPLEADO] CHECK CONSTRAINT [R_11]
GO
ALTER TABLE [dbo].[T_EMPLEADO]  WITH CHECK ADD  CONSTRAINT [R_12] FOREIGN KEY([codPersona])
REFERENCES [dbo].[T_PERSONA] ([codPersona])
GO
ALTER TABLE [dbo].[T_EMPLEADO] CHECK CONSTRAINT [R_12]
GO
ALTER TABLE [dbo].[T_EVALUACION_RIESGO_FETAL]  WITH CHECK ADD  CONSTRAINT [FK__T_EVALUAC__idCat__04E4BC85] FOREIGN KEY([idCatalogo])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_EVALUACION_RIESGO_FETAL] CHECK CONSTRAINT [FK__T_EVALUAC__idCat__04E4BC85]
GO
ALTER TABLE [dbo].[T_EVALUACION_RIESGO_FETAL]  WITH CHECK ADD  CONSTRAINT [FK__T_EVALUAC__idCat__5812160E] FOREIGN KEY([idCatalogo])
REFERENCES [dbo].[T_CATALOGO] ([idCatalogo])
GO
ALTER TABLE [dbo].[T_EVALUACION_RIESGO_FETAL] CHECK CONSTRAINT [FK__T_EVALUAC__idCat__5812160E]
GO
ALTER TABLE [dbo].[T_EVALUACION_RIESGO_FETAL]  WITH CHECK ADD  CONSTRAINT [FK__T_EVALUAC__idFMF__05D8E0BE] FOREIGN KEY([idFMF])
REFERENCES [dbo].[T_FMF] ([idFMF])
GO
ALTER TABLE [dbo].[T_EVALUACION_RIESGO_FETAL] CHECK CONSTRAINT [FK__T_EVALUAC__idFMF__05D8E0BE]
GO
ALTER TABLE [dbo].[T_EVALUACION_RIESGO_FETAL]  WITH CHECK ADD  CONSTRAINT [FK__T_EVALUAC__idFMF__59063A47] FOREIGN KEY([idFMF])
REFERENCES [dbo].[T_FMF] ([idFMF])
GO
ALTER TABLE [dbo].[T_EVALUACION_RIESGO_FETAL] CHECK CONSTRAINT [FK__T_EVALUAC__idFMF__59063A47]
GO
ALTER TABLE [dbo].[T_EVALUACION_SIGNOS_VITALES]  WITH CHECK ADD  CONSTRAINT [R_77] FOREIGN KEY([idResultadoExamen])
REFERENCES [dbo].[T_RESULTADO_EXAMEN] ([idResultadoExamen])
GO
ALTER TABLE [dbo].[T_EVALUACION_SIGNOS_VITALES] CHECK CONSTRAINT [R_77]
GO
ALTER TABLE [dbo].[T_EVALUACION_TISS]  WITH CHECK ADD  CONSTRAINT [R_78] FOREIGN KEY([idResultadoExamen])
REFERENCES [dbo].[T_RESULTADO_EXAMEN] ([idResultadoExamen])
GO
ALTER TABLE [dbo].[T_EVALUACION_TISS] CHECK CONSTRAINT [R_78]
GO
ALTER TABLE [dbo].[T_EVENTO_HISTORIA_CLINICA]  WITH CHECK ADD  CONSTRAINT [R_48] FOREIGN KEY([idResultado])
REFERENCES [dbo].[T_RESULTADO_ATENCION] ([idResultado])
GO
ALTER TABLE [dbo].[T_EVENTO_HISTORIA_CLINICA] CHECK CONSTRAINT [R_48]
GO
ALTER TABLE [dbo].[T_EVENTO_HISTORIA_CLINICA]  WITH CHECK ADD  CONSTRAINT [R_76] FOREIGN KEY([idResultadoExamen])
REFERENCES [dbo].[T_RESULTADO_EXAMEN] ([idResultadoExamen])
GO
ALTER TABLE [dbo].[T_EVENTO_HISTORIA_CLINICA] CHECK CONSTRAINT [R_76]
GO
ALTER TABLE [dbo].[T_EVENTO_HISTORIA_CLINICA]  WITH CHECK ADD  CONSTRAINT [R_90] FOREIGN KEY([idHistoriaClinica])
REFERENCES [dbo].[T_HISTORIA_CLINICA] ([idHistoriaClinica])
GO
ALTER TABLE [dbo].[T_EVENTO_HISTORIA_CLINICA] CHECK CONSTRAINT [R_90]
GO
ALTER TABLE [dbo].[T_EXAMEN_TRATAMIENTO]  WITH CHECK ADD  CONSTRAINT [R_87] FOREIGN KEY([idTratamiento])
REFERENCES [dbo].[T_TRATAMIENTO_UCI] ([idTratamiento])
GO
ALTER TABLE [dbo].[T_EXAMEN_TRATAMIENTO] CHECK CONSTRAINT [R_87]
GO
ALTER TABLE [dbo].[T_EXAMEN_TRATAMIENTO]  WITH CHECK ADD  CONSTRAINT [R_88] FOREIGN KEY([idResultadoExamen])
REFERENCES [dbo].[T_RESULTADO_EXAMEN] ([idResultadoExamen])
GO
ALTER TABLE [dbo].[T_EXAMEN_TRATAMIENTO] CHECK CONSTRAINT [R_88]
GO
ALTER TABLE [dbo].[T_FMF]  WITH CHECK ADD  CONSTRAINT [FK_FMF_EMPLEADO] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[T_EMPLEADO] ([idEmpleado])
GO
ALTER TABLE [dbo].[T_FMF] CHECK CONSTRAINT [FK_FMF_EMPLEADO]
GO
ALTER TABLE [dbo].[T_FMF]  WITH CHECK ADD  CONSTRAINT [FK_FMF_PERSONA] FOREIGN KEY([codPersona])
REFERENCES [dbo].[T_PERSONA] ([codPersona])
GO
ALTER TABLE [dbo].[T_FMF] CHECK CONSTRAINT [FK_FMF_PERSONA]
GO
ALTER TABLE [dbo].[T_HISTORIA_CLINICA]  WITH CHECK ADD  CONSTRAINT [R_80] FOREIGN KEY([idPaciente])
REFERENCES [dbo].[T_PACIENTE] ([idPaciente])
GO
ALTER TABLE [dbo].[T_HISTORIA_CLINICA] CHECK CONSTRAINT [R_80]
GO
ALTER TABLE [dbo].[T_MUEBLE]  WITH CHECK ADD  CONSTRAINT [R_14] FOREIGN KEY([codModelo])
REFERENCES [dbo].[T_MODELO] ([codModelo])
GO
ALTER TABLE [dbo].[T_MUEBLE] CHECK CONSTRAINT [R_14]
GO
ALTER TABLE [dbo].[T_MUEBLE]  WITH CHECK ADD  CONSTRAINT [R_15] FOREIGN KEY([codBien])
REFERENCES [dbo].[T_BIEN] ([codBien])
GO
ALTER TABLE [dbo].[T_MUEBLE] CHECK CONSTRAINT [R_15]
GO
ALTER TABLE [dbo].[T_MUEBLE]  WITH CHECK ADD  CONSTRAINT [R_16] FOREIGN KEY([codEmpresa])
REFERENCES [dbo].[T_EMPRESA] ([codEmpresa])
GO
ALTER TABLE [dbo].[T_MUEBLE] CHECK CONSTRAINT [R_16]
GO
ALTER TABLE [dbo].[T_ORDEN_ATENCION]  WITH CHECK ADD  CONSTRAINT [R_45] FOREIGN KEY([idReserva])
REFERENCES [dbo].[T_RESERVA_SERVICIO] ([idReserva])
GO
ALTER TABLE [dbo].[T_ORDEN_ATENCION] CHECK CONSTRAINT [R_45]
GO
ALTER TABLE [dbo].[T_PACIENTE]  WITH CHECK ADD  CONSTRAINT [R_82] FOREIGN KEY([codPersona])
REFERENCES [dbo].[T_PERSONA] ([codPersona])
GO
ALTER TABLE [dbo].[T_PACIENTE] CHECK CONSTRAINT [R_82]
GO
ALTER TABLE [dbo].[T_RESERVA_SERVICIO]  WITH CHECK ADD  CONSTRAINT [R_40] FOREIGN KEY([idServicio])
REFERENCES [dbo].[T_SERVICIO_SALUD] ([idServicio])
GO
ALTER TABLE [dbo].[T_RESERVA_SERVICIO] CHECK CONSTRAINT [R_40]
GO
ALTER TABLE [dbo].[T_RESERVA_SERVICIO]  WITH CHECK ADD  CONSTRAINT [R_42] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[T_EMPLEADO] ([idEmpleado])
GO
ALTER TABLE [dbo].[T_RESERVA_SERVICIO] CHECK CONSTRAINT [R_42]
GO
ALTER TABLE [dbo].[T_RESERVA_SERVICIO]  WITH CHECK ADD  CONSTRAINT [R_91] FOREIGN KEY([idPaciente])
REFERENCES [dbo].[T_PACIENTE] ([idPaciente])
GO
ALTER TABLE [dbo].[T_RESERVA_SERVICIO] CHECK CONSTRAINT [R_91]
GO
ALTER TABLE [dbo].[T_RESULTADO_ATENCION]  WITH CHECK ADD  CONSTRAINT [R_41] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[T_EMPLEADO] ([idEmpleado])
GO
ALTER TABLE [dbo].[T_RESULTADO_ATENCION] CHECK CONSTRAINT [R_41]
GO
ALTER TABLE [dbo].[T_RESULTADO_ATENCION]  WITH CHECK ADD  CONSTRAINT [R_46] FOREIGN KEY([idAtencion])
REFERENCES [dbo].[T_ORDEN_ATENCION] ([idAtencion])
GO
ALTER TABLE [dbo].[T_RESULTADO_ATENCION] CHECK CONSTRAINT [R_46]
GO
ALTER TABLE [dbo].[T_RESULTADO_EXAMEN]  WITH CHECK ADD  CONSTRAINT [R_89] FOREIGN KEY([idResultado])
REFERENCES [dbo].[T_RESULTADO_ATENCION] ([idResultado])
GO
ALTER TABLE [dbo].[T_RESULTADO_EXAMEN] CHECK CONSTRAINT [R_89]
GO
ALTER TABLE [dbo].[T_SOLICITUD_UCI]  WITH CHECK ADD  CONSTRAINT [R_81] FOREIGN KEY([idPaciente])
REFERENCES [dbo].[T_PACIENTE] ([idPaciente])
GO
ALTER TABLE [dbo].[T_SOLICITUD_UCI] CHECK CONSTRAINT [R_81]
GO
ALTER TABLE [dbo].[T_SOLICITUD_UCI]  WITH CHECK ADD  CONSTRAINT [R_83] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[T_EMPLEADO] ([idEmpleado])
GO
ALTER TABLE [dbo].[T_SOLICITUD_UCI] CHECK CONSTRAINT [R_83]
GO
ALTER TABLE [dbo].[T_SOLICITUD_UCI]  WITH CHECK ADD  CONSTRAINT [R_84] FOREIGN KEY([idResultado])
REFERENCES [dbo].[T_RESULTADO_ATENCION] ([idResultado])
GO
ALTER TABLE [dbo].[T_SOLICITUD_UCI] CHECK CONSTRAINT [R_84]
GO
ALTER TABLE [dbo].[T_SOLICITUD_UCI]  WITH CHECK ADD  CONSTRAINT [R_85] FOREIGN KEY([idRegistro])
REFERENCES [dbo].[T_REGISTRO_UCI] ([idRegistro])
GO
ALTER TABLE [dbo].[T_SOLICITUD_UCI] CHECK CONSTRAINT [R_85]
GO
ALTER TABLE [dbo].[T_TRATAMIENTO_UCI]  WITH CHECK ADD  CONSTRAINT [R_86] FOREIGN KEY([idSolicitud])
REFERENCES [dbo].[T_SOLICITUD_UCI] ([idSolicitud])
GO
ALTER TABLE [dbo].[T_TRATAMIENTO_UCI] CHECK CONSTRAINT [R_86]
GO
ALTER TABLE [dbo].[T_USUARIO]  WITH CHECK ADD FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[T_EMPLEADO] ([idEmpleado])
GO
ALTER TABLE [dbo].[T_USUARIO]  WITH CHECK ADD FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[T_EMPLEADO] ([idEmpleado])
GO
ALTER TABLE [dbo].[T_USUARIO_ROL]  WITH CHECK ADD  CONSTRAINT [FK__T_USUARIO__idRol__440B1D61] FOREIGN KEY([idRol])
REFERENCES [dbo].[T_ROL] ([idRol])
GO
ALTER TABLE [dbo].[T_USUARIO_ROL] CHECK CONSTRAINT [FK__T_USUARIO__idRol__440B1D61]
GO
ALTER TABLE [dbo].[T_USUARIO_ROL]  WITH CHECK ADD  CONSTRAINT [FK__T_USUARIO__idUsu__4316F928] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[T_USUARIO] ([idUsuario])
GO
ALTER TABLE [dbo].[T_USUARIO_ROL] CHECK CONSTRAINT [FK__T_USUARIO__idUsu__4316F928]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarSolicitudUCI]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ActualizarSolicitudUCI]
(
@idSolicitud int, 
@fechaSolicitud datetime, 
@observacion varchar(50), 
@estadoSolicitud char(3), 
@gravedadPaciente varchar(30), 
@idPaciente int, 
@numeroSolicitud varchar(20), 
@fechaEvaluacion datetime, 
@tipoTraslado varchar(50), 
@dscMedicinaTraslado varchar(100), 
@tipoEquipoMedico varchar(100), 
@idEmpleado int, 
@idResultado int, 
@idRegistro int
)
as
begin
	update T_SOLICITUD_UCI set fechaSolicitud=@fechaSolicitud,
	observacion=@observacion,
	estadoSolicitud = @estadoSolicitud,
	gravedadPaciente = @gravedadPaciente,
	idPaciente = @idPaciente,
	numeroSolicitud=@numeroSolicitud,
	fechaEvaluacion=@fechaEvaluacion,
	tipoTraslado=@tipoTraslado,
	dscMedicinaTraslado = @dscMedicinaTraslado,
	tipoEquipoMedico=@tipoEquipoMedico,
	idEmpleado=@idEmpleado,
	idResultado=@idResultado,
	idRegistro=@idRegistro
	where idSolicitud = @idSolicitud
end

GO
/****** Object:  StoredProcedure [dbo].[InsertarTratamientoUCI]    Script Date: 08/09/2017 17:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertarTratamientoUCI]
(
@fechaTratamiento datetime, 
@resultado varchar(200), 
@observacion varchar(200), 
@medicinaTratamiento varchar(200), 
@frecuencia varchar(15), 
@idSolicitud int
)
as
begin
	insert into [dbo].[T_TRATAMIENTO_UCI] values(@fechaTratamiento,@resultado,@observacion,@medicinaTratamiento,@frecuencia,@idSolicitud)
end

GO

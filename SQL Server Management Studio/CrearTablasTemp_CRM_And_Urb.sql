USE [Delivery]
GO

/****** CREAR  TABLA CRM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CRM](
	[Número de pedido] [nvarchar](255) NULL,
	[Delivery Transaction ID] [nvarchar](255) NULL,
	[Delivery Tracking ID] [nvarchar](255) NULL,
	[Gestion] [nvarchar](255) NULL,
	[Product Type] [nvarchar](255) NULL,
	[Product: Nombre del producto] [nvarchar](255) NULL,
	[Originating Channel] [nvarchar](255) NULL,
	[Origin Store Location: Name] [nvarchar](255) NULL,
	[Origin Store Location: Associated Warehouse] [nvarchar](255) NULL,
	[Estado] [nvarchar](255) NULL,
	[Fulfillment Status] [nvarchar](255) NULL,
	[Tracking status] [nvarchar](255) NULL,
	[Fecha de creación] [datetime] NULL,
	[Legal Invoice Number] [nvarchar](255) NULL,
	[Origin Store Location: Channel] [nvarchar](255) NULL,
	[Origin Store Location: Name1] [nvarchar](255) NULL,
	[Creado por: Alias] [nvarchar](255) NULL,
	[Account Integration Id] [nvarchar](255) NULL
) ON [PRIMARY]

/**CREAR TABLA ANDREANI **/

CREATE TABLE [dbo].[Andreani](
	[Nro Andreani] [nvarchar](255) NULL,
	[Referencia Cliente] [nvarchar](255) NULL,
	[Remito] [nvarchar](255) NULL,
	[Nro Pedido] [nvarchar](255) NULL,
	[Remitente] [nvarchar](255) NULL,
	[Servicio] [nvarchar](255) NULL,
	[Contrato] [nvarchar](255) NULL,
	[Sucursal de Alta] [nvarchar](255) NULL,
	[Sucursal de Distribución] [nvarchar](255) NULL,
	[Bultos] [float] NULL,
	[Peso] [float] NULL,
	[Peso Aforado] [nvarchar](255) NULL,
	[Volumen] [float] NULL,
	[Valor Declarado] [money] NULL,
	[Destinatario] [nvarchar](255) NULL,
	[Domicilio del Destinatario] [nvarchar](255) NULL,
	[Provincia] [nvarchar](255) NULL,
	[Localidad del Destinatario] [nvarchar](255) NULL,
	[CP del Destinatario] [nvarchar](255) NULL,
	[Estado] [nvarchar](255) NULL,
	[Estado Detallado] [nvarchar](255) NULL,
	[Última Novedad] [nvarchar](255) NULL,
	[Fecha Última Novedad] [datetime] NULL,
	[Hora Última Novedad] [datetime] NULL,
	[Motivo Novedad Final] [nvarchar](255) NULL,
	[Fecha Novedad Final] [datetime] NULL,
	[Hora Novedad Final] [datetime] NULL,
	[Ref Cliente 1] [nvarchar](255) NULL,
	[Ref Cliente 2] [nvarchar](255) NULL,
	[Ref Cliente 3] [nvarchar](255) NULL,
	[Ref Cliente 4] [nvarchar](255) NULL,
	[Ref Cliente 5] [nvarchar](255) NULL,
	[Nro de Componentes] [nvarchar](255) NULL,
	[Componentes] [nvarchar](255) NULL,
	[Importe a cobrar] [money] NULL,
	[Fecha Probable Entrega] [nvarchar](255) NULL,
	[Fecha Pactada] [nvarchar](255) NULL,
	[Hora Pactada] [nvarchar](255) NULL,
	[Fecha Repactada] [nvarchar](255) NULL,
	[Hora Repactada] [nvarchar](255) NULL,
	[Fecha Ingreso Pedido] [nvarchar](255) NULL,
	[Hora Ingreso Pedido] [nvarchar](255) NULL,
	[Fecha Alta] [datetime] NULL,
	[Hora Alta] [datetime] NULL,
	[Fecha Admisión] [datetime] NULL,
	[Hora Admisión] [datetime] NULL,
	[Fecha Inicio Distribución] [datetime] NULL,
	[Hora Inicio Distribución] [datetime] NULL,
	[Fecha Ingreso a Sucursal de Distribución] [datetime] NULL,
	[Hora Ingreso a Sucursal de Distribución] [datetime] NULL,
	[Fecha Visita 1] [datetime] NULL,
	[Hora Visita 1] [datetime] NULL,
	[Motivo V1] [nvarchar](255) NULL,
	[Fecha Visita 2] [datetime] NULL,
	[Hora Visita 2] [datetime] NULL,
	[Motivo V2] [nvarchar](255) NULL,
	[Fecha Visita 3] [datetime] NULL,
	[Hora Visita 3] [datetime] NULL,
	[Motivo V3] [nvarchar](255) NULL,
	[Fecha Ingreso a Custodia] [datetime] NULL,
	[Hora Ingreso a Custodia] [datetime] NULL,
	[Días Restantes de Custodia] [nvarchar](255) NULL,
	[Informacion Sucursal] [nvarchar](255) NULL,
	[Fecha de Rendición] [nvarchar](255) NULL,
	[Hora de Rendición] [nvarchar](255) NULL,
	[Nro de Informe de Rendición] [nvarchar](255) NULL,
	[Recibido] [nvarchar](255) NULL,
	[Geolocalización] [nvarchar](255) NULL,
	[Digitalización] [nvarchar](255) NULL
) ON [PRIMARY]

/**CREAR TABLA URBANO**/

CREATE TABLE [dbo].[Urbano](
	[Nro:] [float] NULL,
	[Codigo Pedido] [nvarchar](255) NULL,
	[Codigo Postal] [nvarchar](255) NULL,
	[Peso (Kg)] [float] NULL,
	[Fecha PI] [datetime] NULL,
	[Fecha GE] [datetime] NULL,
	[Fecha AS] [datetime] NULL,
	[Fecha AR] [datetime] NULL,
	[Fecha 1ra Visita] [datetime] NULL,
	[Motivo] [nvarchar](255) NULL,
	[Fecha 2da Visita] [datetime] NULL,
	[Motivo1] [nvarchar](255) NULL,
	[En custodia] [datetime] NULL,
	[Estado] [nvarchar](255) NULL,
	[Tipo de servicio] [nvarchar](255) NULL,
	[Observacion] [nvarchar](255) NULL
) ON [PRIMARY]

GO
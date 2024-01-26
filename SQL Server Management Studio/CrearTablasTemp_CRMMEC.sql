USE [Delivery]

CREATE TABLE [dbo].[union_CRMMEC](
	[Número de Pedido] [varchar](50) NULL,
	[Remito] [nvarchar](50) NULL,
	[T&T] [nvarchar](50) NULL,
	[Cuid] [nvarchar](50) NULL,
	[Fecha de Creacion del Pedido] [varchar](50) NULL,
	[Fecha ultimo estado de MEC] [varchar](50) NULL,
	[N° Cuenta] [varchar](50) NULL,
	[Factura de venta] [varchar](50) NULL,
	[Estado] [varchar](50) NULL,
	[Fulfillment Status] [varchar](50) NULL,
	[Tracking Status] [varchar](50) NULL,
	[Estado MEC] [varchar](50) NULL,
	[Descripción estado MEC] [varchar](50) NULL,
	[IMEI-IMSI] [nvarchar](50) NULL,
	[Canal Venta] [varchar](50) NULL,
	[Equipo Creador] [varchar](50) NULL,
	[Usuario Creador] [varchar](50) NULL,
	[Bodega Delivery] [varchar](50) NULL,
	[Tipo Gestión] [varchar](50) NULL,
	[Tipo Producto] [varchar](50) NULL,
	[Descripcion del Producto] [varchar](200) NULL,
	[NMU] [varchar](50) NULL
) ON [PRIMARY]




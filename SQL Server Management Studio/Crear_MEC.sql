USE Delivery
CREATE TABLE [dbo].[MEC](
	[fechaingreso] [datetime] NULL,
	[fechaenvio] [datetime] NULL,
	[remito] [nvarchar](50) NULL,
	[estadoid] [nvarchar](50) NULL,
	[estadodescripcion] [nvarchar](50) NULL,
	[eventoid] [nvarchar](50) NULL,
	[eventodescripcion] [nvarchar](50) NULL,
	[datosadicionales] [nvarchar](100) NULL,
	[fechaevento] [datetime] NULL,
	[ordenventa] [nvarchar](100) NULL,
	[nrotracking] [nvarchar](50) NULL,
	[gestion] [nvarchar](50) NULL,
	[nroregistro] [nvarchar](50) NULL,
	[prodcodigo] [nvarchar](50) NULL,
	[prodcantidad] [nvarchar](50) NULL,
	[prodciud] [nvarchar](50) NULL,
	[prodnroserie] [nvarchar](50) NULL
) ON [PRIMARY]
GO



USE [Delivery]
GO

CREATE TABLE [dbo].[WEEKEND](
	[Fecha] [date] NULL,
	[Mes] [nvarchar](255) NULL,
	[Dia] [nvarchar](255) NULL
) ON [PRIMARY]
GO



CREATE TABLE [dbo].[Feriados](
	[Fecha] [date] NULL,
	[Mes] [nvarchar](50) NULL
) ON [PRIMARY]
GO



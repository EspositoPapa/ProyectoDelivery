USE [Delivery]
GO

SELECT [N�mero de pedido]
      ,[Remito]
      ,[T&T]
      ,[Cuid]
      ,[Fecha de Creacion del Pedido]
      ,[Fecha ultimo estado de MEC]
      ,[N� Cuenta]
      ,[Factura de venta]
      ,[Estado]
      ,[Fulfillment Status]
      ,[Tracking Status]
      ,[Estado MEC]
      ,[Descripci�n estado MEC]
      ,[Tipo Gesti�n]
      ,[Tipo Producto]
      ,[Descripcion del Producto]
      ,[NMU]
      ,[IMEI-IMSI]
      ,[Canal Venta]
      ,[Equipo Creador]
      ,[Usuario Creador]
      ,[Bodega Delivery]
      ,[Operador Logistico]
      ,[Tipo de entrega]
      ,[ID Contrato distribucion]
      ,[CP]
      ,[Sucursal de Distribuci�n]
      ,[Destinatario]
      ,[Domicilio del Destinatario]
      ,[Provincia]
      ,[Localidad del Destinatario]
      ,[Estado del Correo]
      ,[Estado Detallado]
      ,[Ultima Novedad]
      ,[Fecha Ultima Novedad]
      ,[Motivo Novedad Final]
      ,[Fecha Alta]
      ,[Hora Alta]
      ,[Fecha Admisi�n]
      ,[Hora Admisi�n]
      ,[Fecha Inicio Distribuci�n]
      ,[Hora Inicio Distribuci�n]
      ,[Fecha Ingreso a Sucursal de Distribuci�n]
      ,[Hora Ingreso Sucursal de Distribuci�n]
      ,[Fecha 1er visita]
      ,[Hora 1er visita]
      ,[Motivo 1er visita]
      ,[Fecha 2da visita]
      ,[Hora 2da visita]
      ,[Motivo 2da visita]
      ,[Fecha 3er visita]
      ,[Hora 3er visita]
      ,[Motivo 3er visita]
      ,[Fecha Ingreso a Custodia]
      ,[Hora Ingreso a Custodia]
      ,[D�as Restantes de Custodia]
      ,[Domicilio de la Sucursal]
      ,[Datos del Receptor]
      ,[Geolocalizacion]
      ,[Constancia electr�nica de entrega]
      ,[Zona de Entrega]
      ,[Efectividad de Entrega]
      ,[LD FF]
      ,[LD PROCES]
      ,[LD ENTREGA]
      ,[LD TOTAL]
      ,[Promesa]
      ,[GAP]
      ,[Cumple Promesa]
      ,[Avance de la Distribucion]
      ,[Zona Correo]
  FROM [dbo].[Despachos]
  WHERE [Estado MEC] = 'En Devolucion'

GO



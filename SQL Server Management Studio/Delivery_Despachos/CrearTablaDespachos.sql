USE Delivery
CREATE TABLE Despachos_prueba
(
	  [Número de pedido] VARCHAR(50)
      ,[Remito] VARCHAR(50)
      ,[T&T] VARCHAR(50)
      ,[Cuid] VARCHAR(50)
      ,[Fecha de Creacion del Pedido] VARCHAR(50)
      ,[Fecha ultimo estado de MEC] VARCHAR(50)
      ,[N° Cuenta] VARCHAR(50)
      , [Factura de venta] VARCHAR(50)
      ,[Estado] VARCHAR(50)
      ,[Fulfillment Satus] VARCHAR(50)
      , [Tracking Status] VARCHAR(50)
      , [Estado MEC] VARCHAR(50)
      ,[Descripción estado MEC] VARCHAR(50)
      , [Tipo Gestión] VARCHAR(50)
      , [Tipo Producto] VARCHAR(50)
      ,[Descripcion del Producto] VARCHAR(50)
      ,[NMU] VARCHAR(50)
      ,[IMEI-IMSI] VARCHAR(50)
      ,[Canal Venta] VARCHAR(50)
      ,[Equipo Creador] VARCHAR(50)
      ,[Usuario Creador] VARCHAR(50)
      ,[Bodega Delivery] VARCHAR(50)
      ,[Operador Logistico] VARCHAR(50)
      ,[Tipo de entrega] VARCHAR(50)
      ,[ID Contrato distribucion] VARCHAR(50)
      ,[CP] VARCHAR(50)
      ,[Sucursal de Distribución] VARCHAR(50)
      , [Destinatario] VARCHAR(50)
      ,[Domicilio del Destinatario] VARCHAR(50)
      ,[Provincia] VARCHAR(50)
      ,[Localidad del destinatario] VARCHAR(50)
      ,[Estado del Correo] VARCHAR(50)
	  ,[Estado Detallado] VARCHAR(50)
      ,[Ultima Novedad]VARCHAR(50)
      ,[Fecha Ultima Novedad] DATE
      ,[Motivo Novedad Final] VARCHAR(50)
      ,[Fecha Alta] DATE
      ,[Hora Alta] TIME
      ,[Fecha Admisión] DATE
      ,[Hora Admisión] TIME
      ,[Fecha Inicio Distribución] DATE
      ,[Hora Inicio Distribución] TIME
      ,[Fecha Ingreso a Sucursal de Distribución] DATE
      ,[Hora Ingreso Sucursal de Distribución] TIME
      ,[Fecha 1er visita] DATE
      ,[Hora 1er visita] TIME
      ,[Motivo 1er visita] VARCHAR(50)
      ,[Fecha 2da visita] DATE
      ,[Hora 2da visita] TIME
      ,[Motivo 2da visita] VARCHAR(50)
      ,[Fecha 3er visita] DATE
      ,[Hora 3er visita] TIME
      ,[Motivo 3er visita] VARCHAR(50)
      ,[Fecha Ingreso a Custodia] DATE
      ,[Hora Ingreso a Custodia] TIME
      ,[Días Restantes de Custodia] VARCHAR(50)
      ,[Domicilio de la Sucursal] VARCHAR(300)
      ,[Datos del Receptor] VARCHAR(50)
      ,[Geolocalizacion] VARCHAR(50)
      ,[Constancia electrónica de entrega] VARCHAR(300)
	  ,[Zona de Entrega] VARCHAR(50)
      ,[Avance del Proceso] VARCHAR(50)
      ,[Efectividad de Entrega] INT
      ,[LD FF] INT
      ,[LD PROCES] INT
      ,[LD ENTREGA] INT
      ,[LD TOTAL] INT
      ,[Promesa] INT
      ,[GAP] INT
      ,[Cumple Promesa] VARCHAR(50)
      ,[Op Logistico] VARCHAR(50)
);
USE Delivery;

INSERT INTO Delivery.dbo.Despacho

SELECT
    TU.[N�mero de pedido] AS [N�mero de pedido]
    ,TU.Remito AS [Remito]
    ,TU.[T&T] AS [T&T]
    ,TU.Cuid AS [Cuid]
    ,TU.[Fecha de Creacion del Pedido]  AS [Fecha de Creacion del Pedido]
    ,TU.[Fecha ultimo estado de MEC]  AS [Fecha ultimo estado de MEC]
    ,TU.[N� Cuenta] AS [N� Cuenta]
    ,TU.[Factura de venta] AS [Factura de venta]
    ,TU.Estado AS [Estado]
    ,TU.[Fulfillment Status] AS [Fulfillment Satus]
    ,TU.[Tracking status] AS [Tracking Status]
    ,TU.[Estado MEC] AS [Estado MEC]
    ,TU.[Descripci�n estado MEC] AS [Descripci�n estado MEC]
    ,TU.[Tipo Gesti�n] AS [Tipo Gesti�n]
    ,TU.[Tipo Producto] AS [Tipo Producto]
    ,TU.[Descripcion del Producto] AS [Descripcion del Producto]
    ,TU.NMU AS [NMU]
    ,TU.[IMEI-IMSI] AS [IMEI-IMSI]
    ,TU.[Canal Venta] AS [Canal Venta]
    ,TU.[Equipo Creador] AS [Equipo Creador]
    ,TU.[Usuario Creador] AS [Usuario Creador]
    ,TU.[Bodega Delivery] AS [Bodega Delivery]
    ,CASE
        WHEN EXISTS (SELECT 1 FROM dbo.union_CRMMEC WHERE TU.Cuid = 'AD*') THEN 'ANDREANI'
        WHEN EXISTS (SELECT 1 FROM dbo.union_CRMMEC WHERE TU.Cuid = 'UR*') THEN 'URBANO'
        /* lo dejo comentado - WHEN EXISTS (SELECT 1 FROM dbo.MEC WHERE TU.Cuid = 'SP*') THEN 'SMART POST'*/
        ELSE ''
    END AS [Operador Logistico]
    ,CASE 
        WHEN T1.Estado = T3.Estado AND T1.[Estado Detallado] = T3.[Estado detallado] THEN T3.[Avance de la Distribuci�n]
        ELSE ''
    END AS [Tipo de entrega]/*FALTA REVISION*/
    ,CASE
        WHEN TU.[Tipo Gesti�n] = 'Venta' THEN '400015616'
        WHEN TU.[Tipo Gesti�n] = 'Cambio de SIM' THEN '400015619'
        WHEN TU.[Tipo Gesti�n] = 'Cambio de SIM Siniestro' THEN '400015619'/* VER SI SE LLAMA ASI*/
        ELSE ''
    END AS [ID Contrato distribucion]
    ,COALESCE(T1.[CP del Destinatario], T2.[Codigo Postal]) AS [CP]
    ,T1.[Sucursal de Distribuci�n] AS [Sucursal de Distribuci�n]
    ,T1.Destinatario AS [Destinatario]
    ,T1.[Domicilio del Destinatario] AS [Domicilio del Destinatario]
    ,T1.Provincia AS [Provincia]
    ,T1.[Localidad del Destinatario] AS [Localidad del Destinatario]
    ,COALESCE(T1.Estado, CASE
        WHEN TU.Cuid LIKE 'AD%' AND T2.[Estado] = 'DEVUELTO' AND TU.[Estado MEC] = 'Siniestro' THEN 'SINIESTRO'
        ELSE T2.Estado
    END) AS [Estado del Correo]
    /* Urbano va a tener todos los datos pero cuando diga 'Devuelto' y en MEC 'Devuelto en el Almacen' */
    ,T1.[Estado Detallado] AS [Estado Detallado]
    ,T1.[�ltima Novedad] AS [Ultima Novedad]
    ,TRY_CONVERT(DATE, T1.[Fecha �ltima Novedad]) AS [Fecha Ultima Novedad]
    ,T1.[Motivo Novedad Final] AS [Motivo Novedad Final]
    ,COALESCE(TRY_CONVERT(DATE, T1.[Fecha Alta]), TRY_CONVERT(DATE, T2.[Fecha PI])) AS [Fecha Alta]
    ,FORMAT(T1.[Hora Alta],'HH:mm') AS [Hora Alta]
    ,COALESCE(TRY_CONVERT(DATE, T1.[Fecha Admisi�n]), TRY_CONVERT(DATE, T2.[Fecha GE])) AS [Fecha Admisi�n]
    ,FORMAT(T1.[Hora Admisi�n],'HH:mm') AS [Hora Admisi�n]
    ,COALESCE(TRY_CONVERT(DATE, T1.[Fecha Inicio Distribuci�n]), TRY_CONVERT(DATE, T2.[Fecha AS])) AS [Fecha Inicio Distribuci�n]
    ,FORMAT(T1.[Hora Inicio Distribuci�n],'HH:mm') AS [Hora Inicio Distribuci�n]
    ,COALESCE(TRY_CONVERT(DATE, T1.[Fecha Ingreso a Sucursal de Distribuci�n]), TRY_CONVERT(DATE, T2.[Fecha AR])) AS [Fecha Ingreso a Sucursal de Distribuci�n]
    ,FORMAT(T1.[Hora Ingreso a Sucursal de Distribuci�n],'HH:mm') AS [Hora Ingreso Sucursal de Distribuci�n]
    ,COALESCE(TRY_CONVERT(DATE, T1.[Fecha Visita 1]), TRY_CONVERT(DATE, T2.[Fecha 1ra Visita])) AS [Fecha 1er visita]
    ,FORMAT(T1.[Hora Visita 1],'HH:mm') AS [Hora 1er visita]
    ,COALESCE(T1.[Motivo V1], T2.[Motivo]) AS [Motivo 1er visita]
    ,COALESCE(TRY_CONVERT(DATE, T1.[Fecha Visita 2]), TRY_CONVERT(DATE, T2.[Fecha 2da Visita])) AS [Fecha 2da visita]
    ,FORMAT(T1.[Hora Visita 2],'HH:mm') AS [Hora 2da visita]
    ,COALESCE(T1.[Motivo V2], T2.[Motivo]) AS [Motivo 2da visita]
    ,T1.[Fecha Visita 3] AS [Fecha 3er visita]
    ,T1.[Hora Visita 3] AS [Hora 3er visita]
    ,T1.[Motivo V3] AS [Motivo 3er visita]
    ,COALESCE(T1.[Fecha Ingreso a Custodia], T2.[En custodia]) AS [Fecha Ingreso a Custodia]
    ,T1.[Hora Ingreso a Custodia] AS [Hora Ingreso a Custodia]
    ,T1.[D�as Restantes de Custodia] AS [D�as Restantes de Custodia]
    ,T1.[Informacion Sucursal] AS [Domicilio de la Sucursal]
    ,T1.Recibido AS [Datos del Receptor]
    ,T1.Geolocalizaci�n AS [Geolocalizacion]
    ,T1.Digitalizaci�n AS [Constancia electr�nica de entrega]
    ,'' AS [Zona Correo]
    ,'' AS [Zona de Entrega]
    ,'' AS [Efectividad de Entrega]
    ,'' AS [LD FF]
    ,'' AS [LD PROCES]
    ,'' AS [LD ENTREGA]
    ,'' AS [LD TOTAL]
    ,'' AS [Promesa]
    ,'' AS [GAP]
    ,'' AS [Cumple Promesa]

FROM dbo.union_CRMMEC AS TU
LEFT JOIN dbo.Andreani AS T1 ON TU.[T&T] = T1.[Nro Andreani]
LEFT JOIN dbo.Urbano AS T2 ON TU.Remito = SUBSTRING(T2.[Codigo Pedido], 4, LEN(T2.[Codigo Pedido]))
CROSS JOIN dbo.Normalizarstatus AS T3
WHERE T2.[Codigo Pedido] IS NOT NULL;

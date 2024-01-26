--Limpieza de temporales
/**DELETE Delivery.dbo.MEC;
DELETE Delivery.dbo.CRM;
DELETE Delivery.dbo.Urbano;
DELETE Delivery.dbo.Andreani;**/
DELETE Delivery.dbo.union_CRMMEC;
DELETE Delivery.dbo.Despachos;
--*******************************************
--ARREGLO MEC
/**UPDATE CRM
SET [Delivery_Transaction_ID] =
    CASE
        WHEN CRM.[Delivery_Transaction_ID] <> '' THEN
            SUBSTRING(CRM.[Delivery_Transaction_ID], 4, LEN(CRM.[Delivery_Transaction_ID]))
        ELSE ''
    END;**/
--*******************************************
--union CRM
Use Delivery

INSERT INTO delivery.dbo.union_CRMMEC([Número de Pedido], Remito, [T&T], Cuid, [Fecha de Creacion del Pedido],
    [Fecha ultimo estado de MEC], [N° Cuenta], [Factura de venta], Estado, [Fulfillment Status], [Tracking Status],
    [Estado MEC], [Descripción estado MEC], [Tipo Gestión], [Tipo Producto], [Descripcion del Producto], NMU,
    [IMEI-IMSI], [Canal Venta], [Equipo Creador], [Usuario Creador], [Bodega Delivery])

SELECT
    C.[Número de pedido],
	M.remito,
	M.nrotracking,
    M.prodciud,
    C.[Fecha de creación],
    M.fechaingreso,
    C.[Account Integration Id],
    C.[Legal Invoice Number],
    C.Estado,
    C.[Fulfillment Status],
    C.[Tracking status],
    M.estadodescripcion,
    M.eventodescripcion,
    C.Gestion,
    C.[Product Type],
    C.[Product: Nombre del producto],
    M.prodcodigo,
    M.prodnroserie,
    C.[Originating Channel],
    C.[Origin Store Location: Name1],
    C.[Creado por: Alias],
    C.[Origin Store Location: Associated Warehouse]
FROM
    Delivery.dbo.CRM as C
JOIN
    Delivery.dbo.MEC as M
ON
    C.[Delivery Transaction ID] = M.remito;

--***********************************************
--Insertar Datos
USE Delivery;

INSERT INTO Delivery.dbo.Despachos

SELECT
	  TU.[Número de pedido] AS [Número de pedido]
      ,TU.Remito AS [Remito]
      ,TU.[T&T] AS [T&T]
      ,TU.Cuid AS [Cuid]
      ,TU.[Fecha de Creacion del Pedido] AS [Fecha de Creacion del Pedido]
      ,TU.[Fecha ultimo estado de MEC] AS [Fecha ultimo estado de MEC]
      ,TU.[N° Cuenta] AS [N° Cuenta]
      ,TU.[Factura de venta] AS [Factura de venta]
      ,TU.Estado AS [Estado]
      ,TU.[Fulfillment Status] AS [Fulfillment Satus]
      ,TU.[Tracking status] AS [Tracking Status]
      ,TU.[Estado MEC] AS [Estado MEC]
      ,TU.[Descripción estado MEC] AS [Descripción estado MEC]
      ,TU.[Tipo Gestión] AS [Tipo Gestión]
      ,TU.[Tipo Producto] AS [Tipo Producto]
      ,TU.[Descripcion del Producto] AS [Descripcion del Producto]
      ,TU.NMU AS [NMU]
      ,TU.[IMEI-IMSI] AS [IMEI-IMSI]
      ,TU.[Canal Venta] AS [Canal Venta]
      ,TU.[Equipo Creador]AS [Equipo Creador]
      ,TU.[Usuario Creador] AS [Usuario Creador]
      ,TU.[Bodega Delivery] AS [Bodega Delivery]
      ,CASE
        WHEN tu.Cuid LIKE 'AD%' THEN 'ANDREANI'
        WHEN tu.Cuid LIKE 'UR%' THEN 'URBANO'
		/* lo dejo comentado - WHEN Tu.Cuid = 'SP*') THEN 'SMART POST'*/
		ELSE ''
		END AS [Operador Logistico]
      ,'' AS [Tipo de entrega]/*FALTA REVISION*/
      ,'' AS [ID Contrato distribucion]
      ,CASE
		WHEN TU.Cuid LIKE 'AD%' THEN T1.[CP del Destinatario]
		ELSE T2.[Codigo Postal]
	   END AS [CP]
      ,T1.[Sucursal de Distribución] AS [Sucursal de Distribución]
      ,T1.Destinatario AS [Destinatario]
      ,T1.[Domicilio del Destinatario] AS [Domicilio del Destinatario]
      ,T1.Provincia AS [Provincia]
      ,T1.[Localidad del Destinatario] AS [Localidad del Destinatario]
      ,CASE
		WHEN TU.Cuid LIKE 'AD%' THEN T1.[Estado]
		ELSE 
			CASE
				WHEN TU.Cuid LIKE 'UR%' AND T2.[Estado] = 'DEVUELTO' AND TU.[Estado MEC] = 'Siniestro' THEN 'SINIESTRO'
				ELSE T2.Estado
			END
	   END AS [Estado del Correo]
	 /* Urbano va a tener todos los datos pero cuando diga 'Devuelto' y en MEC 'Devuelto en el Almacen' */
      ,T1.[Estado Detallado] AS [Estado Detallado]
      ,T1.[Última Novedad] AS [Ultima Novedad]
      ,T1.[Fecha Última Novedad] AS [Fecha Ultima Novedad]
      ,T1.[Motivo Novedad Final] AS [Motivo Novedad Final]
      ,CASE 
		WHEN  TU.Cuid LIKE 'AD%' THEN T1.[Fecha Alta]
		ELSE T2.[Fecha PI]
	  END AS [Fecha Alta]
      ,T1.[Hora Alta] AS [Hora Alta]
      ,CASE
		WHEN TU.Cuid LIKE 'AD%' THEN T1.[Fecha Admisión]
		ELSE T2.[Fecha GE]
	   END AS [Fecha Admisión]
      ,T1.[Hora Admisión] AS [Hora Admisión]
      ,CASE
		WHEN TU.Cuid LIKE 'AD%' THEN T1.[Fecha Inicio Distribución]
		ELSE T2.[Fecha AS]
	   END AS [Fecha Inicio Distribución]
      ,T1.[Hora Inicio Distribución] AS [Hora Inicio Distribución]
      ,CASE
		WHEN TU.Cuid LIKE 'AD%' THEN T1.[Fecha Ingreso a Sucursal de Distribución]
		ELSE T2.[Fecha AR] 
	   END AS [Fecha Ingreso a Sucursal de Distribución]
      ,T1.[Hora Ingreso a Sucursal de Distribución] AS [Hora Ingreso Sucursal de Distribución]
      ,CASE
		WHEN TU.Cuid LIKE 'AD%' THEN T1.[Fecha Visita 1]
		ELSE T2.[Fecha 1ra Visita] 
	   END AS [Fecha 1er visita]
      ,T1.[Hora Visita 1] AS [Hora 1er visita]
      ,CASE
		WHEN TU.Cuid LIKE 'AD%' THEN T1.[Motivo V1]
		ELSE T2.[Motivo] 
	   END AS [Motivo 1er visita]
      ,CASE
		WHEN TU.Cuid LIKE 'AD%' THEN T1.[Fecha Visita 2]
		ELSE T2.[Fecha 2da Visita]
	   END AS[Fecha 2da visita]
      ,T1.[Hora Visita 2] AS [Hora 2da visita]
      ,CASE
		WHEN TU.Cuid LIKE 'AD%' THEN T1.[Motivo V2]
		ELSE T2.[Motivo1]
	   END AS [Motivo 2da visita]
      ,T1.[Fecha Visita 3] AS [Fecha 3er visita]
      ,T1.[Hora Visita 3] AS [Hora 3er visita]
      ,T1.[Motivo V3] AS [Motivo 3er visita]
      ,CASE
		WHEN TU.Cuid LIKE 'AD%' THEN T1.[Fecha Ingreso a Custodia]
		ELSE T2.[En custodia]
	   END  AS [Fecha Ingreso a Custodia]
      ,T1.[Hora Ingreso a Custodia] AS [Hora Ingreso a Custodia]
      ,T1.[Días Restantes de Custodia] AS [Días Restantes de Custodia]
      ,T1.[Informacion Sucursal] AS [Domicilio de la Sucursal]
      ,T1.Recibido AS [Datos del Receptor]
      ,T1.Geolocalización AS [Geolocalizacion]
      ,T1.Digitalización AS [Constancia electrónica de entrega]
	  ,'' AS [Zona Correo]
	  ,'' AS [Zona de Entrega]
      ,'' AS [Efectividad de Entrega]
      ,'' AS [LD FF]
      ,'' AS [LD PROCES]
      ,'' AS [LD ENTREGA]
      ,'' AS [LD TOTAL]
      ,'' AS [Promesa]
      ,'' AS [GAP]
	  ,'' AS [Avance de la Distribucion]
      ,'' AS [Cumple Promesa]

FROM dbo.union_CRMMEC AS TU
LEFT JOIN dbo.Andreani AS T1 ON TU.[T&T] = T1.[Nro Andreani]
LEFT JOIN dbo.Urbano AS T2 ON TU.Remito =T2.[Codigo Pedido]
LEFT JOIN dbo.Normalizarstatus AS T3 ON T1.Estado = T3.Estado
--***********************************************************************************************************
---Actualizacion 1
/**UPDATE Delivery.dbo.Despachos
SET [Operador Logistico] =
	CASE
        WHEN tu.Cuid LIKE 'AD%' THEN 'ANDREANI'
        WHEN tu.Cuid LIKE 'UR%' THEN 'URBANO'
		/* lo dejo comentado - WHEN Tu.Cuid = 'SP*') THEN 'SMART POST'*/
		ELSE ''
	END
FROM Despachos AS TU
**/
UPDATE Despachos
SET [Tipo de entrega] = 
    CASE  
    WHEN TU.[Operador Logistico] = 'ANDREANI' THEN
        CASE
            WHEN T1.Estado = 'ENTREGADO' AND
                 T1.[Estado Detallado] = 'ENTREGADO' AND
                 T1.[Motivo Novedad Final] = 'Entregado en Sucursal Andreani'
                THEN 'Sucursal Correo'
            WHEN T1.Estado = 'ENTREGADO' AND
                 T1.[Estado Detallado] = 'ENTREGADO'
                THEN 'Sucursal Correo'
            WHEN T1.Estado = 'ENTREGADO' AND
                 T1.[Estado Detallado] = 'EN CUSTODIA' AND
                 T1.[Motivo Novedad Final] = ''
                THEN 'Sucursal Correo'
            ELSE ''
        END
    WHEN TU.[Operador Logistico] = 'URBANO' THEN
        CASE
            WHEN T2.Estado = 'ENTREGADO' THEN 'En domicilio Cliente'
        END
    ELSE ''
	END
FROM Despachos AS TU
LEFT JOIN dbo.Andreani AS T1 ON TU.[T&T] = T1.[Nro Andreani]
LEFT JOIN dbo.Urbano AS T2 ON TU.Remito = T2.[Codigo Pedido]

UPDATE Delivery.dbo.Despachos
SET [ID Contrato distribucion] =
case
WHEN TU.[Tipo Gestión] = 'Venta' THEN '400015616'
		WHEN TU.[Tipo Gestión] = 'Venta PortIn' THEN '400015616'
        WHEN TU.[Tipo Gestión] = 'Cambio de SIM' THEN '400015619'
		WHEN TU.[Tipo Gestión] = 'Cambio de SIM Siniestro' THEN '400015619'
end
FROM Despachos AS TU

UPDATE Delivery.dbo.Despachos
SET [Avance de la Distribucion]=
CASE 
		WHEN T1.Estado = T3.Estado AND
		T1.[Estado Detallado]=T3.[Estado detallado]
		THEN T3.[Avance de la Distribución]
	   ELSE '' 
	   END
FROM Andreani AS T1 
JOIN Normalizarstatus AS T3 ON [OL]='ANDREANI'

UPDATE Delivery.dbo.Despachos
SET [Avance de la Distribucion]=
CASE 
		WHEN T1.Estado = T3.Estado
		THEN T3.[Avance de la Distribución]
	   ELSE '' 
	   END
FROM Urbano AS T1 
JOIN Normalizarstatus AS T3 ON [OL]='URBANO'

--***********************************************************************************************************
---Actualizacion 2
USE Delivery
UPDATE Delivery.dbo.Despachos

SET [Zona Correo] = CP.[ZONA CORREO]
FROM dbo.Despachos
INNER JOIN Delivery.dbo.CP ON Delivery.dbo.Despachos.CP = CP.CP;

UPDATE Delivery.dbo.Despachos

SET [Zona de Entrega] = CP.[ZONA DE ENTREGA]
FROM dbo.Despachos
INNER JOIN Delivery.dbo.CP ON Delivery.dbo.Despachos.CP = CP.CP;

UPDATE Delivery.dbo.Despachos
SET [Efectividad de Entrega] =
    CASE
        WHEN [Fecha 1er visita] IS NOT NULL AND [Fecha 2da visita] IS NULL THEN '1'
        WHEN [Fecha 2da visita] IS NOT NULL AND [Fecha 3er visita] IS NULL THEN '2'
        WHEN [Fecha 3er visita] IS NOT NULL THEN '3'
		Else ''
	END;
--------------------------------------------------------------------
UPDATE dbo.Despachos
SET [LD FF] =
    DATEDIFF(DAY, Despachos.[Fecha Alta], Despachos.[Fecha Admisión])

FROM dbo.Despachos 

UPDATE dbo.Despachos
SET [LD FF] = 
	CASE--------semana 1
		WHEN TW.Dia = 'Lunes' and [LD FF]=6 THEN [LD FF]-1
		WHEN TW.Dia = 'Lunes' and [LD FF]>=7 and [LD FF]<=12 THEN [LD FF]-2
		WHEN TW.Dia = 'Martes' and [LD FF]=5 THEN [LD FF]-1 
		WHEN TW.Dia = 'Martes' and [LD FF]>=6 and [LD FF]<=11 THEN [LD FF]-2
		WHEN TW.Dia = 'Miercoles' and [LD FF]=4 THEN [LD FF]-1
		WHEN TW.Dia = 'Miercoles' and [LD FF]>=5 and [LD FF]<=10  THEN [LD FF]-2
		WHEN TW.Dia = 'Jueves' and [LD FF]=3 THEN [LD FF]-1
		WHEN TW.Dia = 'Jueves' and [LD FF]>=4 and [LD FF]<=9 THEN [LD FF]-2 
        WHEN TW.Dia = 'Viernes' and [LD FF]=3 THEN [LD FF]-1
		WHEN TW.Dia = 'Viernes' and [LD FF]>=3 and [LD FF]<=8 THEN [LD FF]-2
        WHEN TW.Dia = 'Sábado' and [LD FF]=1 THEN [LD FF]-1
        WHEN TW.Dia = 'Domingo' and [LD FF]>=2 and [LD FF]<=7 THEN [LD FF]-2
		------------semana 2
		WHEN TW.Dia = 'Lunes' and [LD FF]=13 THEN [LD FF]-3
		WHEN TW.Dia = 'Lunes' and [LD FF]>=14 and [LD FF]<=19 THEN [LD FF]-4
		WHEN TW.Dia = 'Martes' and [LD FF]=12 THEN [LD FF]-3 
		WHEN TW.Dia = 'Martes' and [LD FF]>=13 and [LD FF]<=18 THEN [LD FF]-4
		WHEN TW.Dia = 'Miercoles' and [LD FF]=11 THEN [LD FF]-3	
		WHEN TW.Dia = 'Miercoles' and [LD FF]>=12 and [LD FF]<=17  THEN [LD FF]-4
		WHEN TW.Dia = 'Jueves' and [LD FF]=10 THEN [LD FF]-3
		WHEN TW.Dia = 'Jueves' and [LD FF]>=11 and [LD FF]<=16 THEN [LD FF]-4
        WHEN TW.Dia = 'Viernes' and [LD FF]=9 THEN [LD FF]-3
		WHEN TW.Dia = 'Viernes' and [LD FF]>=10 and [LD FF]<=15 THEN [LD FF]-4
        WHEN TW.Dia = 'Sábado' and [LD FF]=8 THEN [LD FF]-3
        WHEN TW.Dia = 'Domingo' and [LD FF]>=9 and [LD FF]<=14 THEN [LD FF]-4
        ELSE [LD FF]
    END

FROM dbo.Despachos AS TU
JOIN Delivery.dbo.WEEKEND AS TW ON TW.Fecha = TU.[Fecha Alta]
---------------------------------------------------------------

UPDATE dbo.Despachos
SET [LD PROCES] =
	DATEDIFF(DAY, Despachos.[Fecha Admisión], Despachos.[Fecha Inicio Distribución])
FROM dbo.Despachos 
INNER JOIN Delivery.dbo.WEEKEND AS TW ON Despachos.[Fecha Admisión]=TW.Fecha OR Despachos.[Fecha Inicio Distribución]=TW.Fecha;

UPDATE dbo.Despachos
SET [LD PROCES] = 
	CASE--------semana 1
		WHEN TW.Dia = 'Lunes' and [LD PROCES]=6 THEN [LD PROCES]-1
		WHEN TW.Dia = 'Lunes' and [LD PROCES]>=7 and [LD PROCES]<=12 THEN [LD PROCES]-2
		WHEN TW.Dia = 'Martes' and [LD PROCES]=5 THEN [LD PROCES]-1 
		WHEN TW.Dia = 'Martes' and [LD PROCES]>=6 and [LD PROCES]<=11 THEN [LD PROCES]-2
		WHEN TW.Dia = 'Miercoles' and [LD PROCES]=4 THEN [LD PROCES]-1
		WHEN TW.Dia = 'Miercoles' and [LD PROCES]>=5 and [LD PROCES]<=10  THEN [LD PROCES]-2
		WHEN TW.Dia = 'Jueves' and [LD PROCES]=3 THEN [LD PROCES]-1
		WHEN TW.Dia = 'Jueves' and [LD PROCES]>=4 and [LD PROCES]<=9 THEN [LD PROCES]-2 
        WHEN TW.Dia = 'Viernes' and [LD PROCES]=3 THEN [LD PROCES]-1
		WHEN TW.Dia = 'Viernes' and [LD PROCES]>=3 and [LD PROCES]<=8 THEN [LD PROCES]-2
        WHEN TW.Dia = 'Sábado' and [LD PROCES]=1 THEN [LD PROCES]-1
        WHEN TW.Dia = 'Domingo' and [LD PROCES]>=2 and [LD PROCES]<=7 THEN [LD PROCES]-2
		------------semana 2
		WHEN TW.Dia = 'Lunes' and [LD PROCES]=13 THEN [LD PROCES]-3
		WHEN TW.Dia = 'Lunes' and [LD PROCES]>=14 and [LD PROCES]<=19 THEN [LD PROCES]-4
		WHEN TW.Dia = 'Martes' and [LD PROCES]=12 THEN [LD PROCES]-3 
		WHEN TW.Dia = 'Martes' and [LD PROCES]>=13 and [LD PROCES]<=18 THEN [LD PROCES]-4
		WHEN TW.Dia = 'Miercoles' and [LD PROCES]=11 THEN [LD PROCES]-3	
		WHEN TW.Dia = 'Miercoles' and [LD PROCES]>=12 and [LD PROCES]<=17  THEN [LD PROCES]-4
		WHEN TW.Dia = 'Jueves' and [LD PROCES]=10 THEN [LD PROCES]-3
		WHEN TW.Dia = 'Jueves' and [LD PROCES]>=11 and [LD PROCES]<=16 THEN [LD PROCES]-4
        WHEN TW.Dia = 'Viernes' and [LD PROCES]=9 THEN [LD PROCES]-3
		WHEN TW.Dia = 'Viernes' and [LD PROCES]>=10 and [LD PROCES]<=15 THEN [LD PROCES]-4
        WHEN TW.Dia = 'Sábado' and [LD PROCES]=8 THEN [LD PROCES]-3
        WHEN TW.Dia = 'Domingo' and [LD PROCES]>=9 and [LD PROCES]<=14 THEN [LD PROCES]-4
        ELSE [LD PROCES]
    END

FROM dbo.Despachos AS TU
JOIN Delivery.dbo.WEEKEND AS TW ON TW.Dia = TW.Dia
------------------------------------------------------------------------------------------
UPDATE dbo.Despachos
SET [LD ENTREGA]=
	DATEDIFF(DAY, Despachos.[Fecha Inicio Distribución], Despachos.[Fecha Ultima Novedad])
FROM dbo.Despachos 
INNER JOIN Delivery.dbo.WEEKEND AS TW ON Despachos.[Fecha Inicio Distribución]=TW.Fecha OR Despachos.[Fecha Ultima Novedad]=TW.Fecha;

UPDATE dbo.Despachos
SET [LD ENTREGA]=
        CASE--------semana 1
		WHEN TW.Dia = 'Lunes' and [LD ENTREGA]=6 THEN [LD ENTREGA]-1
		WHEN TW.Dia = 'Lunes' and [LD ENTREGA]>=7 and [LD ENTREGA]<=12 THEN [LD ENTREGA]-2
		WHEN TW.Dia = 'Martes' and [LD ENTREGA]=5 THEN [LD ENTREGA]-1 
		WHEN TW.Dia = 'Martes' and [LD ENTREGA]>=6 and [LD ENTREGA]<=11 THEN [LD ENTREGA]-2
		WHEN TW.Dia = 'Miercoles' and [LD ENTREGA]=4 THEN [LD ENTREGA]-1
		WHEN TW.Dia = 'Miercoles' and [LD ENTREGA]>=5 and [LD ENTREGA]<=10  THEN [LD ENTREGA]-2
		WHEN TW.Dia = 'Jueves' and [LD ENTREGA]=3 THEN [LD ENTREGA]-1
		WHEN TW.Dia = 'Jueves' and [LD ENTREGA]>=4 and [LD ENTREGA]<=9 THEN [LD ENTREGA]-2 
        WHEN TW.Dia = 'Viernes' and [LD ENTREGA]=3 THEN [LD ENTREGA]-1
		WHEN TW.Dia = 'Viernes' and [LD ENTREGA]>=3 and [LD ENTREGA]<=8 THEN [LD ENTREGA]-2
        WHEN TW.Dia = 'Sábado' and [LD ENTREGA]=1 THEN [LD ENTREGA]-1
        WHEN TW.Dia = 'Domingo' and [LD ENTREGA]>=2 and [LD ENTREGA]<=7 THEN [LD ENTREGA]-2
		------------semana 2
		WHEN TW.Dia = 'Lunes' and [LD ENTREGA]=13 THEN [LD ENTREGA]-3
		WHEN TW.Dia = 'Lunes' and [LD ENTREGA]>=14 and [LD ENTREGA]<=19 THEN [LD ENTREGA]-4
		WHEN TW.Dia = 'Martes' and [LD ENTREGA]=12 THEN [LD ENTREGA]-3 
		WHEN TW.Dia = 'Martes' and [LD ENTREGA]>=13 and [LD ENTREGA]<=18 THEN [LD ENTREGA]-4
		WHEN TW.Dia = 'Miercoles' and [LD ENTREGA]=11 THEN [LD ENTREGA]-3	
		WHEN TW.Dia = 'Miercoles' and [LD ENTREGA]>=12 and [LD ENTREGA]<=17  THEN [LD ENTREGA]-4
		WHEN TW.Dia = 'Jueves' and [LD ENTREGA]=10 THEN [LD ENTREGA]-3
		WHEN TW.Dia = 'Jueves' and [LD ENTREGA]>=11 and [LD ENTREGA]<=16 THEN [LD ENTREGA]-4
        WHEN TW.Dia = 'Viernes' and [LD ENTREGA]=9 THEN [LD ENTREGA]-3
		WHEN TW.Dia = 'Viernes' and [LD ENTREGA]>=10 and [LD ENTREGA]<=15 THEN [LD ENTREGA]-4
        WHEN TW.Dia = 'Sábado' and [LD ENTREGA]=8 THEN [LD ENTREGA]-3
        WHEN TW.Dia = 'Domingo' and [LD ENTREGA]>=9 and [LD ENTREGA]<=14 THEN [LD ENTREGA]-4
        ELSE [LD ENTREGA]
    END
FROM dbo.Despachos AS TU
JOIN Delivery.dbo.WEEKEND AS TW ON TW.Dia = TW.Dia
---------------------------------------------------------------------------------------------
UPDATE dbo.Despachos
SET [LD TOTAL]=
DATEDIFF(DAY, Despachos.[Fecha Alta], Despachos.[Fecha Ultima Novedad])

FROM dbo.Despachos 
INNER JOIN Delivery.dbo.WEEKEND AS TW ON Despachos.[Fecha Alta]=TW.Fecha OR Despachos.[Fecha Ultima Novedad]=TW.Fecha;

UPDATE dbo.Despachos
SET [LD TOTAL]=
CASE--------semana 1
		WHEN TW.Dia = 'Lunes' and [LD TOTAL]=6 THEN [LD TOTAL]-1
		WHEN TW.Dia = 'Lunes' and [LD TOTAL]>=7 and [LD TOTAL]<=12 THEN [LD TOTAL]-2
		WHEN TW.Dia = 'Martes' and [LD TOTAL]=5 THEN [LD TOTAL]-1 
		WHEN TW.Dia = 'Martes' and [LD TOTAL]>=6 and [LD TOTAL]<=11 THEN [LD TOTAL]-2
		WHEN TW.Dia = 'Miercoles' and [LD TOTAL]=4 THEN [LD TOTAL]-1
		WHEN TW.Dia = 'Miercoles' and [LD TOTAL]>=5 and [LD TOTAL]<=10  THEN [LD TOTAL]-2
		WHEN TW.Dia = 'Jueves' and [LD TOTAL]=3 THEN [LD TOTAL]-1
		WHEN TW.Dia = 'Jueves' and [LD TOTAL]>=4 and [LD TOTAL]<=9 THEN [LD TOTAL]-2 
        WHEN TW.Dia = 'Viernes' and [LD TOTAL]=3 THEN [LD TOTAL]-1
		WHEN TW.Dia = 'Viernes' and [LD TOTAL]>=3 and [LD TOTAL]<=8 THEN [LD TOTAL]-2
        WHEN TW.Dia = 'Sábado' and [LD TOTAL]=1 THEN [LD TOTAL]-1
        WHEN TW.Dia = 'Domingo' and [LD TOTAL]>=2 and [LD TOTAL]<=7 THEN [LD TOTAL]-2
		------------semana 2
		WHEN TW.Dia = 'Lunes' and [LD TOTAL]=13 THEN [LD TOTAL]-3
		WHEN TW.Dia = 'Lunes' and [LD TOTAL]>=14 and [LD TOTAL]<=19 THEN [LD TOTAL]-4
		WHEN TW.Dia = 'Martes' and [LD TOTAL]=12 THEN [LD TOTAL]-3 
		WHEN TW.Dia = 'Martes' and [LD TOTAL]>=13 and [LD TOTAL]<=18 THEN [LD TOTAL]-4
		WHEN TW.Dia = 'Miercoles' and [LD TOTAL]=11 THEN [LD TOTAL]-3	
		WHEN TW.Dia = 'Miercoles' and [LD TOTAL]>=12 and [LD TOTAL]<=17  THEN [LD TOTAL]-4
		WHEN TW.Dia = 'Jueves' and [LD TOTAL]=10 THEN [LD TOTAL]-3
		WHEN TW.Dia = 'Jueves' and [LD TOTAL]>=11 and [LD TOTAL]<=16 THEN [LD TOTAL]-4
        WHEN TW.Dia = 'Viernes' and [LD TOTAL]=9 THEN [LD TOTAL]-3
		WHEN TW.Dia = 'Viernes' and [LD TOTAL]>=10 and [LD TOTAL]<=15 THEN [LD TOTAL]-4
        WHEN TW.Dia = 'Sábado' and [LD TOTAL]=8 THEN [LD TOTAL]-3
        WHEN TW.Dia = 'Domingo' and [LD TOTAL]>=9 and [LD TOTAL]<=14 THEN [LD TOTAL]-4
        ELSE [LD TOTAL]
    END

FROM dbo.Despachos AS TU
JOIN Delivery.dbo.WEEKEND AS TW ON TW.Dia = TW.Dia
----------------------------------------------------------------------------------------------

UPDATE .dbo.Despachos
SET [Promesa] = CP.[Promesa de Entrega TERMINALES]
FROM dbo.Despachos
INNER JOIN Delivery.dbo.CP ON Delivery.dbo.Despachos.CP = CP.CP;
-----------------------------------------------------------------
UPDATE .dbo.Despachos
SET [GAP] = ([LD TOTAL] - [Promesa])
FROM dbo.Despachos;
--------------------------------------------------------------------------------------------
UPDATE .dbo.Despachos
SET [Cumple Promesa] =
	CASE
		WHEN ([GAP]<=0) THEN 'SI'
		WHEN ([GAP]>0) THEN 'NO'
		ELSE ''
	END
FROM dbo.Despachos

--***********************************************************************************************************
---Pegar a Historial



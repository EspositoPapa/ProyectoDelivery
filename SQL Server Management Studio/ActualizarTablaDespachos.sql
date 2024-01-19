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

UPDATE dbo.Despachos
SET [LD FF] =
    DATEDIFF(DAY, Despachos.[Fecha Alta], Despachos.[Fecha Admisión])
    - CASE
        WHEN Despachos.[Fecha Alta] = TW.Fecha AND TW.Dia = 'Viernes' THEN 2 
        WHEN Despachos.[Fecha Alta] = TW.Fecha AND TW.Dia = 'Sábado' THEN 2
        WHEN Despachos.[Fecha Alta] = TW.Fecha AND TW.Dia = 'Domingo' THEN 1
        ELSE 0
    END
    - CASE 
        WHEN Despachos.[Fecha Admisión] = TW.Fecha AND TW.Dia = 'Sábado' THEN 2
        WHEN Despachos.[Fecha Admisión] = TW.Fecha AND TW.Dia = 'Domingo' THEN 1
        ELSE 0
    END
FROM dbo.Despachos 
INNER JOIN Delivery.dbo.WEEKEND AS TW ON Despachos.[Fecha Alta]=TW.Fecha OR Despachos.[Fecha Admisión]=TW.Fecha;
UPDATE dbo.Despachos
SET [LD PROCES] =
	DATEDIFF(DAY, Despachos.[Fecha Admisión], Despachos.[Fecha Inicio Distribución])
    - CASE
        WHEN Despachos.[Fecha Admisión] = TW.Fecha AND TW.Dia = 'Viernes' THEN 2 
        WHEN Despachos.[Fecha Admisión] = TW.Fecha AND TW.Dia = 'Sábado' THEN 2
        WHEN Despachos.[Fecha Admisión] = TW.Fecha AND TW.Dia = 'Domingo' THEN 1
        ELSE 0
    END
    - CASE 
        WHEN Despachos.[Fecha Inicio Distribución] = TW.Fecha AND TW.Dia = 'Sábado' THEN 2
        WHEN Despachos.[Fecha Inicio Distribución] = TW.Fecha AND TW.Dia = 'Domingo' THEN 1
        ELSE 0
    END
FROM dbo.Despachos 
INNER JOIN Delivery.dbo.WEEKEND AS TW ON Despachos.[Fecha Admisión]=TW.Fecha OR Despachos.[Fecha Inicio Distribución]=TW.Fecha;

UPDATE dbo.Despachos
SET [LD ENTREGA]=
	DATEDIFF(DAY, Despachos.[Fecha Inicio Distribución], Despachos.[Fecha Ultima Novedad])
    - CASE
        WHEN Despachos.[Fecha Inicio Distribución] = TW.Fecha AND TW.Dia = 'Viernes' THEN 2 
        WHEN Despachos.[Fecha Inicio Distribución] = TW.Fecha AND TW.Dia = 'Sábado' THEN 2
        WHEN Despachos.[Fecha Inicio Distribución] = TW.Fecha AND TW.Dia = 'Domingo' THEN 1
        ELSE 0
    END
    - CASE 
        WHEN Despachos.[Fecha Ultima Novedad] = TW.Fecha AND TW.Dia = 'Sábado' THEN 2
        WHEN Despachos.[Fecha Ultima Novedad] = TW.Fecha AND TW.Dia = 'Domingo' THEN 1
        ELSE 0
    END
FROM dbo.Despachos 
INNER JOIN Delivery.dbo.WEEKEND AS TW ON Despachos.[Fecha Inicio Distribución]=TW.Fecha OR Despachos.[Fecha Ultima Novedad]=TW.Fecha;

UPDATE dbo.Despachos
SET [LD TOTAL]=
DATEDIFF(DAY, Despachos.[Fecha Alta], Despachos.[Fecha Ultima Novedad])
    - CASE
        WHEN Despachos.[Fecha Alta] = TW.Fecha AND TW.Dia = 'Viernes' THEN 2 
        WHEN Despachos.[Fecha Alta] = TW.Fecha AND TW.Dia = 'Sábado' THEN 2
        WHEN Despachos.[Fecha Alta] = TW.Fecha AND TW.Dia = 'Domingo' THEN 1
        ELSE 0
    END
    - CASE 
        WHEN Despachos.[Fecha Ultima Novedad] = TW.Fecha AND TW.Dia = 'Sábado' THEN 2
        WHEN Despachos.[Fecha Ultima Novedad] = TW.Fecha AND TW.Dia = 'Domingo' THEN 1
        ELSE 0
    END
FROM dbo.Despachos 
INNER JOIN Delivery.dbo.WEEKEND AS TW ON Despachos.[Fecha Alta]=TW.Fecha OR Despachos.[Fecha Ultima Novedad]=TW.Fecha;

UPDATE .dbo.Despachos
SET [Promesa] = CP.[Promesa de Entrega TERMINALES]
FROM dbo.Despachos
INNER JOIN Delivery.dbo.CP ON Delivery.dbo.Despachos.CP = CP.CP;

UPDATE .dbo.Despachos
SET [GAP] = ([LD TOTAL] - [Promesa])
FROM dbo.Despachos;

UPDATE .dbo.Despachos
SET [Cumple Promesa] =
	CASE
		WHEN ([GAP]<=0) THEN 'SI'
		WHEN ([GAP]>0) THEN 'NO'
		ELSE ''
	END
FROM dbo.Despachos

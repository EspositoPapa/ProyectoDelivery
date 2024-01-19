UPDATE dbo.Despachos
SET [LD FF] =
    CASE 
        WHEN Despachos.[Fecha Alta] = TW.Fecha AND TW.Dia = 'Jueves' AND Despachos.[LD FF] =2 THEN Despachos.[LD FF] - 1
		WHEN Despachos.[Fecha Alta] = TW.Fecha AND TW.Dia = 'Jueves' AND Despachos.[LD FF] > 2 THEN Despachos.[LD FF] - 2
		WHEN Despachos.[Fecha Alta] = TW.Fecha AND TW.Dia = 'Miércoles' AND Despachos.[LD FF] =3 THEN Despachos.[LD FF] - 1
        WHEN Despachos.[Fecha Alta] = TW.Fecha AND TW.Dia = 'Miércoles' AND Despachos.[LD FF] > 3 THEN Despachos.[LD FF] - 2
		WHEN Despachos.[Fecha Alta] = TW.Fecha AND TW.Dia = 'Martes' AND Despachos.[LD FF] = 4 THEN Despachos.[LD FF] - 1
        WHEN Despachos.[Fecha Alta] = TW.Fecha AND TW.Dia = 'Martes' AND Despachos.[LD FF] > 4 THEN Despachos.[LD FF] - 2
		WHEN Despachos.[Fecha Alta] = TW.Fecha AND TW.Dia = 'Lunes' AND Despachos.[LD FF] = 5 THEN Despachos.[LD FF] - 1
        WHEN Despachos.[Fecha Alta] = TW.Fecha AND TW.Dia = 'Lunes' AND Despachos.[LD FF] > 5 THEN Despachos.[LD FF] - 2
        WHEN Despachos.[LD FF] = '' THEN 0
        ELSE Despachos.[LD FF]
    END
FROM Delivery.dbo.Despachos AS TD -- Corregido el nombre de la tabla
LEFT JOIN Delivery.dbo.WEEKEND AS TW ON TD.[Fecha Alta]=TW.Fecha OR TD.[Fecha Admisión]=TW.Fecha;
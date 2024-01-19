INSERT INTO Delivery.dbo.Feriados
SELECT Feriados.Fecha FROM OPENROWSET(BULK 'Documentos/Feriados.txt', SINGLE_CLOB) AS Fecha;
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);

UPDATE Feriados
SET Mes = CASE 
                    WHEN MONTH(fecha) = 01 THEN 'ENERO'
                    WHEN MONTH(fecha) = 02 THEN 'FEBRERO'
					WHEN MONTH(fecha) = 03 THEN 'MARZO'
					WHEN MONTH(fecha) = 04 THEN 'ABRIL'
					WHEN MONTH(fecha) = 05 THEN 'MAYO'
					WHEN MONTH(fecha) = 06 THEN 'JUNIO'
					WHEN MONTH(fecha) = 07 THEN 'JULIO'
					WHEN MONTH(fecha) = 08 THEN 'AGOSTO'
					WHEN MONTH(fecha) = 09 THEN 'SEPTIEMBRE'
					WHEN MONTH(fecha) = 10 THEN 'OCTUBRE'
					WHEN MONTH(fecha) = 11 THEN 'NOVIEMBRE'
					WHEN MONTH(fecha) = 12 THEN 'DICIEMBRE'
                    -- Si no tiene sale mensaje de error como pop it (falta config) sino por ahora dejar NULL la columna
                    ELSE NULL  -- 
                END;
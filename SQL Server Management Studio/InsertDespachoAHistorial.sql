USE Delivery;

INSERT INTO Despachos_Historial
SELECT *
FROM Despachos
WHERE NOT EXISTS (
    SELECT 1
    FROM Despachos_Historial
    WHERE Despachos.Remito = Despachos_Historial.Remito
);

/** estados ( que estado es necesario para pegar automatico en despacho historial */
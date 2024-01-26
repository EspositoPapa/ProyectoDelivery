USE Delivery;

INSERT INTO Despachos_Historial
SELECT *
FROM Despachos
WHERE NOT EXISTS (
    SELECT 1
    FROM Despachos_Historial
    WHERE Despachos.Remito = Despachos_Historial.Remito
)
AND ([Estado del Correo] = 'ENTREGADO' OR Despachos.[Fecha de Creacion del Pedido] < DATEADD(day, -15, GETDATE()));

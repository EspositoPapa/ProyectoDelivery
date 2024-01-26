INSERT INTO Despachos_Historial
SELECT *
FROM Delivery.dbo.[0_DESPACHOS_FAN]
WHERE NOT EXISTS (
    SELECT 1
    FROM Despachos_Historial
    WHERE Delivery.dbo.[0_DESPACHOS_FAN].[Trans ID - Remito] = Despachos_Historial.Remito
)
AND ([Estado del Correo] = 'ENTREGADO' OR Despachos.[Fecha de Creacion del Pedido] < DATEADD(day, -15, GETDATE()));
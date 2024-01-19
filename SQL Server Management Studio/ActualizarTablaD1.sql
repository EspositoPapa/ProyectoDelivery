UPDATE Delivery.dbo.Despachos
SET [Operador Logistico] =
	CASE
        WHEN tu.Cuid LIKE 'AD%' THEN 'ANDREANI'
        WHEN tu.Cuid LIKE 'UR%' THEN 'URBANO'
		/* lo dejo comentado - WHEN Tu.Cuid = 'SP*') THEN 'SMART POST'*/
		ELSE ''
	END
FROM Despachos AS TU

UPDATE Despachos
SET [Tipo de entrega] =
CASE 
		WHEN tu.Cuid LIKE 'AD%'
			THEN
				CASE
					WHEN T1.Estado = T4.Estado AND
					T1.[Estado Detallado]=T4.[Estado detallado] AND
					T1.[Motivo Novedad Final]=T4.[Motivo novedad final ] THEN T4.[Tipo de entrega]
				END
		ELSE CASE
				WHEN T2.Estado = 'ENTREGADO' THEN 'En domicilio Cliente'
			END
END
FROM Despachos as TU
LEFT JOIN dbo.Andreani AS T1 ON TU.[T&T] = T1.[Nro Andreani]
LEFT JOIN dbo.Urbano AS T2 ON TU.Remito = SUBSTRING(T2.[Codigo Pedido], 4, LEN(T2.[Codigo Pedido]))
LEFT JOIN Normalizador_Tipodeentrega AS T4 ON t1.Estado=t4.Estado


UPDATE Delivery.dbo.Despachos
SET [ID Contrato distribucion] =
case
WHEN TU.[Tipo Gestión] = 'Venta' THEN '400015616'
		WHEN TU.[Tipo Gestión] = 'Venta PortIn' THEN '400015616'
        WHEN TU.[Tipo Gestión] = 'Cambio de SIM' THEN '400015619'
		WHEN TU.[Tipo Gestión] = 'Cambio de SIM Siniestro' THEN '400015619'
end
FROM Despachos AS TU


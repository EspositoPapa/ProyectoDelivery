Use Delivery

INSERT INTO delivery.dbo.union_CRMMEC([Número de Pedido], Remito, [T&T], Cuid, [Fecha de Creacion del Pedido],
    [Fecha ultimo estado de MEC], [N° Cuenta], [Factura de venta], Estado, [Fulfillment Status], [Tracking Status],
    [Estado MEC], [Descripción estado MEC], [Tipo Gestión], [Tipo Producto], [Descripcion del Producto], NMU,
    [IMEI-IMSI], [Canal Venta], [Equipo Creador], [Usuario Creador], [Bodega Delivery])

SELECT
    C.[Número_de_pedido],
	M.remito,
	M.nrotracking,
    M.prodciud,
    C.[Fecha_de_creación],
    M.fechaingreso,
    C.[Account_Integration_Id],
    C.[Legal_Invoice_Number],
    C.Estado,
    C.[Fulfillment_Status],
    C.[Tracking_status],
    M.estadodescripcion,
    M.eventodescripcion,
    C.Gestion,
    C.[Product_Type],
    C.[Product_Nombre_del_producto],
    M.prodcodigo,
    M.prodnroserie,
    C.[Originating_Channel],
    C.[Origin_Store_Location_Name],
    C.[Creado_por_Alias],
    C.Origin_Store_Location_Associated_Warehouse
FROM
    Delivery.dbo.CRM as C
JOIN
    Delivery.dbo.MEC as M
ON
    C.[Delivery_Transaction_ID] = M.remito;
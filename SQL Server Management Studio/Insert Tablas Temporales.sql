INSERT INTO Delivery.dbo.MEC (fechaingreso, fechaenvio, remito, estadoid, estadodescripcion, eventoid, eventodescripcion, datosadicionales, fechaevento, ordenventa, nrotracking, gestion, nroregistro, prodcodigo, prodcantidad, prodciud, prodnroserie)
SELECT *
FROM OPENROWSET(
    'Microsoft.ACE.OLEDB.12.0',
    'Text; Database=C:\Users\u623067\Desktop\ProyectoE2E\ProyectoDelivery\Colecciones Despacho\; HDR=YES; Format=Delimited(|);',
    'SELECT fechaingreso, fechaenvio, remito, estadoid, estadodescripcion, eventoid, eventodescripcion, datosadicionales, fechaevento, ordenventa, nrotracking, gestion, nroregistro, prodcodigo, prodcantidad, prodciud, prodnroserie FROM MEC.txt'
);
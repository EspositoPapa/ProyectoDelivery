USE Delivery;

-- Insertar datos desde Excel a la tabla dbo.Andreani
INSERT INTO dbo.Andreani ([Nro Andreani]
,[Referencia Cliente]
,Remito
,[Nro Pedido]
,Remitente
,Servicio
,Contrato
,[Sucursal de Alta]
,[Sucursal de Distribución]
,Bultos
,Peso
,[Peso Aforado]
,Volumen
,[Valor Declarado]
,Destinatario
,[Domicilio del Destinatario]
,Provincia
,[Localidad del Destinatario]
,[CP del Destinatario]
,Estado
,[Estado Detallado]
,[óltima Novedad]
,[Fecha óltima Novedad]
,[Hora óltima Novedad]
,[Motivo Novedad Final]
,[Fecha Novedad Final]
,[Hora Novedad Final]
,[Ref Cliente 1]
,[Ref Cliente 2]
,[Ref Cliente 3]
,[Ref Cliente 4]
,[Ref Cliente 5]
,[Nro de Componentes]
,Componentes
,[Importe a cobrar]
,[Fecha Probable Entrega]
,[Fecha Pactada]
,[Hora Pactada]
,[Fecha Repactada]
,[Hora Repactada]
,[Fecha Ingreso Pedido]
,[Hora Ingreso Pedido]
,[Fecha Alta]
,[Hora Alta]
,[Fecha Admisión]
,[Hora Admisión]
,[Fecha Inicio Distribución]
,[Hora Inicio Distribución]
,[Fecha Ingreso a Sucursal de Distribución]
,[Hora Ingreso a Sucursal de Distribución]
,[Fecha Visita 1]
,[Hora Visita 1]
,[Motivo V1]
,[Fecha Visita 2]
,[Hora Visita 2]
,[Motivo V2]
,[Fecha Visita 3]
,[Hora Visita 3]
,[Motivo V3]
,[Fecha Ingreso a Custodia]
,[Hora Ingreso a Custodia]
,[Dóas Restantes de Custodia]
,[Informacion Sucursal]
,[Fecha de Rendición]
,[Hora de Rendición]
,[Nro de Informe de Rendición]
,Recibido
,Geolocalización
,Digitalización
)
SELECT [Nro Andreani]
,[Referencia Cliente]
,Remito
,[Nro Pedido]
,Remitente
,Servicio
,Contrato
,[Sucursal de Alta]
,[Sucursal de Distribución]
,Bultos
,Peso
,[Peso Aforado]
,Volumen
,[Valor Declarado]
,Destinatario
,[Domicilio del Destinatario]
,Provincia
,[Localidad del Destinatario]
,[CP del Destinatario]
,Estado
,[Estado Detallado]
,[óltima Novedad]
,[Fecha óltima Novedad]
,[Hora óltima Novedad]
,[Motivo Novedad Final]
,[Fecha Novedad Final]
,[Hora Novedad Final]
,[Ref Cliente 1]
,[Ref Cliente 2]
,[Ref Cliente 3]
,[Ref Cliente 4]
,[Ref Cliente 5]
,[Nro de Componentes]
,Componentes
,[Importe a cobrar]
,[Fecha Probable Entrega]
,[Fecha Pactada]
,[Hora Pactada]
,[Fecha Repactada]
,[Hora Repactada]
,[Fecha Ingreso Pedido]
,[Hora Ingreso Pedido]
,[Fecha Alta]
,[Hora Alta]
,[Fecha Admisión]
,[Hora Admisión]
,[Fecha Inicio Distribución]
,[Hora Inicio Distribución]
,[Fecha Ingreso a Sucursal de Distribución]
,[Hora Ingreso a Sucursal de Distribución]
,[Fecha Visita 1]
,[Hora Visita 1]
,[Motivo V1]
,[Fecha Visita 2]
,[Hora Visita 2]
,[Motivo V2]
,[Fecha Visita 3]
,[Hora Visita 3]
,[Motivo V3]
,[Fecha Ingreso a Custodia]
,[Hora Ingreso a Custodia]
,[Dóas Restantes de Custodia]
,[Informacion Sucursal]
,[Fecha de Rendición]
,[Hora de Rendición]
,[Nro de Informe de Rendición]
,Recibido
,Geolocalización
,Digitalización --
FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0', 'Excel 12.0;Database=C:\Users\u623067\Desktop\ProyectoE2E\ProyectoDelivery\Colecciones Despacho\TMS OL- Reporte Andreani.xlxs;HDR=YES', 'SELECT * FROM [Export]');
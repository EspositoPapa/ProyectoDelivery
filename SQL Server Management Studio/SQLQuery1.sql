Use Delivery;

INSERT INTO dbo.Table_1 (NOMBRE,REMITO,DIRECCION,EMAIL,PRODUCTO,PRECIO)
VALUES
	('Marina','A1','CHECO 123','email@example.com','Iphon 13',1000),
	('Jorge','A2','miralla 21','email@example.com','Samsung S21',1600),
	('Tom','A3','Pompeya 1024','email@example.com','Iphon 15',1700)


INSERT INTO dbo.Table_2 (NOMBRE,REMITO,DIRECCION,EMAIL,PRODUCTO,PRECIO)
VALUES
	('Raquel','B1','UHJF 45','email@example.com','TV 50"',1000),
	('Lucila','B2','CAUPOLITAN 412','email@example.com','TV 32"',700),
	('Micaela','B3','OLIDEN 1','email@example.com','MONITO 20"',300),
	('Leila','B4','SEFORA 501','email@example.com','TV HD 65"',1250),
	('Tom','B5','Pompeya 1024','email@example.com','TV HD 65"',1250)

INSERT INTO dbo.Table_Unica (REMITO,FECHA,HORA,MOTIVO)
VALUES
	('A1', '20231211', '15:00', 'REGALO'),
    ('A2', '20231212', '10:20', 'COMPRA'),
    ('B1', '20231212', '10:50', 'COMPRA'),
    ('B2', '20231212', '11:47', 'REGALO'),
    ('B3', '20231212', '12:00', 'REGALO'),
    ('B4', '20231212', '12:00', 'COMPRA'),
    ('A3', '20231213', '09:00', 'REGALO'),
    ('B5', '20231213', '09:00', 'REGALO');

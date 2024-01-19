DECLARE @deleteCmd NVARCHAR(1000);
SET @deleteCmd = 'DEL "C:\document\Pruebas\Despachos.csv"';
EXEC xp_cmdshell @deleteCmd;

DECLARE @exportCmd NVARCHAR(1000);
SET @exportCmd = 'bcp "SELECT * FROM Delivery.dbo.Despacho_prueba" queryout "C:\document\Pruebas\Despachos.csv" -c -t, -T -S' + @@servername;
!-- 
EXEC xp_cmdshell @exportCmd;
use lab3
go

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ

BEGIN TRAN

SELECT * FROM Shops

WAITFOR DELAY '00:00:15'

SELECT * FROM Shops

COMMIT TRAN


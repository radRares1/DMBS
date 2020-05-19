use lab3
go

--SET DEADLOCK_PRIORITY LOW
SET DEADLOCK_PRIORITY HIGH

BEGIN TRAN

UPDATE Buyers SET bName= 'deadlock buyer T1' WHERE id = 3

WAITFOR DELAY '00:00:10'

UPDATE Shops SET sName='deadlock shop T1' where id = 16

COMMIT TRAN


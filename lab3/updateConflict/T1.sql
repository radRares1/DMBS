use lab3
go

-- so the update conflict occurs when two different transactions try to update the same row at aprox
-- the same time under a optimistic isolation level
-- so we'll just set the iso lvl to snapshot and try to update the same thing here in T1 and T2


SET TRANSACTION ISOLATION LEVEL SNAPSHOT

WAITFOR DELAY '00:00:10'

BEGIN TRAN

UPDATE Shops SET sName = 'shop1' where id = 4

WAITFOR DELAY '00:00:10'

COMMIT TRAN
use lab3
go


--so dirty reads happen then we read data that was not committed by a certain transaction
--in this example we update in T1 and rollback in T2 we do two selects and we can see the updated data
--which shouldn't happend because we rolled it back
--so in order in avoid this, we just set in T2 the isolation level to READ COMMITTED and it won't happen
--this can be seen in T2-Solution.sql

BEGIN TRAN

UPDATE Shops SET
sName='updatedShopName' WHERE id = 5
WAITFOR DELAY '00:00:10'

ROLLBACK TRAN
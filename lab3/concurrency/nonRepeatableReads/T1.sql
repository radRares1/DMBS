use lab3
go


-- dirty reads occur when an existing row changes within a transaction
-- we do the update here in T1 and in T2 we select one time before T2 is committed and after, we have two different values for the same row
-- we prevent that by setting the isolation level of the transaction that reads the data (T2) with REAPEATABLE READ
-- this can be seen in T2-Solution.sql

INSERT INTO Shops values
('newShop','newAddress')

BEGIN TRAN

WAITFOR DELAY '00:00:10'

UPDATE Shops SET address='updatedAddress' WHERE sName='newShop'

COMMIT TRAN

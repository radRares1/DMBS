use lab3
go

-- phantom data appears when new rows are added and appear within the transaction
-- we insert data here in T1 and in T2 we will see two set of data, which is not ok
-- in order to fix this we set the isolation level to SERIALIZABLE
-- this can be seen in T2-Solution.sql

BEGIN TRAN

WAITFOR DELAY '00:00:10'

INSERT INTO Shops VALUES
('phantomShop','phantomAddress')

COMMIT TRAN
use lab3
go


BEGIN TRAN

SELECT * FROM Shops WHERE id = 4

--initial value 'shop1','address1'

WAITFOR DELAY '00:00:10'
SELECT * FROM Shops where id = 5

UPDATE Shops SET sName = 'updateConflict - T2' WHERE id=4
--should throw error

COMMIT TRAN


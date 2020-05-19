use lab3
go

BEGIN TRAN

--we create a deadlock scenario by makeing the two transactions T1 and T2 to get readlocks on the same data
--while they wait for eachother to give up the loks
--so, the one with the lowest priority is chosen to throw(or the cheapest or one at random, depending on the equality of the first two)
--the solution is to prepare ourselfes with setting one known priority for these transaction
--in this example I chose to give the high priority for T2 (in T2-Solution.sql)

UPDATE Shops SET sName='deadlock shop T1' where id = 16

WAITFOR DELAY '00:00:10'

UPDATE Buyers SET bName= 'deadlock buyer T1' WHERE id = 3

COMMIT TRAN


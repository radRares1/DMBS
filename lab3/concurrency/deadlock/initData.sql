use lab3
go

--insert data for the deadlock exercise

insert into Shops values('deadlockName','deadlockAddress')
insert into Buyers values('buyerName',200)

select * from Shops
select * from Buyers

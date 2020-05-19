use lab3
go

--here we log the data using some selects
--and calling the procesdures from the two addManyToMany files

--first

--this addMtoN is the one that commits only if everything works

--good data for first method
SELECT * FROM Shops
SELECT * FROM Buyers
SELECT * FROM ShopzAndBuyerz

exec addMtoN 'goodName',100,'goodShopName','goodAddress';

SELECT * FROM Shops
SELECT * FROM Buyers
SELECT * FROM ShopzAndBuyerz

--bad data for first method
SELECT * FROM Shops
SELECT * FROM Buyers
SELECT * FROM ShopzAndBuyerz

exec addMtoN '',-5,'','';

SELECT * FROM Shops
SELECT * FROM Buyers
SELECT * FROM ShopzAndBuyerz

--second

--this addMtoN2 is the one that commits as much as possible, meaning everything that doesn't have an error is committed

--good data for second method
SELECT * FROM Shops
SELECT * FROM Buyers
SELECT * FROM ShopzAndBuyerz

exec addMtoN2 'goodName2',100,'goodShopName2','goodAddress2';

SELECT * FROM Shops
SELECT * FROM Buyers
SELECT * FROM ShopzAndBuyerz


--bad data for second method
SELECT * FROM Shops
SELECT * FROM Buyers
SELECT * FROM ShopzAndBuyerz

exec addMtoN2 'goodName3',300,'','';

SELECT * FROM Shops
SELECT * FROM Buyers
SELECT * FROM ShopzAndBuyerz





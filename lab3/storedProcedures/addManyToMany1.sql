use lab3
go

CREATE PROCEDURE addMtoN
@bName varchar(100),
@budget int,
@sName varchar(100),
@sAddress varchar(100)
AS
BEGIN

	BEGIN TRAN
		--so this is the first scenario where we don't try to save 
		--only if everything works
		--that being said, i'm putting all the three adds in one transaction
		--if it works I commit
		--if it does not, I rollback :D

		BEGIN TRY
			
			exec [dbo].addBuyer @bName, @budget;
			exec [dbo].addShop @sName, @sAddress;

			declare @bId INT
			declare @sId INT

			set @bId  = (select IDENT_CURRENT('Buyers'))
			set @sId = (select IDENT_CURRENT('Shops'))

			INSERT INTO ShopzAndBuyerz values(@sId,@bId)

			COMMIT TRAN
			SELECT 'Transaction done'

		END TRY

		BEGIN CATCH
		ROLLBACK TRAN
		SELECT 'Transaction denied'
		END CATCH

END


use lab3
go

CREATE PROCEDURE addMtoN2
@bName varchar(100),
@budget int,
@sName varchar(100),
@sAddress varchar(100)
AS
BEGIN

		DECLARE @ok1 BIT
		DECLARE @ok2 BIT
		SET @ok1=0
		SET @ok2=0

		--so this is the second scenario where we try to save as much info as possible
		--that being said, i'm putting each add in a transaction
		--and for each of them, commit them individually based on their success/error


		--shop tran
		BEGIN TRAN
		BEGIN TRY
				
			exec [dbo].addShop @sName, @sAddress;
			
			declare @sId INT
			
			set @sId = (select IDENT_CURRENT('Shops'))


			COMMIT TRAN
			SET @ok1=1
			SELECT 'Shop Transaction done'

		END TRY

		BEGIN CATCH
		ROLLBACK TRAN
		SELECT 'Shop Transaction denied'
		END CATCH


		--buyer tran
		BEGIN TRAN
		BEGIN TRY
			
			exec [dbo].addBuyer @bName, @budget;

			declare @bId INT
			
			set @bId  = (select IDENT_CURRENT('Buyers'))
			

			COMMIT TRAN
			SET @ok1=2
			SELECT 'Buyers Transaction done'

		END TRY

		BEGIN CATCH
		ROLLBACK TRAN
		SELECT 'Buyers Transaction denied'
		END CATCH

		--many to many tran
		BEGIN TRAN
		BEGIN TRY
			
			IF(@ok1 = 1 and @ok2 = 1)
			BEGIN
				Insert into ShopzAndBuyerz values(@sId,@bId)
				COMMIT TRAN
				SELECT 'Many to Many Transaction done'
			END

			ELSE
			BEGIN
				RAISERROR('Cannot add to Many-Many because the references inserts failed',14,1)
			END

		END TRY

		BEGIN CATCH
		ROLLBACK TRAN
		SELECT 'Many to Many Transaction denied'
		END CATCH

END


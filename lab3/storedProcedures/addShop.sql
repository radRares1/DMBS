use lab3
go

--validation function
CREATE FUNCTION checkEmpty(@string varchar(100))
RETURNS INT 
BEGIN
	
	DECLARE	@return INT
	
	IF(@string IS NULL or @string = '')
		
	   SET @return = 0

	ELSE
	   
	   SET @return = 1
	
	RETURN @return 

END
GO

--add data to the Shop table
GO
CREATE PROCEDURE addShop
	@sName varchar(100),
	@sAddress varchar(100)
AS
BEGIN

	BEGIN TRAN
			BEGIN TRY

				if(dbo.checkEmpty(@sName) <>1)
					BEGIN
						RAISERROR('Name must not be empty',14,1)
					END
				
				if(dbo.checkEmpty(@sAddress) <> 1)
					BEGIN
						RAISERROR('Address must not be empty',14,1)
					END

				INSERT INTO Shops(sName,address) values(@sName,@sAddress)

				COMMIT TRAN
				SELECT 'TRANSACTION COMMITTED'

			END TRY

			BEGIN CATCH
			ROLLBACK TRAN
			SELECT 'TRANSACTION ROLLED BACK'
			END CATCH


END
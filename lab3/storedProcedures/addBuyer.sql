use lab3
go

--validation function
CREATE FUNCTION checkEmptyName(@string varchar(100))
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

--validation function
CREATE FUNCTION checkNegative(@number int)
RETURNS INT 
BEGIN
	
	DECLARE	@return INT
	
	IF(@number < 0)
		
	   SET @return = 0

	ELSE
	   
	   SET @return = 1
	
	RETURN @return 

END
go

--add data in the Buyer table
GO
CREATE PROCEDURE addBuyer
	@bName varchar(100),
	@budget int
AS
BEGIN

	BEGIN TRAN
			BEGIN TRY

				if(dbo.checkEmptyName(@bName) <>1)
					BEGIN
						RAISERROR('Name must not be empty',14,1)
					END
				
				if(dbo.checkNegative(@budget) <> 1)
					BEGIN
						RAISERROR('Budget cannot be negative',14,1)
					END

				INSERT INTO Buyers(bName,budget) values(@bName,@budget)

				COMMIT TRAN
				SELECT 'TRANSACTION COMMITTED'

			END TRY

			BEGIN CATCH
			
				ROLLBACK TRAN
				SELECT 'TRANSACTION ROLLED BACK'

			END CATCH


END

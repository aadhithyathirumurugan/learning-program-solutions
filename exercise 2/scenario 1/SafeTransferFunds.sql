CREATE PROCEDURE SafeTransferFunds
    @FromAccountId INT,
    @ToAccountId INT,
    @Amount DECIMAL(18,2)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        IF (SELECT Balance FROM Accounts WHERE AccountId = @FromAccountId) < @Amount
        BEGIN
            THROW 50001, 'Insufficient funds.', 1;
        END

        UPDATE Accounts
        SET Balance = Balance - @Amount
        WHERE AccountId = @FromAccountId;

        UPDATE Accounts
        SET Balance = Balance + @Amount
        WHERE AccountId = @ToAccountId;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;

        INSERT INTO ErrorLog(ErrorMessage, ErrorTime)
        VALUES (ERROR_MESSAGE(), GETDATE());

        PRINT 'Transfer failed. See ErrorLog for details.';
    END CATCH
END;

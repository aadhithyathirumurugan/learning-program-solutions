CREATE TRIGGER CheckTransactionRules
ON Transactions
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM inserted
        WHERE 
            (TransactionType = 'Withdrawal' AND Amount > (SELECT Balance FROM Accounts WHERE Accounts.AccountID = inserted.AccountID)) OR
            (TransactionType = 'Deposit' AND Amount <= 0)
    )
    BEGIN
        RAISERROR('Transaction violates business rules.', 16, 1)
        ROLLBACK TRANSACTION
        RETURN
    END

    INSERT INTO Transactions (TransactionID, AccountID, TransactionType, Amount, TransactionDate)
    SELECT TransactionID, AccountID, TransactionType, Amount, TransactionDate
    FROM inserted
END;

CREATE FUNCTION HasSufficientBalance
(
    @AccountID INT,
    @Amount DECIMAL(18,2)
)
RETURNS BIT
AS
BEGIN
    DECLARE @Balance DECIMAL(18,2)

    SELECT @Balance = Balance FROM Accounts WHERE AccountID = @AccountID

    IF @Balance IS NULL OR @Balance < @Amount
        RETURN 0

    RETURN 1
END;

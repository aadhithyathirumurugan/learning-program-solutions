CREATE TRIGGER UpdateCustomerLastModified
ON Customers
AFTER UPDATE
AS
BEGIN
    UPDATE Customers
    SET LastModified = GETDATE()
    FROM Customers C
    INNER JOIN inserted I ON C.CustomerID = I.CustomerID
END;

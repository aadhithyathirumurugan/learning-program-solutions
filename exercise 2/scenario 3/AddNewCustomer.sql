CREATE PROCEDURE AddNewCustomer
    @CustomerID INT,
    @CustomerName VARCHAR(100),
    @Email VARCHAR(100)
AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT 1 FROM Customers WHERE CustomerID = @CustomerID)
        BEGIN
            THROW 50003, 'Customer ID already exists.', 1;
        END

        INSERT INTO Customers(CustomerID, CustomerName, Email)
        VALUES (@CustomerID, @CustomerName, @Email);
    END TRY
    BEGIN CATCH
        INSERT INTO ErrorLog(ErrorMessage, ErrorTime)
        VALUES (ERROR_MESSAGE(), GETDATE());

        PRINT 'Customer insertion failed. See ErrorLog for details.';
    END CATCH
END;

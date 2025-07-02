CREATE PROCEDURE UpdateSalary
    @EmployeeID INT,
    @PercentageIncrease DECIMAL(5,2)
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM Employees WHERE EmployeeID = @EmployeeID)
        BEGIN
            THROW 50002, 'Employee not found.', 1;
        END

        UPDATE Employees
        SET Salary = Salary + (Salary * @PercentageIncrease / 100)
        WHERE EmployeeID = @EmployeeID;

    END TRY
    BEGIN CATCH
        INSERT INTO ErrorLog(ErrorMessage, ErrorTime)
        VALUES (ERROR_MESSAGE(), GETDATE());

        PRINT 'Salary update failed. See ErrorLog for details.';
    END CATCH
END;

CREATE PROCEDURE UpdateEmployeeBonus
    @DepartmentID INT,
    @BonusPercentage DECIMAL(5,2)
AS
BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * @BonusPercentage / 100)
    WHERE DepartmentID = @DepartmentID;
END;

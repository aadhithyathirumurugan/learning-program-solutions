CREATE OR REPLACE PACKAGE EmployeeManagement AS
    PROCEDURE HireEmployee(p_ID IN NUMBER, p_Name IN VARCHAR2, p_Salary IN NUMBER, p_DepartmentID IN NUMBER);
    PROCEDURE UpdateEmployee(p_ID IN NUMBER, p_Name IN VARCHAR2, p_Salary IN NUMBER);
    FUNCTION GetAnnualSalary(p_ID IN NUMBER) RETURN NUMBER;
END EmployeeManagement;

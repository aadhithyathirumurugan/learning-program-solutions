CREATE OR REPLACE PACKAGE CustomerManagement AS
    PROCEDURE AddCustomer(p_ID IN NUMBER, p_Name IN VARCHAR2, p_Email IN VARCHAR2);
    PROCEDURE UpdateCustomer(p_ID IN NUMBER, p_Name IN VARCHAR2, p_Email IN VARCHAR2);
    FUNCTION GetCustomerBalance(p_ID IN NUMBER) RETURN NUMBER;
END CustomerManagement;

DECLARE
  v_due_date DATE;
  v_name     VARCHAR2(100);
BEGIN
  FOR loan IN (
    SELECT l.LoanID, c.CustomerName, l.DueDate
    FROM Loans l
    JOIN Customers c ON l.CustomerID = c.CustomerID
    WHERE l.DueDate BETWEEN SYSDATE AND SYSDATE + 30
  ) LOOP
    DBMS_OUTPUT.PUT_LINE(
      'Reminder: Dear ' || loan.CustomerName || 
      ', your loan (ID: ' || loan.LoanID || 
      ') is due on ' || TO_CHAR(loan.DueDate, 'DD-MON-YYYY')
    );
  END LOOP;
END;

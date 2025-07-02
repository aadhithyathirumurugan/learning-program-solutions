DECLARE
    CURSOR cur_transactions IS
        SELECT CustomerID, TransactionID, Amount, TransactionDate
        FROM Transactions
        WHERE TRUNC(TransactionDate, 'MM') = TRUNC(SYSDATE, 'MM');

    v_CustomerID     Transactions.CustomerID%TYPE;
    v_TransactionID  Transactions.TransactionID%TYPE;
    v_Amount         Transactions.Amount%TYPE;
    v_TransactionDate Transactions.TransactionDate%TYPE;
BEGIN
    OPEN cur_transactions;
    LOOP
        FETCH cur_transactions INTO v_CustomerID, v_TransactionID, v_Amount, v_TransactionDate;
        EXIT WHEN cur_transactions%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_CustomerID ||
                             ', Transaction ID: ' || v_TransactionID ||
                             ', Amount: ' || v_Amount ||
                             ', Date: ' || v_TransactionDate);
    END LOOP;
    CLOSE cur_transactions;
END;

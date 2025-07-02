DECLARE
    CURSOR cur_accounts IS
        SELECT AccountID, Balance
        FROM Accounts;

    v_AccountID Accounts.AccountID%TYPE;
    v_Balance   Accounts.Balance%TYPE;
    v_Fee       CONSTANT NUMBER := 100;
BEGIN
    OPEN cur_accounts;
    LOOP
        FETCH cur_accounts INTO v_AccountID, v_Balance;
        EXIT WHEN cur_accounts%NOTFOUND;

        UPDATE Accounts
        SET Balance = Balance - v_Fee
        WHERE AccountID = v_AccountID;
    END LOOP;
    CLOSE cur_accounts;
    COMMIT;
END;

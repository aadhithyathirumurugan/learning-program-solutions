DECLARE
    CURSOR cur_loans IS
        SELECT LoanID, InterestRate, LoanAmount
        FROM Loans;

    v_LoanID        Loans.LoanID%TYPE;
    v_InterestRate  Loans.InterestRate%TYPE;
    v_LoanAmount    Loans.LoanAmount%TYPE;
BEGIN
    OPEN cur_loans;
    LOOP
        FETCH cur_loans INTO v_LoanID, v_InterestRate, v_LoanAmount;
        EXIT WHEN cur_loans%NOTFOUND;

        IF v_LoanAmount < 10000 THEN
            UPDATE Loans SET InterestRate = 5 WHERE LoanID = v_LoanID;
        ELSIF v_LoanAmount BETWEEN 10000 AND 50000 THEN
            UPDATE Loans SET InterestRate = 4.5 WHERE LoanID = v_LoanID;
        ELSE
            UPDATE Loans SET InterestRate = 4 WHERE LoanID = v_LoanID;
        END IF;
    END LOOP;
    CLOSE cur_loans;
    COMMIT;
END;

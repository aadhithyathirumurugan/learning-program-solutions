CREATE FUNCTION CalculateMonthlyInstallment
(
    @LoanAmount DECIMAL(18,2),
    @AnnualInterestRate DECIMAL(5,2),
    @LoanDurationYears INT
)
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE @MonthlyRate DECIMAL(10,8) = @AnnualInterestRate / 12 / 100
    DECLARE @TotalMonths INT = @LoanDurationYears * 12
    DECLARE @Installment DECIMAL(18,2)

    IF @MonthlyRate = 0
        SET @Installment = @LoanAmount / @TotalMonths
    ELSE
        SET @Installment = @LoanAmount * @MonthlyRate / (1 - POWER(1 + @MonthlyRate, -@TotalMonths))

    RETURN @Installment
END;

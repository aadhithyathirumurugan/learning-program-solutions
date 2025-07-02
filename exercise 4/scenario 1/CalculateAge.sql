CREATE FUNCTION CalculateAge
(
    @DateOfBirth DATE
)
RETURNS INT
AS
BEGIN
    RETURN DATEDIFF(YEAR, @DateOfBirth, GETDATE()) 
           - CASE WHEN MONTH(@DateOfBirth) > MONTH(GETDATE()) 
                    OR (MONTH(@DateOfBirth) = MONTH(GETDATE()) AND DAY(@DateOfBirth) > DAY(GETDATE())) 
                 THEN 1 ELSE 0 END
END;

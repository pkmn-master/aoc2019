-- part one
-- select SUM((Mass / 3) - 2) from dbo.Day1

SET NOCOUNT ON

DECLARE @fuel TABLE (
	Id INT NOT NULL,
	Mass INT NOT NULL,
	Extra INT NOT NULL
);

INSERT INTO @fuel (Id, Mass, Extra)
SELECT Id, (Mass / 3) - 2, (((Mass / 3) - 2) / 3) - 2
FROM dbo.Day1;

UPDATE @fuel 
SET extra = 0 
WHERE extra < 0;

WHILE EXISTS (SELECT 1 FROM @fuel WHERE Extra > 0)
BEGIN
	UPDATE @fuel SET Mass = Mass + Extra;
	UPDATE @fuel SET Extra = (Extra / 3) - 2;
	UPDATE @fuel SET Extra = 0 WHERE Extra < 0;
END

SELECT SUM(Mass) FROM @fuel;

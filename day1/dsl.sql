IF NOT EXISTS (
	SELECT 1 FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Day1'
)
BEGIN
	CREATE TABLE dbo.Day1 (
		Id INT NOT NULL IDENTITY(1, 1)
			CONSTRAINT [PK_Day1] PRIMARY KEY,
		Mass INT NOT NULL
	);
END
GO
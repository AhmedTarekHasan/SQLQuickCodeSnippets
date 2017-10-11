DECLARE @tableName varchar(max)
SET @tableName = 'YourTableOrViewName'


DECLARE @ColName varchar(max)
DECLARE @ColType varchar(max)
DECLARE @ColLength varchar(max)
DECLARE @ColGroup varchar(max)
SET @ColGroup = ''

DECLARE @temp TABLE
(
	ColName varchar(max)
	, ColType varchar(max)
	, ColLength varchar(max)
)

DECLARE MYCursor1 CURSOR FOR
SELECT * FROM @temp

INSERT INTO @temp
SELECT 
column_name AS [ColName]
, data_type AS [ColType]
, CHARacter_maximum_length AS [ColLength]
FROM information_schema.columns
WHERE table_name = @tableName

OPEN MYCursor1
FETCH NEXT FROM MYCursor1 
INTO
	@ColName
	, @ColType
	, @ColLength

WHILE @@FETCH_STATUS = 0
BEGIN
	SET @ColGroup = @ColGroup + ', ' + @ColName + ' ' + @ColType

	IF(@ColLength IS NOT NULL AND @ColLength <> 'NULL')
	BEGIN
		SET @ColGroup = @ColGroup + '(' + @ColLength + ')'
	END
	
	SET @ColGroup = @ColGroup + char(13) + char(10)
	
	FETCH NEXT FROM MYCursor1 
	INTO
		@ColName
		, @ColType
		, @ColLength	
END

CLOSE MYCursor1
DEALLOCATE MYCursor1

PRINT @ColGroup
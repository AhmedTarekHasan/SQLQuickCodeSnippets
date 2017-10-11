DECLARE MYCursor1 CURSOR FOR
	--select * from 

OPEN MYCursor1
FETCH NEXT FROM MYCursor1 
INTO
	--@ProjectID
	--, @FullUnitName

WHILE @@FETCH_STATUS = 0
BEGIN
	-- Main Code
	
	FETCH NEXT FROM MYCursor1 
	INTO
		--@ProjectID
		--, @FullUnitName
			
END

CLOSE MYCursor1
DEALLOCATE MYCursor1
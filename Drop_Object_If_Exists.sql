--Check if table exists in a database
IF EXISTS
(
	SELECT *
	FROM dbo.sysobjects
	WHERE id = object_id(N'[dbo].[enterTableNameHere]')
	AND OBJECTPROPERTY(id, N'IsUserTable') = 1
)

DROP TABLE [dbo].[enterTableNameHere]
GO


--Check if view exists in a database
IF EXISTS
(
	SELECT *
	FROM INFORMATION_SCHEMA.VIEWS
	WHERE TABLE_NAME = 'enterViewNameHere'
)

DROP VIEW [dbo].[enterViewNameHere]
GO


--Check if stored procedure exists in a database
IF EXISTS
(
	SELECT *
	FROM dbo.sysobjects
	WHERE id = object_id(N'[dbo].[enterStoredProcedureNameHere]')
	AND OBJECTPROPERTY(id, N'IsProcedure') = 1
)

DROP PROCEDURE [dbo].[enterStoredProcedureNameHere]
GO


--Check if user-defined function exists in a database
IF EXISTS
(
	SELECT  *
	FROM INFORMATION_SCHEMA.ROUTINES
	WHERE ROUTINE_NAME = 'enterFunctionNameHere'
	AND ROUTINE_SCHEMA = 'dbo'
	AND ROUTINE_TYPE = 'FUNCTION'
)

DROP FUNCTION [dbo].[enterFunctionNameHere]
GO


--Check if user-defined table type exists in a database
IF EXISTS
(
	SELECT * 
	FROM sys.types 
	WHERE is_table_type = 1 
	AND name = 'enterTableTypeNameHere'
)

DROP TYPE [dbo].[enterTableTypeNameHere]
GO


--Check if table index exists in a database
IF EXISTS
(
	SELECT * 
	FROM sys.indexes 
	WHERE name='YourIndexName'
	AND object_id = OBJECT_ID('YourTableName')
)

DROP INDEX [YourIndexName] ON [dbo].[YourTableName]
GO
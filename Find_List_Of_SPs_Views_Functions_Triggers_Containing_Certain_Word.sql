use [DbName] --Database name
GO

DECLARE @SearchText varchar(max)
SET @SearchText='KeyWord' --The (word)/(like pattern) to search for

SELECT DISTINCT
'[' + s.[name] + '].[' + obj.name + ']' AS [ObjectName]
, obj.type_desc AS [Object Type]
, module.definition AS [Code]
, obj.create_date AS [Date Created]
, obj.modify_date AS [Date Modified]

FROM
sys.sql_modules module

INNER JOIN sys.objects obj
ON module.object_id = obj.object_id

INNER JOIN sys.schemas s
ON s.schema_id = obj.schema_id

WHERE module.definition Like '%' + @SearchText + '%'
   
GROUP BY obj.type_desc
, '[' + s.[name] + '].[' + obj.name + ']'
, module.definition
, obj.create_date
, obj.modify_date

ORDER BY obj.type_desc
, '[' + s.[name] + '].[' + obj.name + ']'
, module.definition
, obj.create_date
, obj.modify_date
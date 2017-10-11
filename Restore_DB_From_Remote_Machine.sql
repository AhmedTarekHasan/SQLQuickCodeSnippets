/*
1. Share the folder of the DB .bak files
2. Give it a sharing name (ex: eSOX_BCRS_DB_BackUps)
3. On the SQL server machine, create a mapped network drive for the shared folder (ex: \\Atarek-xp-4995\eSOX_BCRS_DB_BackUps)
4. Keep track of the mapped drive letter (ex: N)
5. Modify the script below with your values (shared path folder)
6. Run the script
*/

EXEC sp_configure 'show advanced options', 1
GO
RECONFIGURE
GO
EXEC sp_configure 'xp_cmdshell', 1
GO
RECONFIGURE
GO 

EXEC XP_CMDSHELL 'net use N: /delete'

EXEC XP_CMDSHELL 'net use N: \\Atarek-xp-4995\eSOX_BCRS_DB_BackUps'
--[N:] is the name of the "mapped network drive" created on the SQL server and pointing to the
--   shared folder on the other server
--[\\Atarek-xp-4995\] is the server name on which the folder is shared
--[eSOX_BCRS_DB_BackUps] is the name given to the folder when sharing (the sharing name NOT the shared folder name)


EXEC XP_CMDSHELL 'Dir N:'


/*
7. You can now find the drive N in SQL file system browser
*/
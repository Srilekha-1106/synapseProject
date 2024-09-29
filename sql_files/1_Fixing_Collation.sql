-- Create a database
CREATE DATABASE PROJECT_DB

-- Alter the database to handle collation errors
ALTER DATABASE PROJECT_DB
COLLATE Latin1_General_100_CI_AS_KS_SC_UTF8

-- Check if the query is running
SELECT [data].[Line Number], [data].[Month]
from 
OPENROWSET(
    BULK 'abfss://raw@srilekhasynapsestrgacc.dfs.core.windows.net/Unemployment.csv',
    FORMAT = 'CSV',
    HEADER_ROW = TRUE,
    PARSER_VERSION = '2.0'
)
WITH (
    [Line Number] VARCHAR(10),
    [Month] VARCHAR(10)
) as [data]
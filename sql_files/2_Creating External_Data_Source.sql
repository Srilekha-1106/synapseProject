-- Create a external data source so that there's no need to mention the entire link every single time in bulk
create EXTERNAL DATA SOURCE raw_container_path
with (LOCATION = 'abfss://raw@srilekhasynapsestrgacc.dfs.core.windows.net/')

-- Check whether it is working or not
SELECT [data].[Line Number], [data].[Month]
from 
OPENROWSET(
    BULK 'Unemployment.csv',
    DATA_SOURCE = 'raw_container_path',
    FORMAT = 'CSV',
    HEADER_ROW = TRUE,
    PARSER_VERSION = '2.0'
)
WITH (
    [Line Number] VARCHAR(10),
    [Month] VARCHAR(10)
) as [data]
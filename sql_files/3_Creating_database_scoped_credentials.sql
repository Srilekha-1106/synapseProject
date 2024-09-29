-- Create a master key
create master key ENCRYPTION by password = '6304000308@Dad'

-- Create a scoped credential
create database scoped CREDENTIAL MI 
with IDENTITY = 'Managed Identity'

-- Create external data source
create EXTERNAL DATA SOURCE managed_identity_path
with(
    LOCATION = 'https://managedidentitystrgacc.blob.core.windows.net/raw/',
    CREDENTIAL = MI
)

-- Ensure if we're able to retrieve the data from external location
SELECT [data].[Line Number], [data].[Month]
from 
OPENROWSET(
    BULK 'Unemployment.csv',
    DATA_SOURCE = 'managed_identity_path',
    FORMAT = 'CSV',
    HEADER_ROW = TRUE,
    PARSER_VERSION = '2.0'
)
WITH (
    [Line Number] VARCHAR(10),
    [Month] VARCHAR(10)
) as [data]
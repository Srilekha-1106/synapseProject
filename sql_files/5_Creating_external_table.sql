--Create external table format - CETAS
create external TABLE refined_exttable
with(
    LOCATION = 'extlocfolder',
    DATA_SOURCE = refined_container_path,
    FILE_FORMAT = parquet_format
)
AS SELECT  [Line Number],[Year],[Month], [State],[Labor Force],[Employed],[Unemployed],[Unemployment Rate],[Industry],[Gender],[Education Level],
    [Date Inserted],[Aggregation Level],[Data Accuracy]
FROM 
    OPENROWSET(
        BULK 'Unemployment.csv',
        DATA_SOURCE = 'raw_container_path',
        FORMAT = 'CSV',
        HEADER_ROW = TRUE,
        PARSER_VERSION = '2.0'
    ) as [data]
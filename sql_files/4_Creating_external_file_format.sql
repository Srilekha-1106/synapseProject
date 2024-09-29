--Create a file format
create EXTERNAL FILE FORMAT parquet_format 
WITH(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)

--Create an external datasource to store the transformed data
create EXTERNAL DATA SOURCE refined_container_path 
with(
    LOCATION = 'https://srilekhasynapsestrgacc.blob.core.windows.net/refined'
)
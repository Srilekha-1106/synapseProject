--Copying the data present in the processed container into dedicated sql pool using copy command
create table dbo.sqlDedicatedlPool_table
(
    [Education_Level] varchar(4000),
	 [Line_Number] int,
	 [Year] int,
	 [Month] nvarchar(4000),
	 [State] nvarchar(4000),
	 [Labor_Force] int,
	 [Employed] int,
	 [Unemployed] int,
	 [Industry] varchar(4000),
	 [Gender] varchar(4000),
	 [Date_Inserted] date,
	 [UnEmployed_Rate_Percentage] real,
	 [Min_Salary_USD] int,
	 [Max_Salary_USD] int,
	 [dense_rank] int
)
WITH(
    DISTRIBUTION = ROUND_ROBIN,
    CLUSTERED COLUMNSTORE INDEX
)

COPY INTO dbo.sqlDedicatedlPool_table
(Education_Level 1, Line_Number 2, Year 3, Month 4, State 5, Labor_Force 6, Employed 7, Unemployed 8, Industry 9, Gender 10, Date_Inserted 11, UnEmployed_Rate_Percentage 12, Min_Salary_USD 13, Max_Salary_USD 14, dense_rank 15)
FROM 'https://srilekhasynapsestrgacc.dfs.core.windows.net/processed/processed_data/'
WITH(
    FILE_TYPE = 'PARQUET'
)

select * from dbo.sqlDedicatedlPool_table

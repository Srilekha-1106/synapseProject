                                      
# Data Processing and Analysis Using Azure Synapse: From Ingestion to Power BI Reporting

## Project Overview
This project focuses on performing data analysis on employment data using Azure Synapse Analytics, following a comprehensive process of data ingestion, transformation, and reporting. 
The unemployment dataset, stored in a CSV file, is ingested into Azure Data Lake Storage and initially explored using Serverless SQL Pools. Data transformations, including handling duplicates 
and modifying columns, are performed using PySpark within the Spark Pool. The refined data is moved to the Processed Container via Synapse Pipelines and subsequently loaded into a 
Dedicated SQL Pool for advanced analysis and reporting through Power BI, providing insights into unemployment trends across states.
  
## Project Architecture:
![image](https://github.com/user-attachments/assets/0c2c6b55-358d-4fcb-904b-98e005b7d2bc)

## Steps and Implementation:
### 1.	Create a Resource Group
Initiate the project by creating a resource group in Azure. 
![image](https://github.com/user-attachments/assets/8840a882-b35e-4006-94b9-593e57b046d4)

### 2.	Create a Synapse Workspace
Set up an Azure Synapse workspace for managing and analyzing the data. 
![image](https://github.com/user-attachments/assets/2201c3c5-50bd-4ef8-98c4-12076cac4808)
![image](https://github.com/user-attachments/assets/3ed563d4-1a4c-4a2c-8a7f-8b2bb6a56936)

### 3.	Set Serverless SQL Pool Credentials
Assign a username and password to the Serverless SQL Pool. 
![image](https://github.com/user-attachments/assets/2e0e7f47-5d2f-4d6f-b1fc-50d8ac205b5e)

### 4.	Ingest Raw Data
Upload the raw unemployment data to a designated raw container in Azure Data Lake Storage.
![image](https://github.com/user-attachments/assets/c1b7e8af-f790-45b3-971f-52e10f0596d1)

### 5.	Open Synapse Studio
Access Synapse Studio and create an SQL notebook for further exploration.
### 6.	Create a Database
Set up a database to store external tables, data sources, and file formats.
### 7.	Resolve Collation Issues
Alter the table structure as needed to handle collation errors.
![image](https://github.com/user-attachments/assets/6f1d17ec-47d9-41d8-98c4-b6f89f228bf6)

### 8.	External Data Source Creation
Define an external data source to avoid including full URLs in SQL queries.
![image](https://github.com/user-attachments/assets/6cea4485-e1b5-45a8-aebb-a773033195f3)

### 9.	Assign Managed Identity to Storage Accounts
If additional storage accounts are created, grant access to the Synapse workspace via Managed Identity by assigning the Storage Blob Data Contributor role.
### 10.	Grant Access to Synapse Workspace
Assign Storage Blob Data Contributor role to the Synapse workspace through IAM settings. 
IAM->Add role assignments->Add storage blob data contributor role->Select members->Select synapse workspace->review and assign.
![image](https://github.com/user-attachments/assets/4b0bb767-ed91-4a31-89aa-259cbb825213)

### 11.	Connect New Storage Account to Synapse
Link new storage accounts to the Synapse workspace using Managed Identity through Synapse's Linked Services.
![image](https://github.com/user-attachments/assets/a4918aba-fcb7-48fb-9ce7-ca0d5462ca46)
![image](https://github.com/user-attachments/assets/3296b746-fa03-475a-a920-fe8db6295e73)

### 12.	Create Database Credentials
Create a master key and credentials to allow secure access to external resources from the database. Before creating a database scoped credential, the database must 
have a master key to protect the credential. Ensure the database has a master key to safeguard credentials.
![image](https://github.com/user-attachments/assets/5dd73405-57e8-4052-8af6-99a051f902b5)

### 13.	Create External File Format and Data Source
Establish external file formats and data sources for the refined container where transformed data is stored.
![image](https://github.com/user-attachments/assets/1e5015b9-1354-4ac6-9fa8-38c42db7cd41)

### 14.	Create External Tables
Build external tables to limit user access and reference externally stored data, such as the refined container.
![image](https://github.com/user-attachments/assets/5450be11-96da-4bbd-b546-36ad34eac31e)

### 15.	Transformation 1 - Handle Duplicates and Nulls:
Cleanse the dataset by eliminating duplicates and managing null values.
Perform all the transformations and write the cleaned data into a file in refined container.
![image](https://github.com/user-attachments/assets/212cd3ef-60ee-4108-ac73-d68a3632ed49)

###  16.	Transformation 2 - Modify Columns
Add or modify columns, such as calculating unemployment rates and cleaning redundant values. 
![image](https://github.com/user-attachments/assets/810f5584-8d17-48a6-b40f-6792515b50b7)

### 17.	Mount Point Setup
Create a mount point in a notebook to streamline access and avoid repeated long URLs. 
![image](https://github.com/user-attachments/assets/b3f9ca1d-e91d-47f4-89ac-128c24f36e1a)

### 18.	Transformation 3 - Joins for Salary Data
Perform joins to match education levels with salary data, then save the results in a parquet file within the refined folder. 
![image](https://github.com/user-attachments/assets/a0357c97-fb69-467c-a976-31f9b2381798)

### 19.	Transformation 4 - Format Column Names
Replace spaces in column names with underscores (e.g., “Line Number” becomes “Line_Number”). 
![image](https://github.com/user-attachments/assets/d4c1cad8-e5b8-48d9-a172-93832e6aed10)

### 20.	Transformation 5 - Rank Unemployment Rates
Apply the DENSE_RANK window function to rank unemployment rates by percentage.
![image](https://github.com/user-attachments/assets/74bea1ea-0764-4037-84f7-be4d2766cb44)

### 21.	Transformation 6 - Convert String Dates
Convert string-formatted dates to the correct date data type using the to_date function.
![image](https://github.com/user-attachments/assets/7d54c3b7-2cfe-418f-b094-9dcba01d2ece)

### 22.	Transformation 7 - Refine Schema and Remove Columns
`Remove unnecessary columns and define an explicit schema for the table 
![image](https://github.com/user-attachments/assets/a435a5a8-74ed-4a78-99f3-c7891a6e6fc0)

### 23.	Transfer Transformed Files to Refined Container 
Write the cleaned and transformed files into the refined container.
![image](https://github.com/user-attachments/assets/b83ff65d-8d41-4fe9-ac00-20c5d628aa27)

### 24.	Transfer to Processed Container
Move the refined data to a new processed container for further use.
![image](https://github.com/user-attachments/assets/9a8977f7-69ba-4938-9935-864aa3850156)

### 25.	Locate Processed Data
The processed data is now stored in the processed_data folder within the Processed container.
![image](https://github.com/user-attachments/assets/2eb1c266-d65e-45d9-a4e1-bd3839cb6589)

### 26.	Create a Dedicated SQL Pool 
Set up a dedicated SQL pool for advanced data querying.
![image](https://github.com/user-attachments/assets/b8076317-7228-4dd0-bc2e-f6c64f4d8ffe)

### 27.	Manual Data Copying
Use the SQL copy command to manually copy data into the dedicated SQL pool.
![image](https://github.com/user-attachments/assets/a8000df2-8e52-446c-9aa3-14bc768f8626)

### 28.	Pipeline Data Transfer
Automate data copying by creating a Synapse pipeline. Define source and destination values, and debug the pipeline. 
Navigate to integrate section->create a new pipeline->search for copy in activities
->modify source and sink values-> You also have the option to create a new table for the data to be copied ->debug
Retrieving the data from the table created in pipeline
![image](https://github.com/user-attachments/assets/640a4383-1cfc-4856-a0a4-e886bdbdc6fb)
![image](https://github.com/user-attachments/assets/ef38f3fa-08a5-4fa8-a71c-33e4858b2927)
![image](https://github.com/user-attachments/assets/7fca1976-b8a8-4d70-96da-2a047ffb6352)

### 29.	Bulk Load Data
Use the bulk load option to transfer data into the SQL pool efficiently. 
![image](https://github.com/user-attachments/assets/6f1c8e0d-5108-4bca-ab92-b6e5f0c93325)

## Connecting Power BI to the Dedicated SQL Pool
### 30.	Install Power BI
Download and install the Power BI desktop application. 
![image](https://github.com/user-attachments/assets/b7eacd89-1296-473c-bee9-95efb4aa2b75)

### 31.	Connect to Synapse
In Power BI, go to Get Data -> Azure -> Azure Synapse Analytics SQL, then paste the workspace SQL endpoint from the dedicated pool properties.
![image](https://github.com/user-attachments/assets/e64f0097-516a-4d43-b556-64e48ecdf2b8)

### 32.	Create Visualizations
Choose a table from the dedicated SQL pool and build visualizations.
![image](https://github.com/user-attachments/assets/c15b032c-dcbc-42ce-a4a1-47872c2808bc)

### 33.	User Setup - Alex
Create a new user (Alex) in Microsoft and assign them the Global Administrator role to access the Microsoft portal.
![image](https://github.com/user-attachments/assets/1d850f12-bb94-4ee7-b5cc-dd5b5926bf74)

### 34.	Grant Workspace Access 
Give Alex owner access to the Synapse workspace, allowing them to work with Power BI reports. Use Alex’s credentials to publish the Power BI report
### 35.	Publish Reports via Power BI 
Use Alex’s credentials to publish the Power BI report
![image](https://github.com/user-attachments/assets/1a12cd9a-234f-4b23-9407-6a7184e65039)

36.	Visualizations can also be created within the Synapse workspace. If Alex creates a visualization, all members with access to the workspace can view it.
![image](https://github.com/user-attachments/assets/1bfbe6e7-cc77-49b3-b038-df5c62d04ab0)

## Conclusion: 
This project demonstrates the use of Azure Synapse Analytics for efficient and scalable unemployment data analysis. Through a combination of Serverless SQL Pools, 
PySpark transformations, and Synapse Pipelines, the raw data is refined, processed, and stored in a Dedicated SQL Pool for deeper analysis. Finally, 
Power BI visualizations provide valuable insights into unemployment trends across various states, enabling data-driven decision-making.

/******************************************************************************************
*  Project      : Data Warehouse Initialization
*  Author       : Manoj
*  Database     : MySQL
*  Description  :
*     This script initializes the core structure of the Data Warehouse.
*     It safely creates:
*       1. A database named 'DataWareHouse' (only if it does not already exist)
*       2. Three schemas following the Medallion Architecture:
*            - bronze : Raw ingestion layer
*            - silver : Cleaned & transformed layer
*            - gold   : Business-ready analytics layer
*
*  Architecture :
*       Bronze  -->  Silver  -->  Gold
******************************************************************************************/


/******************************************************************************************
* STEP 1: Create Database (Only If It Does Not Exist)
******************************************************************************************/

-- Create the Data Warehouse database safely
CREATE DATABASE IF NOT EXISTS DataWareHouse;


-------------------------------------------------------------------------------------------
-- Switch context to the DataWareHouse database
-------------------------------------------------------------------------------------------
USE DataWareHouse;


/******************************************************************************************
* STEP 2: Create Schemas (Databases) for Medallion Architecture
* NOTE:
*   In MySQL, "SCHEMA" and "DATABASE" are the same thing.
*   To mimic bronze / silver / gold layers, we create schemas inside the same database
*   using logical naming conventions.
******************************************************************************************/

-- Bronze Layer: Raw data ingestion
CREATE SCHEMA IF NOT EXISTS bronze;

-- Silver Layer: Cleaned and transformed data
CREATE SCHEMA IF NOT EXISTS silver;

-- Gold Layer: Curated and analytics-ready data
CREATE SCHEMA IF NOT EXISTS gold;


/******************************************************************************************
* STEP 3: Validation
******************************************************************************************/

-- Verify schema creation
SELECT schema_name
FROM information_schema.schemata
WHERE schema_name IN ('bronze', 'silver', 'gold');


/******************************************************************************************
* END OF SCRIPT
******************************************************************************************/

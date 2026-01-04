-- ==========================================
-- NutriGuard AI | Snowflake Setup Script
-- AI for Good Hackathon
-- ==========================================

-- 1. Create Database
CREATE OR REPLACE DATABASE NUTRIGUARD_DB;

-- 2. Create Schema
CREATE OR REPLACE SCHEMA NUTRIGUARD_DB.HEALTH_DATA;

-- 3. Create Warehouse
CREATE OR REPLACE WAREHOUSE NUTRIGUARD_WH
WAREHOUSE_SIZE = 'XSMALL'
AUTO_SUSPEND = 60
AUTO_RESUME = TRUE;

-- 4. Use Context
USE DATABASE NUTRIGUARD_DB;
USE SCHEMA HEALTH_DATA;
USE WAREHOUSE NUTRIGUARD_WH;

-- 5. Create Health Records Table
CREATE OR REPLACE TABLE HEALTH_RECORDS (
    RECORD_ID STRING,
    PERSON_TYPE STRING,
    AGE INT,
    GENDER STRING,
    HEIGHT_CM FLOAT,
    WEIGHT_KG FLOAT,
    BMI FLOAT,
    DIET_SCORE INT,
    IMMUNIZATION_STATUS STRING,
    RISK_SCORE INT,
    RISK_LEVEL STRING,
    DISTRICT STRING,
    STATE STRING,
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

-- 6. Sample Query: High Risk Cases
SELECT *
FROM HEALTH_RECORDS
WHERE RISK_LEVEL = 'High';

-- 7. Aggregate Query: District-wise Risk Count
SELECT
    DISTRICT,
    COUNT(*) AS HIGH_RISK_COUNT
FROM HEALTH_RECORDS
WHERE RISK_LEVEL = 'High'
GROUP BY DISTRICT;

-- 8. (Optional) View for Analytics
CREATE OR REPLACE VIEW HIGH_RISK_VIEW AS
SELECT *
FROM HEALTH_RECORDS
WHERE RISK_LEVEL IN ('High', 'Medium');

-- ==========================================
-- End of Script
-- ==========================================

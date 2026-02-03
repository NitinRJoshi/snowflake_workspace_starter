
-- Set your session context (CI can also set these via CLI params)
-- USE ROLE <ROLE>;
-- USE WAREHOUSE <WAREHOUSE>;
-- USE DATABASE <DB_DEV>;
-- USE SCHEMA CORE;

-- Deploy in deterministic order from Git -> Snowflake
EXECUTE IMMEDIATE FROM @DEVOPS.COMMON.GIT_REPO/branches/dev/pipelines/schema_core.sql;
EXECUTE IMMEDIATE FROM @DEVOPS.COMMON.GIT_REPO/branches/dev/pipelines/dims/dim_customer_scd2.sql;
EXECUTE IMMEDIATE FROM @DEVOPS.COMMON.GIT_REPO/branches/dev/pipelines/dims/dim_product_scd2.sql;
EXECUTE IMMEDIATE FROM @DEVOPS.COMMON.GIT_REPO/branches/dev/facts/fact_sales.sql;
EXECUTE IMMEDIATE FROM @DEVOPS.COMMON.GIT_REPO/branches/dev/pipelines/tasks.sql;

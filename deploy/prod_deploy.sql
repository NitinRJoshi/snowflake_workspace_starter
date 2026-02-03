
-- USE ROLE <ROLE>;
-- USE WAREHOUSE <WAREHOUSE>;
-- USE DATABASE <DB_PROD>;
-- USE SCHEMA CORE;

EXECUTE IMMEDIATE FROM @DEVOPS.COMMON.GIT_REPO/branches/main/pipelines/schema_core.sql;
EXECUTE IMMEDIATE FROM @DEVOPS.COMMON.GIT_REPO/branches/main/pipelines/dims/dim_customer_scd2.sql;
EXECUTE IMMEDIATE FROM @DEVOPS.COMMON.GIT_REPO/branches/main/pipelines/dims/dim_product_scd2.sql;
EXECUTE IMMEDIATE FROM @DEVOPS.COMMON.GIT_REPO/branches/main/facts/fact_sales.sql;
EXECUTE IMMEDIATE FROM @DEVOPS.COMMON.GIT_REPO/branches/main/pipelines/tasks.sql;


-- Run as ACCOUNTADMIN (or a suitable admin role)
-- PURPOSE: Configure Git access and repository object in Snowflake

-- 1) API INTEGRATION (restrict to your provider/prefix)
CREATE OR REPLACE API INTEGRATION git_api_integration
  API_PROVIDER = git_https_api
  API_ALLOWED_PREFIXES = ('https://github.com/<ORG>/')
  ENABLED = TRUE;

-- 2) Database/Schema to house the repo object (adjust as desired)
CREATE DATABASE IF NOT EXISTS DEVOPS;
CREATE SCHEMA   IF NOT EXISTS DEVOPS.COMMON;

-- 3) GIT REPOSITORY object points to your GitHub repo
CREATE OR REPLACE GIT REPOSITORY DEVOPS.COMMON.GIT_REPO
  API_INTEGRATION = git_api_integration
  ORIGIN = 'https://github.com/<ORG>/<REPO>.git';

-- 4) (Optional) initial fetch/list
ALTER GIT REPOSITORY DEVOPS.COMMON.GIT_REPO FETCH;
LIST @DEVOPS.COMMON.GIT_REPO/branches/;

-- 5) (Optional) grant usage to roles that will deploy
-- GRANT USAGE ON INTEGRATION git_api_integration TO ROLE <ROLE>;
-- GRANT USAGE ON DATABASE DEVOPS TO ROLE <ROLE>;
-- GRANT USAGE ON SCHEMA DEVOPS.COMMON TO ROLE <ROLE>;
-- GRANT READ ON STAGE DEVOPS.COMMON.GIT_REPO TO ROLE <ROLE>;


# Snowflake CI/CD Starter (Workspaces + Git Integration + CLI)

This repo demonstrates a Snowflake-native CI/CD approach using:

- **Workspaces** for in-Snowflake development (Git-connected)
- **Declarative DDL** via `CREATE OR ALTER`
- **`EXECUTE IMMEDIATE FROM`** to run deployment SQL directly from Git
- **GitHub Actions + Snowflake CLI** for automated deploys (OIDC recommended)

> Replace placeholders like `<ORG>`, `<REPO>`, `<ACCOUNT_IDENTIFIER>`, `<ROLE>`, `<WAREHOUSE>`, `<DB_DEV>`, `<DB_PROD>` before running.

## Structure

```
/deploy
  dev_deploy.sql
  prod_deploy.sql
/infrastructure
  bootstrap.sql      -- create API INTEGRATION + GIT REPOSITORY (run once by admin)
/pipelines
  schema_core.sql
  tasks.sql
  /dims
    dim_customer_scd2.sql
    dim_product_scd2.sql
/facts
  fact_sales.sql
/.github/workflows
  deploy-dev.yml
  deploy-prod.yml
/.snowflake
  config.sample.toml
/docs
  architecture.md
/data/seeds
  load_demo_data.sql
```

## Quick Start

1. **Create API INTEGRATION and GIT REPOSITORY objects in Snowflake** (ACCOUNTADMIN):
   - Open `infrastructure/bootstrap.sql`
   - Replace `<ORG>`, `<REPO>` with your GitHub org+repo
   - Run the script in Snowflake (or via `snow sql -f`)

2. **Seed demo data (optional):**
   - Run `data/seeds/load_demo_data.sql` in your DEV database/schema

3. **Connect a Workspace to the Git repo** and develop in-UI.

4. **CI Deploy (DEV):** On push/merge to `dev`, GitHub Actions runs `deploy/dev_deploy.sql`.

5. **Promote to PROD:** Merge `dev` → `main`; Actions runs `deploy/prod_deploy.sql`.

See `/docs/architecture.md` for more details.

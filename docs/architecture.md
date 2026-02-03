
# Reference Architecture

```
               +-------------------------------+
               |             GIT               |
               |  (SQL, notebooks, workflows) |
               +---------------+---------------+
                               |
             commits/pulls     |
                               v
+------------------------------+------------------------------+
|              Snowflake Workspaces (Snowsight)               |
|  - Git-connected dev, branching, commits, conflict resolve  |
+------------------------------+------------------------------+
                               |
                               |  EXECUTE IMMEDIATE FROM
                               v
+-------------------------------------------------------------+
|                     Snowflake Environments                  |
|   DEV  →  TEST  →  PROD (DB/WH)                             |
|   Declarative DDL, Streams/Tasks, Sprocs                    |
+-------------------------------------------------------------+
                               ^
                               |
                               |  GitHub Actions + Snowflake CLI (OIDC)
                               |
+------------------------------+------------------------------+
|                        CI Orchestrator                      |
|        Installs CLI → runs deploy/*.sql from Git            |
+-------------------------------------------------------------+
```

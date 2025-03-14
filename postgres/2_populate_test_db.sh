#!/bin/bash
set -e
export PGPASSWORD=$POSTGRES_PASSWORD

# load the database
psql -v ON_ERROR_STOP=1 --username postgres --dbname obelisk -f /scripts/OMOPCDM_postgresql_5.4_ddl.sql
psql -v ON_ERROR_STOP=1 --username postgres --dbname obelisk -f /scripts/OMOPCDM_postgresql_5.4_indices.sql
psql -v ON_ERROR_STOP=1 --username postgres --dbname obelisk -f /scripts/OMOPCDM_postgresql_5.4_primary_keys.sql
psql -v ON_ERROR_STOP=1 -U postgres -d obelisk -c "GRANT SELECT ON ALL TABLES IN SCHEMA public TO opal; ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO opal;"
#psql -v ON_ERROR_STOP=1 --username postgres --dbname obelisk -f /scripts/OMOPCDM_postgresql_5.4_constraints.sql

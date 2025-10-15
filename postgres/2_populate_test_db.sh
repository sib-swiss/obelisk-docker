#!/bin/bash
set -e
export PGPASSWORD=$POSTGRES_PASSWORD

# load the database
psql -v ON_ERROR_STOP=1 --username postgres --dbname obelisk -f /scripts/OMOPCDM_postgresql_5.4_ddl.sql
psql -v ON_ERROR_STOP=1 --username postgres --dbname obelisk -f /scripts/OMOPCDM_postgresql_5.4_indices.sql
psql -v ON_ERROR_STOP=1 --username postgres --dbname obelisk -f /scripts/OMOPCDM_postgresql_5.4_primary_keys.sql
psql -v ON_ERROR_STOP=1 -U postgres -d obelisk -c "GRANT SELECT ON ALL TABLES IN SCHEMA public TO opal; ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO opal;"
psql -v ON_ERROR_STOP=1 -U postgres -d obelisk -c "\copy concept from '/scripts/CONCEPT.csv' with(FORMAT CSV,HEADER,  DELIMITER E'\t', QUOTE '\')"
psql -v ON_ERROR_STOP=1 -U postgres -d obelisk -c "\copy domain from '/scripts/DOMAIN.csv' with(FORMAT CSV,HEADER,  DELIMITER E'\t', QUOTE '\')"
psql -v ON_ERROR_STOP=1 -U postgres -d obelisk -c "\copy domain from '/scripts/VOCABULARY.csv' with(FORMAT CSV,HEADER,  DELIMITER E'\t', QUOTE '\')"
rm /scripts/CONCEPT.csv
rm /scripts/DOMAIN.csv
rm /scripts/VOCABULARY.csv
#psql -v ON_ERROR_STOP=1 --username postgres --dbname obelisk -f /scripts/OMOPCDM_postgresql_5.4_constraints.sql

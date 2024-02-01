#!/bin/bash
set -e
export PGPASSWORD=opalpass

# load the database
psql -v ON_ERROR_STOP=1 --username postgres --dbname obelisk -f /scripts/OMOPCDM_postgresql_5.4_ddl.sql
psql -v ON_ERROR_STOP=1 --username postgres --dbname obelisk -f /scripts/OMOPCDM_postgresql_5.4_indices.sql
psql -v ON_ERROR_STOP=1 --username postgres --dbname obelisk -f /scripts/OMOPCDM_postgresql_5.4_primary_keys.sql
#psql -v ON_ERROR_STOP=1 --username postgres --dbname obelisk -f /scripts/OMOPCDM_postgresql_5.4_constraints.sql

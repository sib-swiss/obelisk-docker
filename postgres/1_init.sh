#!/bin/bash
set -e
export PGPASSWORD=opalpass
psql -v ON_ERROR_STOP=1 --username postgres --dbname postgres <<-EOSQL
    create user opalroot with encrypted password 'opalpass';
    create user opal with encrypted password 'opalpass'; 
    
    create database opal_data;
    alter database opal_data owner to opalroot;
    create database opal_id;
    alter database opal_id owner to opalroot;
    
    grant connect on database opal_id to opal;
    grant create on database opal_id to opal;
    grant connect on database opal_data to opal;
    grant create on database opal_data to opal;

    create database obelisk;
    alter database obelisk owner to opalroot;
    grant connect on database obelisk to opal;
    grant create on database obelisk to opal;
EOSQL

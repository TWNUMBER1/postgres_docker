#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER thsu52 WITH PASSWORD 'password';
    CREATE DATABASE testdb;
    GRANT ALL PRIVILEGES ON DATABASE testdb TO thsu52;
EOSQL

cp /myconfig/pg_hba.conf /var/lib/postgresql/data/pg_hba.conf 
chown postgres:postgres /var/lib/postgresql/data/pg_hba.conf 
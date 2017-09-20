#!/bin/bash
set -e

psql -U postgres -tc "SELECT 1 FROM pg_database WHERE datname = 'foodiedb'" | grep -q 1 || psql -U postgres -c "CREATE DATABASE foodiedb"

echo $PWD
psql -v ON_ERROR_STOP=1 -f /scripts/init_db.sql -U postgres

cp /myconfig/pg_hba.conf /var/lib/postgresql/data/pg_hba.conf 
chown postgres:postgres /var/lib/postgresql/data/pg_hba.conf 
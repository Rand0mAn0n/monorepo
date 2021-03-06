#!/usr/bin/env bash
set -e

psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_USER" <<-EOSQL
	CREATE USER psybot WITH PASSWORD 'P@ssw0rd';
	GRANT ALL PRIVILEGES ON DATABASE tripsit TO psybot;
	GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO psybot;
EOSQL

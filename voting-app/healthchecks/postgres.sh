#!/bin/sh

export PGPASSWORD="${POSTGRES_PASSWORD:-postgres}"

# Verificação da conectividade com o PostgreSQL
echo "Running PostgreSQL healthcheck..."
if /usr/local/bin/psql -h localhost -U postgres -c 'SELECT 1' | grep -q 1; then
    echo "PostgreSQL is healthy."
    exit 0
else
    echo "PostgreSQL is unhealthy."
    exit 1
fi

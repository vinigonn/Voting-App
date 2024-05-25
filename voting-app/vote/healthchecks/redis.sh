#!/bin/sh

# Verificação da conectividade com o Redis
echo "Running Redis healthcheck..."
if /usr/local/bin/redis-cli ping | grep PONG; then
    echo "Redis is healthy."
    exit 0
else
    echo "Redis is unhealthy."
    exit 1
fi

#!/bin/ash
REDIS_URL=${REDIS_URL:-redis://redis:${REDIS_CUSTOM_PORT:-6379}/${REDIS_DB_NAME:-tipbot}} /usr/local/bundle/bin/bundle exec puma -p ${PORT:-8088}
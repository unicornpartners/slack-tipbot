#!/bin/ash
cd slack-tipbot
REDIS_URL=${REDIS_URL:-redis://redis:${REDIS_CUSTOM_PORT:-6379}/${REDIS_DB_NAME:-tipbot}} /usr/local/bundle/bin/rackup config.ru


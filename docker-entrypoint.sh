#!/bin/ash
cd slack-tipbot
REDIS_URL=redis://redis:${REDIS_CUSTOM_PORT:-6379}/tipbot /usr/local/bundle/bin/rackup config.ru
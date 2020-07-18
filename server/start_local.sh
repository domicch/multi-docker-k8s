#!/bin/bash

export REDIS_HOST=localhost
export REDIS_PORT=6379
export PGUSER=postgres
export PGHOST=localhost
export PGDATABASE=postgres
export PGPASSWORD=postgres_password
export PGPORT=5432

npm run dev

#!/bin/bash

set -x

PORT=${PORT:-8080}

ARGS=""

ARGS="$ARGS --access-log"
ARGS="$ARGS --log-level info"
ARGS="$ARGS --log-to-terminal"
ARGS="$ARGS --port $PORT"
ARGS="$ARGS --document-root htdocs"

if [ x"$MOD_WSGI_THREADS" != x"" ]; then
    ARGS="$ARGS --threads $MOD_WSGI_THREADS"
fi

if [ x"$MOD_WSGI_MAX_CLIENTS" != x"" ]; then
    ARGS="$ARGS --max-clients $MOD_WSGI_MAX_CLIENTS"
fi

if [ x"$MOD_WSGI_RELOAD_ON_CHANGES" != x"" ]; then
    ARGS="$ARGS --reload-on-changes"
fi

exec mod_wsgi-express start-server $ARGS wsgi.py

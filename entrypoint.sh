#!/usr/bin/env bash
if [ -n "$HASURA_GRAPHQL_SERVER_HOST" ]; then
  ENDPOINT="--endpoint $HASURA_GRAPHQL_SERVER_HOST"
fi

if [ -n "$HASURA_GRAPHQL_ADMIN_SECRET" ]; then
  SECRET="--admin-secret $HASURA_GRAPHQL_ADMIN_SECRET"
fi

if [ -n "$HASURA_GRAPHQL_ENV_FILE" ]; then
  if [ ! -f "$HASURA_GRAPHQL_ENV_FILE" ]; then
    echo "HASURA_GRAPHQL_ENV_FILE specified, but does not exist: '$HASURA_GRAPHQL_ENV_FILE'"
    exit
  else
    ENV_FILE="--envfile $HASURA_GRAPHQL_ENV_FILE"
  fi
fi

# create a configuration file if one was not mounted
if [ ! -f config.yaml ]; then
    touch config.yaml
fi

cmd="hasura $* $ENDPOINT $SECRET $ENV_FILE"
echo "Executing `$cmd`"
sh -c "$cmd"

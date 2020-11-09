#!/usr/bin/env bash
if [ -n "$HASURA_GRAPHQL_SERVER_HOST" ]
then
  ENDPOINT="--endpoint $HASURA_GRAPHQL_SERVER_HOST"
fi

if [ -n "$HASURA_GRAPHQL_ADMIN_SECRET" ]
then
  SECRET="--admin-secret $HASURA_GRAPHQL_ADMIN_SECRET"
fi

# create a configuration file if one was not mounted
if [ ! -f config.yaml ]; then
    touch config.yaml
fi

cmd="hasura $* $ENDPOINT $SECRET"
echo "Executing `$cmd`"
sh -c "$cmd"

# Docker Image with Hasura CLI

```sh
docker pull sharescape/hasura-cli-docker
```

## Environment Variables
- `HASURA_GRAPHQL_SERVER_HOST`: Required if a config.yaml is not mounted. The
    Hasura endpoint to pass to the Hasura CLI
- `HASURA_GRAPHQL_ADMIN_SECRET`: Optional

## Examples
### Using a config file
```sh
# mounting a hasura project directory
docker run --rm \
-v ~/my/hasura/project/directory:/hasura \
sharescape/hasura-cli-docker \
migrate status
```

```sh
# mounting a hasura config file
docker run --rm \
-v ~/my/hasura/project/directory/config.yaml:/hasura/config.yaml \
sharescape/hasura-cli-docker \
migrate status
```

### Using environment variables

```sh
docker run --rm \
-v ~/my/hasura/project/directory:/hasura \ # optional depending on the command
--env HASURA_GRAPHQL_SERVER_HOST=http://localhost:8080
--env HASURA_GRAPHQL_ADMIN_SECRET=SuperSecretPassword
sharescape/hasura-cli-docker \
migrate status
```

FROM frolvlad/alpine-glibc
LABEL maintainer="Christian Nieves <c.nieves@marrickdevelopment.com>"

WORKDIR /hasura

RUN apk add --no-cache curl bash libstdc++
RUN curl -L https://github.com/hasura/graphql-engine/raw/stable/cli/get.sh | bash

COPY LICENSE LICENSE
COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]

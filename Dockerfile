FROM golang:1.22 AS build-stage

WORKDIR /source
RUN git clone https://github.com/bluesky-social/indigo
WORKDIR /source/indigo
RUN CGO_ENABLED=0 GOOS=linux go build ./cmd/goat

FROM alpine:3.19 AS build-release-stage
RUN apk --no-cache add aws-cli

WORKDIR /
COPY --from=build-stage /source/indigo/goat /usr/local/bin/goat
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN adduser --system --uid 1001 client
USER client

ENTRYPOINT ["/entrypoint.sh"]
FROM golang:1.22 AS build-stage

WORKDIR /source
RUN git clone https://github.com/bluesky-social/indigo
WORKDIR /source/indigo
RUN CGO_ENABLED=0 GOOS=linux go build ./cmd/goat

FROM gcr.io/distroless/base-debian11 AS build-release-stage

WORKDIR /
COPY --from=build-stage /source/indigo/goat /usr/local/bin/goat

USER nonroot:nonroot

ENTRYPOINT ["/usr/local/bin/goat"]
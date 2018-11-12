FROM golang:1.11.2-alpine3.8

RUN apk update && apk add --update alpine-sdk git make gcc build-base musl-dev linux-headers ca-certificates python2 curl protobuf protobuf-dev zip

# Godog
RUN go get github.com/DATA-DOG/godog/cmd/godog

# Dep
RUN go get github.com/golang/dep/cmd/dep

# Golangci-lint
RUN wget -O - -q https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh| sh -s v1.12.2

# Stringer
RUN go get golang.org/x/tools/cmd/stringer

# Go-bindata
RUN go get -u github.com/kevinburke/go-bindata/...

# Gencodec
RUN go get github.com/fjl/gencodec

# Moq
RUN go get github.com/matryer/moq

# Mockery
RUN go get github.com/vektra/mockery/...

# Docker client
ENV DOCKER_VERSION "17.12.0-ce"
RUN curl -L -o /tmp/docker-$DOCKER_VERSION.tgz https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_VERSION.tgz \
    && tar -xz -C /tmp -f /tmp/docker-$DOCKER_VERSION.tgz \
    && mv /tmp/docker/docker /usr/bin \
    && rm -rf /tmp/docker-$DOCKER_VERSION /tmp/docker

# Protoc
RUN go get -u github.com/golang/protobuf/protoc-gen-go \
    && go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway \
    && go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger \
    && go get -u google.golang.org/grpc \
    && go get -u github.com/golang/protobuf/proto

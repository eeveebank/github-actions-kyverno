# FROM golang:1.16 as build
FROM golang@sha256:724abf4dd44985d060f7aa91af5211eb2052491424bd497ba3ddc31f7cee969d AS build

ENV KYVERNO_VERSION=v1.7.2

RUN git clone https://github.com/kyverno/kyverno.git
WORKDIR kyverno
RUN git checkout $KYVERNO_VERSION
RUN make cli
RUN mv ./cmd/cli/kubectl-kyverno/kyverno /kyverno


FROM alpine:3.8

RUN apk add --no-cache bash
RUN apk add libc6-compat

COPY --from=build /kyverno /usr/bin/kyverno

ENTRYPOINT ["kyverno"]
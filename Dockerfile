# syntax=docker/dockerfile:1

FROM debian:bookworm-slim AS builder

ARG MINIASM_VERSION=v0.3
ARG MINIASM_URL=https://github.com/lh3/miniasm/archive/refs/tags/v0.3.tar.gz
ARG MINIASM_SHA256=9b688454f30f99cf1a0b0b1316821ad92fbd44d83ff0b35b2403ee8692ba093d

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl gcc make zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /src
RUN curl -fsSL "$MINIASM_URL" -o miniasm.tar.gz \
    && echo "$MINIASM_SHA256  miniasm.tar.gz" | sha256sum -c - \
    && tar -xzf miniasm.tar.gz

WORKDIR /src/miniasm-0.3
RUN make CFLAGS="-O2 -static" \
    && test -x miniasm \
    && cp miniasm /tmp/miniasm

FROM scratch
COPY --from=builder /tmp/miniasm /usr/local/bin/miniasm
WORKDIR /data
ENTRYPOINT ["/usr/local/bin/miniasm"]

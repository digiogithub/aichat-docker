FROM rust:1.77.0-slim-bookworm AS builder

# Sets git branch as env variable
ARG GIT_BRANCH=main

WORKDIR /usr/src/aichat
# Install git
RUN apt-get update && apt-get install -y git musl-tools \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/sigoden/aichat.git . \
    && git checkout ${GIT_BRANCH}
RUN rustup target add x86_64-unknown-linux-musl
RUN cargo build --release --target x86_64-unknown-linux-musl --target-dir .


FROM alpine:3.19

COPY --from=builder /usr/src/aichat/x86_64-unknown-linux-musl/release/aichat /usr/bin/

ENTRYPOINT ["/usr/bin/aichat", "--serve", "0.0.0.0"]

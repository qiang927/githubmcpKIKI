
FROM golang:1.25 AS builder

WORKDIR /src

RUN git clone --depth 1 \
    https://github.com/github/github-mcp-server.git .

RUN CGO_ENABLED=0 go build -o /out/github-mcp-server \
    ./cmd/github-mcp-server

FROM debian:bookworm-slim

COPY --from=builder /out/github-mcp-server /usr/local/bin/github-mcp-server

ENV PORT=10000
ENV GITHUB_READ_ONLY=1

EXPOSE 10000

CMD ["sh", "-c", "exec github-mcp-server http --port ${PORT}"]

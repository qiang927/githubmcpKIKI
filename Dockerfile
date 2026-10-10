
FROM ghcr.io/github/github-mcp-server:latest

EXPOSE 8080

ENTRYPOINT ["github-mcp-server"]
CMD ["http", "--port", "8080"]

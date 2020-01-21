# FROM alpine:3.6
FROM gcr.io/distroless/static:latest
COPY dir /dir
COPY bin/app-linux /app


ENTRYPOINT ["/app"]

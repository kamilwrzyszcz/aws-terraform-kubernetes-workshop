FROM golang:1.19.2-alpine3.16 as builder

RUN adduser -u 1001 -D runuser
WORKDIR /code_src
COPY ./src/ .
RUN go build -o gobin main.go

FROM alpine:latest
COPY --from=builder /code_src/gobin /usr/local/bin/gobin
COPY --from=builder /etc/passwd /etc/passwd

USER 1001
EXPOSE 8080

ENTRYPOINT ["gobin"]
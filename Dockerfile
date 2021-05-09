// Dockerfile for Hello World in Go

FROM golang:1.8-alpine //this is the go runtime that this program would use
ADD . /go/src/hello-app
RUN go install hello-app

FROM alpine:latest
COPY --from=0 /go/bin/hello-app .
ENV PORT 8080
CMD ["./hello-app"]
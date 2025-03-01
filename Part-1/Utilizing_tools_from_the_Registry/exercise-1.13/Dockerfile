# Build the app
FROM golang:latest AS build1

RUN apt-get update

WORKDIR /usr/src/app

COPY . .

RUN go build

# Serve app
ENV REQUEST_ORIGIN=https://example.com

EXPOSE 8080

CMD ["./server"]

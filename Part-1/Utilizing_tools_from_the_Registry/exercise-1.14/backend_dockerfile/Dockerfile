# Build the app
FROM golang:latest AS build1

RUN apt-get update

WORKDIR /usr/src/app

COPY . .

ENV REQUEST_ORIGIN=http://localhost:5000

RUN go build

EXPOSE 8080

CMD ["./server"]

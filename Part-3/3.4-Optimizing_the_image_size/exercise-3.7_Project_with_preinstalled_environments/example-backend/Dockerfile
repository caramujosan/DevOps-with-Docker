FROM golang:tip-alpine3.21

WORKDIR /usr/src/app

ENV REQUEST_ORIGIN=http://localhost:5000

COPY . .

RUN go build && \
    adduser -D backuser && \
    rm -rf cache common controller go.mod go.sum pgconnection router

USER backuser

EXPOSE 8080

CMD ["./server"]

FROM golang:latest

WORKDIR /usr/src/app

COPY . .

RUN apt-get update && \
    go build && \
    useradd -m -d /home/backuser -s /bin/bash backuser && \
    rm -rf /var/lib/apt/lists/*

USER backuser

ENV REQUEST_ORIGIN=http://localhost:5000

EXPOSE 8080

CMD ["./server"]

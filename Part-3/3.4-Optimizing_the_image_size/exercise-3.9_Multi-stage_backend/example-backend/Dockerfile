FROM golang:tip-alpine3.21 AS build

WORKDIR /usr/src/app

ENV REQUEST_ORIGIN=http://localhost:5000

COPY . .

RUN go build && \
    #adduser -D backuser && \
    rm -rf cache common controller go.mod go.sum pgconnection router
    
#USER backuser

####

FROM scratch 

WORKDIR /app

EXPOSE 8080

COPY --from=build /usr/src/app /app

CMD ["./server"]

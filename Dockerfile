FROM golang:1.21.3-alpine as builder

WORKDIR /app

COPY go.mod .
COPY main.go .

RUN go build -o main

FROM scratch

COPY --from=builder /app/main /main

CMD ["/main"]

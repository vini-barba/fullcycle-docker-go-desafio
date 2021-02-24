FROM golang:1.15-alpine as builder

WORKDIR /go/src

COPY ./src .
RUN go build  -ldflags "-w" /go/src/main.go

FROM scratch
WORKDIR /app
COPY --from=builder /go/src/main .
CMD [ "./main" ]


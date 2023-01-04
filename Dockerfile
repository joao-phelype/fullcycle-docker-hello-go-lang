FROM golang:1.16-alpine as build
WORKDIR /app
COPY ./cmd/main.go .
COPY go.mod .
RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o /hello-go-lang

FROM scratch
COPY --from=build /hello-go-lang /hello-go-lang
ENTRYPOINT ["/hello-go-lang"]
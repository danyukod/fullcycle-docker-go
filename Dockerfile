FROM golang:1.12.0-alpine3.9 AS build
WORKDIR /app
COPY . /app
RUN go build -o main .


FROM scratch
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["/app/main"]
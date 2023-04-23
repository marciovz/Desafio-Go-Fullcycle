FROM golang:alpine3.14 AS App

WORKDIR /app

COPY main.go ./

RUN go build -o /fullcycle ./main.go


FROM scratch

WORKDIR /app

COPY --from=App ./fullcycle ./

ENTRYPOINT [ "./fullcycle" ]


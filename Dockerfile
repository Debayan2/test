# Use the official Golang image as a builder
FROM golang:1.20 AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the Go source code
COPY . .

# Ensure dependencies are installed
RUN go mod init hello-world && go mod tidy

# Build the Go application as a static binary
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o hello-world

# Use a minimal base image for the final container
FROM alpine:latest

# Set the working directory
WORKDIR /root/

# Copy the built binary from the builder
COPY --from=builder /app/hello-world .

# Ensure the binary has execution permission
RUN chmod +x hello-world

# Expose port 7070
EXPOSE 7070

# Run the Go application
CMD ["./hello-world"]


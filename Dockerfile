# Use the official Go image as the base image
FROM golang:1.19.1-alpine

# Set the working directory in the container
WORKDIR /workspaces

# Install dependencies
RUN go install -v golang.org/x/tools/gopls@latest
# For debugging
RUN apk --no-cache add gcc libc-dev
RUN go install github.com/go-delve/delve/cmd/dlv@latest
# Air Hot-Reload library (Not necessary)
RUN go install github.com/cosmtrek/air@latest
# Install MongoDB client tools
RUN apk add --no-cache mongodb-tools

# Expose any ports your application will use (e.g., 8080)
EXPOSE 8000

# Start a long-running process to keep the container alive
CMD ["tail", "-f", "/dev/null"]
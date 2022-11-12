# Fetching the latest version of node as a base image
FROM node as build

# Changing working directory to /app:
WORKDIR /app
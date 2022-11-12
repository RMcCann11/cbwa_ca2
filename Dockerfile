# Fetching the latest version of node as a base image
FROM node as build

# Changing working directory to /app:
WORKDIR /app

# Retrieving the content of my app from GitHub
RUN wget https://github.com/RMcCann11/mobdev_ca3/archive/main.tar.gz && tar xf main.tar.gz && rm main.tar.gz 
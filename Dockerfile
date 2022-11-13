# Fetching the latest version of node as a base image
FROM node as build

# Changing working directory to /app:
WORKDIR /app

# Retrieving the content of my app from GitHub
RUN wget https://github.com/RMcCann11/mobdev_ca3/archive/main.tar.gz && tar xf main.tar.gz && rm main.tar.gz 

# Changing working directory to /app/mobdev_ca3-main/BreakingBadFandom
WORKDIR /app/mobdev_ca3-main/BreakingBadFandom

# Installing ionic through npm
RUN npm install -g ionic

# Downloading and installing app dependencies
RUN npm install

# Building our application for deployment
RUN npm run build --prod

# Fetching a web server to serve our app
FROM nginx:alpine

# Exposing container port 80
EXPOSE 80

# Removing the entire content of the /usr/share/nginx/html folder
RUN rm -rf /usr/share/nginx/html/*

# Copying my app files into /usr/share/nginx/html
COPY --from=build /app/mobdev_ca3-main/BreakingBadFandom/www/ /usr/share/nginx/html/

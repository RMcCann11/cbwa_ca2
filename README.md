# cbwa_ca2

### Fetching the latest version of Node as a base image: ###
As per [ionicframework] (https://ionicframework.com/docs/intro/environment), in order to utilise the ionic framework, an ionic application requires the use of Node.js and the npm enviroment.

As per [knoldus] (https://blog.knoldus.com/deployment-with-docker-in-ionic/), Node.js will allow us to execute npm commands that are required to build our ionic app.

As per [w3schools] (https://www.w3schools.com/nodejs/nodejs_npm.asp#:~:text=What%20is%20NPM%3F,when%20you%20install%20Node.js) "NPM is a package manager for Node.js packages", one of these packages being ionic.

As per [java4coding] (https://www.java4coding.com/contents/docker/docker-from-command) the docker FROM command can be used to retrieve a base image from Docker Hub that can be utilised by the build process. Furthermore by specifying 'latest' as the releasetag, the latest available build of Alpine will be retrieved.

As per [dockerDocumentation] (https://docs.docker.com/engine/reference/builder/#from) a name can be assigned to this stage of the build process which can be subsequently referenced through the use of AS, in this case build.

### Changing working directory to /app: ###
As per [java4coding] (https://www.java4coding.com/contents/docker/docker-workdir-command), the docker WORKDIR command can be used to navigate to a working directory. Furthermore [knoldus] (https://blog.knoldus.com/deployment-with-docker-in-ionic/) explains that this command can be used to create a working directory as well as navigating to it
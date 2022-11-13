# cbwa_ca2

### Fetching the latest version of Node as a base image: ###
As per [ionicframework] (https://ionicframework.com/docs/intro/environment), in order to utilise the ionic framework, an ionic application requires the use of Node.js and the npm enviroment.

As per [knoldus] (https://blog.knoldus.com/deployment-with-docker-in-ionic/), Node.js will allow us to execute npm commands that are required to build our ionic app.

As per [w3schools] (https://www.w3schools.com/nodejs/nodejs_npm.asp#:~:text=What%20is%20NPM%3F,when%20you%20install%20Node.js) "NPM is a package manager for Node.js packages", one of these packages being ionic.

As per [java4coding] (https://www.java4coding.com/contents/docker/docker-from-command) the docker FROM command can be used to retrieve a base image from Docker Hub that can be utilised by the build process. Furthermore by specifying 'latest' as the releasetag, the latest available build of Alpine will be retrieved.

As per [dockerDocumentation] (https://docs.docker.com/engine/reference/builder/#from) a name can be assigned to this stage of the build process which can be subsequently referenced through the use of AS, in this case build.

***
### Changing working directory to /app: ###
As per [java4coding] (https://www.java4coding.com/contents/docker/docker-workdir-command), the docker WORKDIR command can be used to navigate to a working directory. Furthermore [knoldus] (https://blog.knoldus.com/deployment-with-docker-in-ionic/) explains that this command can be used to create a working directory as well as navigating to it

***
### Retrieving the content of my app from GitHub: ###
As per [linuxize] (https://linuxize.com/post/wget-command-examples/), the wget command can be used to download files through the command line using the HTTP protocol. In this case, an archive will be received which as per [linuxize] (https://linuxize.com/post/how-to-extract-unzip-tar-gz-file/), can be unarchived using the tar command. The flag '-x' denotes the extraction option and the name of the archive should follow the 'f' flag. 

As per [geeksforgeeks] (https://www.geeksforgeeks.org/rm-command-linux-examples/), we can use the rm command to delete files, in this case the downloaded archive.

As per in [java4coding] (https://www.java4coding.com/contents/docker/docker-run-command), the docker RUN command can be used to execute Linux commands from a terminal.

***
### Changing working directory to /app/mobdev_ca3-main: ###
As per Changing working directory to /app, using the docker WORKDIR command we can navigate to /app/mobdev_ca3-main as the files required to build and serve our app our present in this location.

***
### Installing ionic through npm: ###
As per [tutorialspoint] (https://www.tutorialspoint.com/nodejs/nodejs_npm.htm), npm packages can be installed using the syntax "npm install <PackageName>"

As per [knoldus] (https://blog.knoldus.com/deployment-with-docker-in-ionic/), in order to utilise ionic we have to install it globally using the -g flag.

*** 
### Downloading and installing app dependencies: ###
As per [knoldus] (https://blog.knoldus.com/deployment-with-docker-in-ionic/), in order to run our app we have to download and install all of it's required dependencies.

As per [stackchief] (https://www.stackchief.com/tutorials/npm%20install%20%7C%20how%20it%20work), "when run without arguments, npm install downloads dependencies defined in a package.json file and generates a node_modules folder with the installed modules."

***
### Building our application for deployment: ###
As per [knoldus] (https://blog.knoldus.com/deployment-with-docker-in-ionic/), this command is using the Angular build command. Furthermore, as per [ionicframework] (https://ionicframework.com/docs/cli/commands/build), the ionic build command will compile an ionic app through the use of the Angular CLI.

As per [thinkster] (https://thinkster.io/tutorials/angular-cli-basics-ng-build), the Angular build command is used to build and deploy an application and when compiling an app into a production environment the --prod flag should be used

As per [knoldus] (https://blog.knoldus.com/deployment-with-docker-in-ionic/), this command also creates "a www folder of our project".

***
### Fetching a web server to serve our app: ###
As per fetching the latest version of Node as a base image, the docker FROM command can be used to retrieve a base image from Docker Hub. In this case we are retrieving an Nginx image.

As per [nginx] (https://www.nginx.com/resources/glossary/nginx/),  nginx is open source software designed for web serving.

***
### Exposing container port 80: ###
As per [java4coding] (https://www.java4coding.com/contents/docker/docker-volume-expose-command#DockerExpose), the docker EXPOSE command is used to expose a container's port to the outside world.

*** 
### Removing the entire content of the /usr/share/nginx/html folder: ###
As per [knoldus] (https://blog.knoldus.com/deployment-with-docker-in-ionic/), our app will be served from the '/usr/share/nginx/html' folder. 

As per retrieving the content of my app from GitHub, we can use the rm command to delete files. Furthermore as per [geeksforgeeks] (https://www.geeksforgeeks.org/rm-rf-command-in-linux-with-examples/#:~:text=When%20you%20combine%20the%20%2Dr,contents)%20without%20prompting%20for%20confirmation.), "when you combine the -r and -f flags, it means that you recursively and forcibly remove a directory (and its contents) without prompting for confirmation".

***
### Copying our project files to the /usr/share/nginx/html folder: ###
As per [educba] (https://www.educba.com/docker-copy-command/), the docker COPY command can be used to copy files or folders. Furthermore, as per [stackoverflow] (https://stackoverflow.com/questions/66353510/what-is-from-used-in-copy-command-in-dockerfile#:~:text=%22You%20can%20use%20the%20COPY,copies%20the%20artifact%20from%20there.%22), we can use the --from flag to copy from a seperate image, in our case build.

As per changing working directory to '/app/mobdev_ca3-main', the project files were placed in /app/mobdev_ca2-main when we downloaded them from GitHub and as per building our application for deployment, the command 'npm run build --prod' appended /www to this path hence we are copying '/app/mobdev_ca2-main/www/' to the folder from which our app will be served namely '/usr/share/nginx/html/'.

***
### Building an image from a Dockerfile: ###
As per [java4coding] (https://www.java4coding.com/contents/docker/docker-build), the docker build command is used to build a docker image from a Dockerfile which provides instructions on how to do so. Furthermore the full command to build an image is docker build -t <imagename> .

In order to use the Dockerfile contained within this project please navigate to the directory in which you have placed the Dockerfile and issue the command 'docker build -t myapp .'

***
### Running an instance of the image: ###
As per [java4coding] (https://www.java4coding.com/contents/docker/docker-run), the docker run command can be used to run an instance of the image. Furthermore "the docker run command must specify an IMAGE to derive the container from", in this case 'myapp'.

In order to run an instance of the image you have created please issue the following command 'docker run -it --rm -p 8080:80 myapp'. Furthermore as per  [dockerDocumentation] (https://docs.docker.com/engine/reference/commandline/run/), the -it flag will keep STDIN open thereby allowing you to interact with the container, the --rm flag will "automatically remove the container when it exits" and the -p 8080:80 flag will map the local machine's port 8080 to the container's port 80.

***
### Accessing myapp: ###
To view my app, please open a browser and type 'localhost:8080' into the address bar.
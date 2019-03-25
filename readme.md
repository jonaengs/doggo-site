Many thanks to:
    https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-xix-deployment-on-docker-containers
    for the help. Couldn't have done it without him + a dozen other internet strangers with who had encountered
    similar issues to mine

First: install docker-stuff

then run these two commands from the top-level directory of the project

    docker build -t doggo:latest .
    
    docker run --name doggo -d -p 80:5000 --rm doggo:latest # names the container for easier debugging etc

if things start crashing run this command instead, it will print the logs directly to the terminal

    docker run --name doggo -i -p 80:5000 doggo:latest

to restart a container after making changes:

    docker container stop doggo    
    docker container rm doggo
    
then repeat above steps


Because the docker container runs on port 80 the site probably wont work with https, as that runs on 443

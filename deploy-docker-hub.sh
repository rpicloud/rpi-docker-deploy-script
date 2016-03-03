#!/bin/bash
for i in "$@"
do
case $i in
    -v=*|--version=*)
    VERSION="${i#*=}"
    ;;
    -r=*|--repo=*)
    REPO="${i#*=}"
    ;;

     -p=*|--port=*)
    PORT="${i#*=}"
    ;;
    *)
            # unknown option
    ;;
esac
done

echo
echo "hub.docker.com repository to push to:" ${REPO}
echo "version to tag the container with besides:"  ${VERSION}
echo "port number to expose:" ${PORT}

echo 'FROM hypriot/rpi-java
COPY app.jar /data/
EXPOSE '${PORT}'
CMD ["java", "-jar", "app.jar"]' > Dockerfile


echo
echo "Containerizing the successful build"
echo "######### STEP 1 - BUILDING DOCKER CONTAINER #########"
docker build -t ${REPO}:${VERSION} .  
docker tag -f ${REPO}:${VERSION} ${REPO}:latest

echo
echo "######### STEP 2 - PUSHING CONTAINER TO HUB.DOCKER.COM #########"
docker push ${REPO}:${VERSION}
docker push ${REPO}:latest

echo
echo "######### STEP 3 - CLEANING UP #########"
docker rmi ${REPO}:${VERSION}
docker rmi ${REPO}:latest
rm Dockerfile

echo
echo "######### ALL DONE! #########"

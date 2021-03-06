#!/bin/sh
DOCKER_PATH=$DOCKER_USER/$DOCKERHUB_REPO:$TAG
docker login --username $DOCKER_USER --password $DOCKER_PASS

if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
#docker build -f Dockerfile -t $TRAVIS_REPO_SLUG:$TAG .
docker build Dockerfile -t $DOCKER_PATH .

#docker push $TRAVIS_REPO_SLUG
docker push $DOCKER_PATH
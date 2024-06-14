FROM gcr.io/kaniko-project/executor:v1.23.1 AS kaniko

FROM ubuntu:22.04 as base

COPY --from=kaniko /kaniko /kaniko
ENV PATH ${PATH}:/kaniko
#COPY --from=kaniko /kaniko/executor /kaniko/executor
#COPY --from=kaniko /kaniko/docker-credential-gcr /kaniko/docker-credential-gcr
#COPY --from=kaniko /kaniko/docker-credential-ecr-login /kaniko/docker-credential-ecr-login
##COPY --from=kaniko /kaniko/docker-credential-acr-env /kaniko/docker-credential-acr-env
#COPY --from=kaniko /kaniko/.docker /kaniko/.docker

ENV DOCKER_CONFIG /kaniko/.docker/

RUN apt-get update &&  \
    apt-get install -y curl wget ca-certificates git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

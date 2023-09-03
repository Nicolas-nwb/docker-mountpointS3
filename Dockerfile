FROM ubuntu:latest

ENV AWS_ACCESS_KEY_ID=VotreAWSAccessKeyID
ENV AWS_SECRET_ACCESS_KEY=VotreAWSSecretAccessKey
ENV AWS_BUCKET=VotreAWSBucket
ENV AWS_REGION=VotreAWSRegion
ENV AWS_ENDPOINT=VotreAWSEndpoint

# Définir une variable d'argument pour l'architecture
ARG ARCH

# Mettre à jour le système et installer les dépendances
RUN apt-get update && apt-get install -y wget fuse libfuse-dev libc6 ca-certificates

# Installer Mountpoint-S3 en fonction de l'architecture
RUN wget https://s3.amazonaws.com/mountpoint-s3-release/latest/${ARCH}/mount-s3.deb
RUN dpkg -i mount-s3.deb || true
RUN apt-get install -f

# Monter le compartiment S3 dans le répertoire /data
RUN mkdir /data

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["mount-s3 --foreground --allow-other --allow-delete $AWS_BUCKET /data --endpoint-url $AWS_ENDPOINT --region $AWS_REGION --maximum-throughput-gbps 1 --debug --part-size 5242880"]

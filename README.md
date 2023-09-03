# WIP
🇺🇸 It doesn't work yet on ARM, with other providers than Amazon S3, like Scaleway or Wasabi.
🇫🇷 Ça ne fonctionne pas encore sur ARM, avec d'autres fournisseurs que Amazon S3, comme Scaleway ou Wasabi.

# docker-mountpointS3
Image Docker with Mountpoint-S3 client to mount an S3 bucket

## Build

```bash
docker build --platform linux/amd64 --build-arg ARCH=x86_64 -t docker-mountpoints3:amd64 .
docker build --platform linux/arm64 --build-arg ARCH=arm64 -t docker-mountpoints3:arm64 .
docker manifest create docker-mountpoints3:latest docker-mountpoints3:amd64 docker-mountpoints3:arm64
```

## Run
```bash
docker run  --privileged --env-file .env docker-mountpoints3:arm64
# OR
docker run --cap-add SYS_ADMIN --device /dev/fuse --env-file .env docker-mountpoints3:arm64                                                 
```

mount-s3 --foreground --allow-other --allow-delete $AWS_BUCKET /mnt --endpoint-url $AWS_ENDPOINT --region $AWS_REGION --maximum-throughput-gbps 1

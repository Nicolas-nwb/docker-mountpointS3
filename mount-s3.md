Mountpoint for Amazon S3

Usage: mount-s3 [OPTIONS] <BUCKET_NAME> <DIRECTORY>

Arguments:
  <BUCKET_NAME>  Name of bucket to mount
  <DIRECTORY>    Directory to mount the bucket at

Options:
  -f, --foreground  Run as foreground process
  -h, --help        Print help
  -V, --version     Print version

Bucket options:
      --prefix <PREFIX>
          Prefix inside the bucket to mount, ending in '/' [default: mount the entire bucket]
      --region <REGION>
          AWS region of the bucket [default: auto-detect region]
      --endpoint-url <ENDPOINT_URL>
          S3 endpoint URL [default: auto-detect endpoint]
      --force-path-style
          Force path-style addressing
      --transfer-acceleration
          Use S3 Transfer Acceleration when accessing S3. This must be enabled on the bucket.
      --dual-stack
          Use dual-stack endpoints when accessing S3
      --requester-pays
          Set the 'x-amz-request-payer' to 'requester' on S3 requests
      --storage-class <STORAGE_CLASS>
          Set the storage class for new objects
      --expected-bucket-owner <AWS_ACCOUNT_ID>
          Account ID of the expected bucket owner. If the bucket is owned by a different account, S3 requests fail with an access denied error.

AWS credentials options:
      --no-sign-request    Do not sign requests. Credentials will not be loaded if this argument is provided.
      --profile <PROFILE>  Use a specific profile from your credential file.

Mount options:
      --read-only              Mount file system in read-only mode
      --allow-delete           Allow delete operations on file system
      --auto-unmount           Automatically unmount on exit
      --allow-root             Allow root user to access file system
      --allow-other            Allow other users, including root, to access file system
      --uid <UID>              Owner UID [default: current user's UID]
      --gid <GID>              Owner GID [default: current user's GID]
      --dir-mode <DIR_MODE>    Directory permissions [default: 0755]
      --file-mode <FILE_MODE>  File permissions [default: 0644]

Client options:
      --maximum-throughput-gbps <N>  Maximum throughput in Gbps [default: auto-detected on EC2 instances, 10 Gbps elsewhere]
      --max-threads <N>              Maximum number of FUSE daemon threads [default: 16]
      --part-size <PART_SIZE>        Part size for multi-part GET and PUT [default: 8388608]

Logging options:
  -l, --log-directory <DIRECTORY>  Write log files to a directory [default: logs written to syslog]
      --log-metrics                Enable logging of summarized performance metrics
  -d, --debug                      Enable debug logging for Mountpoint
      --debug-crt                  Enable debug logging for AWS Common Runtime
      --no-log                     Disable all logging

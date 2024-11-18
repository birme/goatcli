# Docker container for GOAT CLI

This is a docker container for `goat`: Go AT protocol CLI tool

## Usage

Build image

```
% docker build -t goatcli .
```

Run and show help

```
% docker run --rm goatcli -h
```

## Examples

Resolve an account's identity in the network:

```
% docker run --rm goatcli resolve birme.social.eyevinn.technology  
```

Backup repo to S3 bucket

```
% docker run --rm \
  -e AWS_ACCESS_KEY_ID=<aws-access-key-id> \
  -e AWS_SECRET_ACCESS_KEY=<aws-secret-access-key> \
  goatcli backup birme.social.eyevinn.technology s3://backup/bluesky/
```

## License

This project is licensed under the MIT License, see [LICENSE](LICENSE).

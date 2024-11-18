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

## License

This project is licensed under the MIT License, see [LICENSE](LICENSE).

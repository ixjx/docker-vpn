# VPN (PPTP) for Docker

This is a docker image with simple VPN (PPTP) server with _chap-secrets_ authentication.

PPTP uses _/etc/ppp/chap-secrets_ file to authenticate VPN users.
You need to create this file on your own and link it to docker when starting a container.

Example of _chap-secrets_ file:

````
# Secrets for authentication using PAP
# client    server      secret      acceptable local IP addresses
username    *           password    *
````
## Troubleshooting 

### Docker 1.7.x and connection issues
After upgrading from Docker 1.3.0 to Docker 1.7.1 the containers started from image `mobtitude/vpn-pptp` stopped accepting connections to VPN without any reason.
Connections were dropped after timeout. 

It looked like Docker deamon didn't forward packets for GRE protocol to container.

One of the possible solutions is to start container with networking mode set to host by adding param `--net=host` to run command:

````
docker run -d --privileged --net=host ixjx/vpn
````

**Note:** Before starting container in `--net=host` mode, please read how networking in `host` mode works in Docker:
https://docs.docker.com/reference/run/#mode-host

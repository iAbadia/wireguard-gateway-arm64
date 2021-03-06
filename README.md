# wireguard-gateway-arm64
Aarch64 based wireguard gateway. Tested on Raspberry Pi. Have an always on Wireguard gateway on your local network!
https://hub.docker.com/r/iabadia/wireguard-gateway-arm64

Dockerhub automated builds are disabled as it doesn't support arm based images.

Based on [jordanpotter/docker-wireguard](https://github.com/jordanpotter/docker-wireguard)

## Prerequisites

- linux-headers installed on the host (apt install linux-headers-$(uname -r))
- Make sure your config file doesn't have an ipv6 on teh AllowedIPs section

## Setup
We need to create a macvlan as the gateway needs to have it's own mac address and IP.

```
docker network create -d macvlan \
 --subnet=192.168.1.0/24 --gateway=192.168.1.1 -o parent=eth0 pub_net
 ```

## Run
```
docker run --name wireguard-gateway \
  --network pub_net \
  --cap-add NET_ADMIN \
  --cap-add SYS_MODULE \
  --sysctl net.ipv4.conf.all.src_valid_mark=1 \
  --sysctl net.ipv6.conf.all.disable_ipv6=1 \
  --sysctl net.ipv4.ip_forward=1 \
  -v /path/to/file/router.conf:/etc/wireguard/router.conf iabadia/wireguard-gateway-arm64:latest
```
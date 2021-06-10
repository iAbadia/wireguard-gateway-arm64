# wireguard-gateway-arm64
https://hub.docker.com/r/iabadia/wireguard-gateway-arm64

# Setup
docker network create -d macvlan \
 --subnet=192.168.1.0/24 --gateway=192.168.1.1 -o parent=eth0 pub_net

# Run

docker run --name wireguard-gateway \
  --cap-add NET_ADMIN \
  --cap-add SYS_MODULE \
  --sysctl net.ipv4.conf.all.src_valid_mark=1 \
  --sysctl net.ipv6.conf.all.disable_ipv6=0 \
  -v /path/to/file/router.conf:/etc/wireguard/router.conf iabadia/wireguard-gateway-arm64:0.2
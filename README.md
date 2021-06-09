# wireguard-gateway-arm64
https://hub.docker.com/r/iabadia/wireguard-gateway-arm64


# Run

docker run --name wireguard-gateway \
  --cap-add NET_ADMIN \
  --cap-add SYS_MODULE \
  --sysctl net.ipv4.conf.all.src_valid_mark=1 \
  -v /path/to/file/router.conf:/etc/wireguard/router.conf iabadia/wireguard-gateway-arm64:0.2
FROM --platform=linux/arm64 alpine:3.13.5

RUN apk add --no-cache \
      openresolv iptables ip6tables iproute2 wireguard-tools \
      findutils # Needed for finds -printf flag
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
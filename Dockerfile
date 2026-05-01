FROM alpine:3.23.4

LABEL maintainer="Ishtiyaq Husain" \
      description="Pi-finder: Alpine-based tool to detect Raspberry Pi devices on the local network." \
      vendor="Ishtiyaq Husain" \
      version="0.0.3"

RUN apk add --no-cache arp-scan bash grep

COPY --chmod=755 detect-rpi-ips.sh /usr/local/sbin/detect-rpi-ips.sh

ENTRYPOINT ["/usr/local/sbin/detect-rpi-ips.sh"]
FROM alpine:3.16

LABEL maintainer="Ishtiyaq Husain" \
      description="Pi-finder is alpine linux based docker contianer to find availablee Raspberry Pi in your network." \
      vendor="Ishtiyaq Husain" \
      version="0.0.1"

RUN apk add --no-cache arp-scan bash grep

COPY detect-rpi-ips.sh /usr/sbin/

RUN chmod +x /usr/sbin/detect-rpi-ips.sh

CMD [ "/usr/sbin/detect-rpi-ips.sh" ]

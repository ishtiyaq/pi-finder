FROM alpine:3.16

RUN apk add --no-cache arp-scan bash grep

COPY detect-rpi-ips.sh /usr/sbin/

RUN chmod +x /usr/sbin/detect-rpi-ips.sh

CMD [ "/usr/sbin/detect-rpi-ips.sh" ]

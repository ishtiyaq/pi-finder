# Pi-finder

Pi-finder is slim alpine linux based docker contianer to find availablee Raspberry Pi in your network.

## How to use

```bash
docker run --rm --net host ishtiyaq/pi-finder:latest
```

Output:

```bash
Looking for Raspbery IP addresses using arp-scan ...
192.168.0.10	b8:27:eb:XX:XX:XX	Raspberry Pi Foundation
```

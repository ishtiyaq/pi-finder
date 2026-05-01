[![Docker Image CI](https://github.com/ishtiyaq/pi-finder/actions/workflows/main.yml/badge.svg)](https://github.com/ishtiyaq/pi-finder/actions/workflows/main.yml)
[![Docker Pulls](https://img.shields.io/docker/pulls/ishtiyaq/pi-finder)](https://hub.docker.com/r/ishtiyaq/pi-finder)
[![Image Size](https://img.shields.io/docker/image-size/ishtiyaq/pi-finder/latest)](https://hub.docker.com/r/ishtiyaq/pi-finder)

# Pi-finder

A lightweight, Alpine-based Docker container for detecting Raspberry Pi devices on your local network using MAC address OUI lookup.

Supports **Pi 1–3** (`B8:27:EB`), **Pi 4** (`DC:A6:32`), and **Pi 5** (`E4:5F:01`).

## Usage

```bash
docker run --rm \
  --network host \
  --cap-add NET_RAW \
  --cap-add NET_ADMIN \
  ishtiyaq/pi-finder:latest
```

### Example output

```
Looking for Raspberry Pi devices on local network...

Found 2 Raspberry Pi device(s):
-----------------------------------
  IP  : 192.168.1.10
  MAC : b8:27:eb:xx:xx:xx
  Desc: Raspberry Pi Foundation

  IP  : 192.168.1.24
  MAC : dc:a6:32:xx:xx:xx
  Desc: Raspberry Pi Trading Ltd
```

## Why `--network host` and capabilities?

`arp-scan` sends raw ARP packets to discover devices, which requires:

- `--network host` — to access the host's physical network interface (bridge/NAT modes won't see ARP traffic)
- `NET_RAW` + `NET_ADMIN` — Linux capabilities needed to craft and send raw packets

## Supported Pi models

| Model | MAC Prefix |
|---|---|
| Raspberry Pi 1, 2, 3 | `B8:27:EB` |
| Raspberry Pi 4 | `DC:A6:32` |
| Raspberry Pi 5 | `E4:5F:01` |

## License

MIT
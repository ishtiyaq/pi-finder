#!/bin/bash

set -euo pipefail

# Raspberry Pi OUI prefixes (B8:27:EB = Pi 1-3, DC:A6:32 = Pi 4, E4:5F:01 = Pi 5)
RPI_OUI_PATTERN="\s(b8:27:eb|dc:a6:32|e4:5f:01)"

echo "Looking for Raspberry Pi devices on local network..."

if ! command -v arp-scan &>/dev/null; then
    echo "Error: arp-scan is not installed. Run: sudo apt install arp-scan" >&2
    exit 1
fi

# arp-scan requires root/sudo
if [[ $EUID -ne 0 ]]; then
    echo "Warning: arp-scan may require sudo for accurate results." >&2
fi

output=$(arp-scan --localnet 2>/dev/null | grep -Pi "$RPI_OUI_PATTERN")

if [[ -z "$output" ]]; then
    echo "No Raspberry Pi found."
    exit 0
fi

count=$(echo "$output" | wc -l)
echo ""
echo "Found $count Raspberry Pi device(s):"
echo "-----------------------------------"
echo "$output" | while IFS=$'\t' read -r ip mac desc; do
    echo "  IP : $ip"
    echo "  MAC: $mac"
    echo "  Desc: $desc"
    echo ""
done
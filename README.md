

# Network Discovery Script

## Overview

This script performs a network discovery scan by pinging all possible IP addresses within a given subnet. It is useful for quickly identifying active hosts in a local network. The user provides the first three octets of an IP address (e.g., `192.168.1`), and the script automatically checks all 254 addresses in that range.

## How It Works

1. The script accepts the first three octets of the IP address (e.g., `192.168.1`) as an argument.
2. It then pings all IP addresses from `192.168.1.0` to `192.168.1.254` (for a /24 network).
3. It checks each IP address by sending a single ping with a short timeout (`-w 1`).
4. If the host responds (i.e., a "TTL" value is found), the script reports the host as "UP".

## Why This Script Is Great:

- **Efficiency**: The script uses parallel execution, meaning it pings multiple IPs at the same time, making the scan much faster.
- **Simple and Lightweight**: The script is easy to understand and does not require additional dependencies, making it quick to deploy in any network environment.
- **Flexible Input**: Users only need to input the first three octets of the subnet (e.g., `10.0.1`) — the last octet is automatically handled by the loop.
- **Minimal Impact**: The script runs with a very low footprint, using basic `ping` commands and simple shell scripting.

## Usage

```bash
./net-discover.sh 192.168.1
```

*Note: Don't include the last octet of the IP address; the script will handle it automatically.*

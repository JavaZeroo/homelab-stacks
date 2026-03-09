tee /usr/local/sbin/macvlan0-up.sh >/dev/null <<'EOF'
#!/bin/sh
set -eu

PARENT="br0"
IPADDR="192.168.3.250/24"

# 已存在则跳过
if ip link show macvlan0 >/dev/null 2>&1; then
  exit 0
fi

ip link add macvlan0 link "$PARENT" type macvlan mode bridge
ip addr add "$IPADDR" dev macvlan0
ip link set macvlan0 up
EOF

chmod +x /usr/local/sbin/macvlan0-up.sh

tee /usr/local/sbin/macvlan0-down.sh >/dev/null <<'EOF'
#!/bin/sh
set -eu
ip link del macvlan0 2>/dev/null || true
EOF

chmod +x /usr/local/sbin/macvlan0-down.sh

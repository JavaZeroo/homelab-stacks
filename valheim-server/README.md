```bash
docker run -d   --name valheim-server   --cap-add=sys_nice   --stop-timeout 120   -p 2456-2457:2456-2457/udp   -v /data/homelab-stacks/valheim-server/config:/config   -v /data/homelab-stacks/valheim-server/data:/opt/valheim   -e SERVER_NAME="JavaZero Server"   -e WORLD_NAME="wtfsbsbsbsb"   -e SERVER_PASS="07551234"   -e SERVER_PUBLIC=true   -e TZ=Asia/Taipei   ghcr.io/lloesche/valheim-server
```

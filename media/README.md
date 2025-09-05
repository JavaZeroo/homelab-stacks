# Media Stack

包含服务：
- qBittorrent (下载器)
- MoviePilot (下载编排)
- Jellyfin (媒体服务器)
- Jellyseerr (点播/请求管理)

## 启动
```bash
cd compose
docker compose -f qbittorrent.yaml up -d
docker compose -f moviepilot.yaml up -d
docker compose -f media-server.yaml up -d
```
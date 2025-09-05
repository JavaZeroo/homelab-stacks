# Media Stack

包含服务：
- qBittorrent (下载器) - 端口 8080
- MoviePilot (下载编排) - 端口 3000
- Jellyfin (媒体服务器) - 端口 8096
- Jellyseerr (点播/请求管理) - 端口 5055

## 网络配置
- 使用默认 Docker bridge 网络
- 所有服务通过端口映射访问

## 启动
```bash
cd compose
docker compose -f qbittorrent.yaml up -d
docker compose -f moviepilot.yaml up -d
docker compose -f media-server.yaml up -d
```

## 环境变量
可以通过环境变量自定义端口：
- `QBIT_PORT_UI` - qBittorrent Web UI 端口 (默认: 8080)
- `MOVIEPILOT_PORT` - MoviePilot 端口 (默认: 3000)
- `JELLYFIN_PORT_HTTP` - Jellyfin HTTP 端口 (默认: 8096)
- `JELLYSEERR_PORT` - Jellyseerr 端口 (默认: 5055)
# Media Stack

包含服务：
- qBittorrent (下载器) - 端口 8080
- MoviePilot v2 (下载编排，附 PostgreSQL/Redis) - 端口 3000
- Jellyfin (媒体服务器) - 端口 8096
- Jellyseerr (点播/请求管理) - 端口 5055

## 网络配置
- 使用默认 Docker bridge 网络
- 所有服务通过端口映射访问

## 启动
```bash
docker compose -f compose/qbittorrent.yaml up -d
docker compose -f compose/moviepilot.yaml up -d
docker compose -f compose/media-server.yaml up -d
```

## 环境变量
可以通过环境变量自定义端口和目录：
- `MEDIA_STACK_ROOT` - 持久化数据根目录 (默认: `/data/apps`)
- `MEDIA_DOWNLOADS_DIR` - 下载内容共享目录 (默认: `${MEDIA_STACK_ROOT}/qbittorrent/downloads`)

端口：
- `QBIT_PORT_UI` - qBittorrent Web UI 端口 (默认: 8080)
- `QBIT_PORT_CONN` - qBittorrent TCP/UDP 连接端口 (默认: 6881)
- `MOVIEPILOT_PORT` - MoviePilot 端口 (默认: 3000)
- `MOVIEPILOT_API_PORT` - MoviePilot API 端口 (默认: 3001)
- `JELLYFIN_PORT_HTTP` - Jellyfin HTTP 端口 (默认: 8096)
- `JELLYSEERR_PORT` - Jellyseerr 端口 (默认: 5055)


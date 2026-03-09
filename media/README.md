# media

完整影音自动化栈 — 下载、整理、播放、点播。

## 服务与端口

| 服务 | 说明 | 端口 | 网络 |
|------|------|------|------|
| qBittorrent | BT 下载器 | `8080` (WebUI) · `6881` (BT) | macvlan `192.168.3.44` |
| MoviePilot v2 | 下载编排 | `3000` (UI) · `3001` (API) | bridge |
| PostgreSQL | MoviePilot 数据库 | — | bridge (内部) |
| Redis | MoviePilot 缓存 | — | bridge (内部) |
| Jellyfin | 媒体服务器 | `8096` | host |
| Jellyseerr | 点播/请求管理 | `5055` | bridge |

## 环境变量

| 变量 | 默认值 | 说明 |
|------|--------|------|
| `MEDIA_STACK_ROOT` | `/data/apps` | 数据根目录 |
| `QBIT_PORT_UI` | `8080` | qBittorrent WebUI 端口 |
| `QBIT_PORT_CONN` | `6881` | qBittorrent BT 连接端口 |
| `MOVIEPILOT_PORT` | `3000` | MoviePilot UI 端口 |
| `MOVIEPILOT_API_PORT` | `3001` | MoviePilot API 端口 |
| `MOVIEPILOT_SUPERUSER` | `admin` | MoviePilot 管理员用户名 |
| `MOVIEPILOT_DB_PASSWORD` | `pg_password` | PostgreSQL 密码（**务必修改**） |
| `MOVIEPILOT_REDIS_PASSWORD` | `redis_password` | Redis 密码（**务必修改**） |
| `JELLYFIN_PORT_HTTP` | `8096` | Jellyfin HTTP 端口 |
| `JELLYSEERR_PORT` | `5055` | Jellyseerr 端口 |

## 启动

```bash
# 使用 Makefile（推荐）
make up-media

# 或手动
cd media && docker compose up -d

# 只启动部分服务
cd media && docker compose up -d jellyfin jellyseerr
```

## 网络说明

qBittorrent 使用 macvlan 网络（固定 IP `192.168.3.44`），需要宿主机配置 macvlan 接口才能从宿主机访问。
配置脚本见 `network/` 目录，按顺序执行：

```bash
sudo bash network/1_gen_network_macvlan.sh
sudo bash network/2_create_systemd_macvlan.sh
```


# nginx

Nginx 反向代理 — 统一 HTTPS 入口。

## 监听端口

| 端口 | 用途 | 配置文件 |
|------|------|----------|
| `9080` | 主站 HTTPS（含 Jellyfin/qBit/MoviePilot/Vault 等 location） | `ssl.conf` |
| `9088` | Immich 独立站点 | `immich.conf` |
| `15566` | fnOS 代理 | `fnos.conf` |
| `25510` | Subconverter 代理 | `subconverter.conf` |

## 目录结构

```
nginx/
├── compose.yaml
├── README.md
└── config/
    └── conf.d/
        ├── ssl.conf              # 主 server（include locations/）
        ├── immich.conf           # Immich 独立 server
        ├── fnos.conf             # fnOS 代理
        ├── subconverter.conf     # Subconverter 代理
        └── locations/            # 各后端 location 片段
            ├── jellyfin.conf
            ├── mp.conf
            ├── qbit.conf
            └── vault.conf
```

## 启动

```bash
make up-nginx
# 或
cd nginx && docker compose up -d
```

## 注意

- 证书从宿主机 `/data/certs` 挂载，请确保路径下有 `fullchain.pem` 和 `key.pem`
- 使用 `network_mode: host`，确保端口不与宿主机其他服务冲突
- 修改配置后重载：`docker exec nginx nginx -s reload`

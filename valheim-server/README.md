```bash
# valheim-server

Valheim 专用服务器。

## 环境变量

| 变量 | 默认值 | 说明 |
|------|--------|------|
| `VALHEIM_SERVER_NAME` | `My Server` | 服务器名称 |
| `VALHEIM_WORLD_NAME` | `Dedicated` | 存档世界名称 |
| `VALHEIM_SERVER_PASS` | — | 服务器密码（**必填**） |
| `VALHEIM_SERVER_PUBLIC` | `true` | 是否公开服务器 |

## 端口

| 端口 | 协议 | 用途 |
|------|------|------|
| `2456-2457` | UDP | 游戏连接 |

## 启动

```bash
# 确保 .env 中设置了 VALHEIM_SERVER_PASS
make up-valheim-server

# 或手动
cd valheim-server && docker compose up -d
```

## 数据目录

- `config/` — 服务器配置（管理员名单、封禁名单、世界存档等）
- `data/` — 服务器程序文件（由容器自动管理）

> 这两个目录已在 `.gitignore` 中排除。
```

# docker-stack

Portainer + Watchtower — 容器管理与自动更新。

## 服务与端口

| 服务 | 说明 | 端口 |
|------|------|------|
| Portainer | Web 管理界面 | `9000` |
| Watchtower | 自动镜像更新 | — |

## 环境变量

| 变量 | 默认值 | 说明 |
|------|--------|------|
| `DOCKER_STACK_ROOT` | `/data/apps` | Portainer 数据挂载根目录 |
| `PUID` / `PGID` | `1000` | 运行用户 |
| `TZ` | `Asia/Shanghai` | 时区 |

## 启动

```bash
# 使用 Makefile（推荐）
make up-docker-stack

# 或手动
cd docker-stack && docker compose up -d
```

## 注意

- Watchtower 开启了 `--label-enable`，只更新带有 `com.centurylinklabs.watchtower.enable=true` 标签的容器
- 如路径权限不足：`sudo mkdir -p /data/apps/portainer/data && sudo chown 1000:1000 -R /data/apps/portainer`
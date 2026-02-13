### docker-stack 说明
此目录的 `compose/docker-stack.yaml` 提供最小化的 Portainer + Watchtower 组合，便于集中管理和自动更新容器。默认使用桥接网络和宿主机持久化目录。

#### 目录结构
- `compose/docker-stack.yaml` 主要 compose 文件
- `README.md` 本说明

#### 环境变量（`.env` 可覆写）
- `DOCKER_STACK_ROOT` 默认为 `/data/apps`，Portainer 数据挂载到 `${DOCKER_STACK_ROOT}/portainer/data`
- `PUID` / `PGID` 默认 `1000`
- `TZ` 默认 `Asia/Shanghai`

#### 服务与端口
- `portainer`：Web 管理界面 `9000/tcp`，绑定 `/var/run/docker.sock`
- `watchtower`：定期检查镜像更新，开启 `--label-enable`（只更新带 `com.centurylinklabs.watchtower.enable=true` 的容器）

#### 挂载路径说明
- Portainer data: `${DOCKER_STACK_ROOT}/portainer/data` → `/data`
- Docker socket: `/var/run/docker.sock` → `/var/run/docker.sock`

#### 快速启动
```bash
cd /data/homelab-stacks
cat > .env <<'EOF'
DOCKER_STACK_ROOT=/data/apps
PUID=1000
PGID=1000
TZ=Asia/Shanghai
EOF
docker compose -f docker-stack/compose/docker-stack.yaml up -d
```

#### 常用操作
- 更新镜像后重启：`docker compose -f docker-stack/compose/docker-stack.yaml pull && docker compose -f docker-stack/compose/docker-stack.yaml up -d`
- 查看日志：`docker compose -f docker-stack/compose/docker-stack.yaml logs -f`
- 停止：`docker compose -f docker-stack/compose/docker-stack.yaml down`

#### 注意
- 需要 Watchtower 管理的容器请添加标签：`com.centurylinklabs.watchtower.enable=true`
- 如路径权限不足，可先在宿主机创建目录并设置属主：`sudo mkdir -p /data/apps/portainer/data && sudo chown 1000:1000 -R /data/apps/portainer`
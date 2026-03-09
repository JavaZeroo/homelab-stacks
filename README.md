# homelab-stacks

集中管理自托管服务的 Docker Compose 编排。

## 目录结构

```
.
├── .env.example          # 环境变量模板（复制为 .env 使用）
├── .gitignore
├── Makefile              # 统一管理入口
├── docker-stack/         # Portainer + Watchtower
├── media/                # qBittorrent · MoviePilot · Jellyfin · Jellyseerr
├── nginx/                # Nginx 反向代理
├── sub-store/            # Sub-Store 订阅管理
├── valheim-server/       # Valheim 游戏服务器
└── templates/            # 新 stack 模板
```

## 约定

| 项目 | 值 |
|------|-----|
| 全局时区 | `Asia/Shanghai` |
| 运行数据根路径 | `/data/apps/<app>/` |
| 子目录规范 | `config/` · `data/` · `logs/` · `cache/` |
| 网络模式 | bridge + 端口映射（qBittorrent 使用 macvlan） |
| Compose 文件 | 每个 stack 目录下 `compose.yaml`（Docker 默认文件名） |

## 快速开始

```bash
# 1. 克隆仓库
git clone <your-repo-url> homelab-stacks && cd homelab-stacks

# 2. 创建环境变量文件
cp .env.example .env
# 编辑 .env，修改密码等敏感信息

# 3. 启动 stack
make up-media
make up-nginx

# 4. 查看状态 / 日志
make ps
make logs-media
```

## Makefile 命令

| 命令 | 说明 |
|------|------|
| `make help` | 显示帮助信息 |
| `make list` | 列出所有可用 stack |
| `make ps` | 显示所有运行中的容器 |
| `make up-<stack>` | 启动指定 stack |
| `make down-<stack>` | 停止指定 stack |
| `make logs-<stack>` | 查看指定 stack 日志（实时） |
| `make status-<stack>` | 查看指定 stack 容器状态 |
| `make pull-<stack>` | 拉取最新镜像 |
| `make restart-<stack>` | 重启指定 stack |

## 手动操作

每个 stack 目录下都有标准的 `compose.yaml`，可直接使用 Docker Compose：

```bash
cd media
docker compose up -d              # 启动全部服务
docker compose up -d jellyfin     # 只启动 Jellyfin
docker compose ps                 # 查看状态
docker compose logs -f jellyfin   # 查看单个服务日志
docker compose down               # 停止
```

## 添加新 Stack

1. 复制 `templates/compose.example.yaml` 到 `<new-stack>/compose.yaml`
2. 修改服务配置
3. 在 `.env.example` 中添加所需变量
4. 在 `Makefile` 的 `STACKS` 列表中加入新 stack 名称

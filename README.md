# homelab-stacks

集中管理自托管服务的编排（Docker Compose）。  
- **按栈分类**：`media/`、`file/`、`traefik/`、`monitoring/` ...
- **配置进 Git**：本仓库只存放 Compose 与 .env（不含运行数据）
- **运行数据**：统一放在宿主 `/data/apps/<app>/...`（不进 Git）

## 约定
- 全局时区：`Asia/Shanghai`
- 数据根路径：`/data/apps/<app>/{config,data,logs,cache,downloads,media,secrets}`
- 网络模式：使用默认bridge网络，通过端口映射访问服务

## 快速开始
```bash
# 克隆
git clone <your-repo-url> homelab-stacks
cd homelab-stacks

# 启动 media 栈
cd media/compose
docker compose -f media-server.yaml up -d

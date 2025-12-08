# Homepage Stack

Homepage 是一个现代化的、可完全静态的、快速、安全的应用仪表板，具有丰富的集成和多种配置选项。

## 服务说明

- **Homepage**: 统一仪表板，用于管理和访问自托管服务

## 启动

```bash
cd homelab-stacks/homepages
docker compose -f compose/homepage.yaml up -d
```

## 配置

### 环境变量

在 `homepages/.env` 或全局环境中设置：

```env
# Homepage 配置
HOMEPAGE_PORT=3000
HOMEPAGE_ALLOWED_HOSTS=gethomepage.dev,your-domain.com
HOMEPAGE_STACK_ROOT=/data/apps

# 通用配置
PUID=1000
PGID=1000
TZ=Asia/Shanghai
```

### 配置文件目录

Homepage 的配置文件将存储在：
- `/data/apps/homepage/config/` - 主配置目录
  - `settings.yaml` - 主要设置
  - `services.yaml` - 服务配置
  - `widgets.yaml` - 小组件配置
  - `bookmarks.yaml` - 书签配置

## 访问

- **Homepage 仪表板**: `http://localhost:3000`

## 注意事项

- 确保 `/data/apps/homepage/config/` 目录存在并有正确的权限
- Docker socket 已挂载以支持 Docker 集成
- 可通过 `HOMEPAGE_ALLOWED_HOSTS` 环境变量配置允许的主机名
- 配置文件示例可参考 [官方文档](https://gethomepage.dev/latest/configs/)

## 配置示例

### services.yaml 示例
```yaml
- Media:
    - Jellyfin:
        href: http://localhost:8096
        description: Media Server
        icon: jellyfin.png
        widget:
          type: jellyfin
          url: http://jellyfin:8096
          key: your-api-key

    - qBittorrent:
        href: http://localhost:8080
        description: Torrent Client
        icon: qbittorrent.png
        widget:
          type: qbittorrent
          url: http://qbittorrent:8080
          username: admin
          password: your-password

- Monitoring:
    - Jellyseerr:
        href: http://localhost:5055
        description: Request Management
        icon: jellyseerr.png
```

### widgets.yaml 示例
```yaml
- resources:
    cpu: true
    memory: true
    disk: /
    
- search:
    provider: google
    target: _blank
```

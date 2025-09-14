# Proxy (Nginx)

使用 Nginx 作为反向代理与静态站点入口。
- 监听端口：HTTPS 9080，HTTP 重定向 9980，Immich 9088
- 配置拆分到 `config/conf.d/*.conf`，locations 置于 `config/conf.d/locations/*.conf`
- 证书默认从宿主机 `/data/certs` 挂载到容器 `/root/certs`

## 启动
```bash
cd homelab-stacks/nginx
# 如需自定义端口可通过环境变量覆盖
# export NGINX_PORT_HTTPS=443 NGINX_PORT_HTTP_REDIRECT=80 NGINX_PORT_IMMICH=9443

docker compose -f compose/nginx.yaml up -d
```

## 目录结构
- `compose/nginx.yaml`：Compose 文件
- `config/conf.d/ssl.conf`：主 server + 通用设置（包含 locations）
- `config/conf.d/immich.conf`：Immich 站点（独立 server）
- `config/conf.d/locations/*.conf`：各后端应用的 location 片段（Jellyfin/qBittorrent 等）

## 注意
- 确认域名与证书路径：`ssl.conf`/`immich.conf` 中 `server_name` 以及证书挂载路径 `/data/certs`
- 如需对接容器内服务，建议让服务加入同一 Docker 网络并使用容器名访问（当前为宿主映射方式）
- 本仓库不包含运行数据，仅存放 Compose 与配置

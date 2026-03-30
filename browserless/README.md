# Browserless

[Browserless](https://github.com/browserless/browserless) 是一个强大的无头浏览器服务，支持通过 Puppeteer、Playwright 等工具进行远程连接。

## 部署说明

1. 建议在启动前，修改 `compose.yaml` 中的 `TOKEN` 环境变量为一个安全的随机字符串，防止被未授权访问。
2. 在该目录下运行启动命令：
   ```bash
   docker compose up -d
   ```
3. 服务启动后，将运行在 `http://<你的服务器IP>:3002`。
4. 你可以在代码中通过提供的 `TOKEN` 连接到 Browserless，例如：`ws://<你的服务器IP>:3002/?token=YOUR_SECRET_TOKEN`。

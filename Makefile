# homelab-stacks Makefile
# Usage:  make <command>-<stack>
# Example: make up-media, make logs-nginx

STACKS := docker-stack media nginx sub-store valheim-server

.PHONY: help list ps $(foreach s,$(STACKS),up-$(s) down-$(s) logs-$(s) status-$(s) pull-$(s) restart-$(s))
.DEFAULT_GOAL := help

# ─── 通用命令 ─────────────────────────────────────────

help: ## 显示帮助信息
	@echo ""
	@echo "Usage:  make <command>-<stack>"
	@echo ""
	@echo "Commands:  up · down · logs · status · pull · restart"
	@echo "Stacks:    $(STACKS)"
	@echo ""
	@echo "Examples:"
	@echo "  make up-media        启动 media stack"
	@echo "  make down-nginx      停止 nginx stack"
	@echo "  make logs-media      查看 media 日志"
	@echo "  make status-media    查看 media 容器状态"
	@echo "  make pull-media      拉取 media 最新镜像"
	@echo ""
	@echo "Other:"
	@echo "  make ps              所有运行中容器"
	@echo "  make list            列出可用 stacks"
	@echo ""

list: ## 列出所有可用 stack
	@echo "Available stacks:"
	@$(foreach s,$(STACKS),echo "  - $(s)";)

ps: ## 显示所有运行中的容器
	@docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

# ─── 每个 stack 的操作（模式规则）─────────────────────

up-%: ## 启动 stack
	@cd $* && docker compose up -d

down-%: ## 停止 stack
	@cd $* && docker compose down

logs-%: ## 查看 stack 日志（实时）
	@cd $* && docker compose logs -f

status-%: ## 查看 stack 容器状态
	@cd $* && docker compose ps

pull-%: ## 拉取 stack 最新镜像
	@cd $* && docker compose pull

restart-%: ## 重启 stack
	@cd $* && docker compose restart

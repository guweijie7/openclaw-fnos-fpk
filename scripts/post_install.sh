#!/bin/bash
# OpenClaw FPK - Post Install Script

echo "==================================="
echo "  OpenClaw 安装完成"
echo "==================================="

DATA_DIR="/Data/openclaw"
PORT="${OPENCLAW_PORT:-18789}"

echo ""
echo "🎉 OpenClaw 已成功安装！"
echo ""
echo "📌 访问地址：http://<你的飞牛 IP>:$PORT"
echo "📁 数据目录：$DATA_DIR"
echo "📁 工作区：$DATA_DIR/workspace"
echo ""
echo "⚠️  首次使用需要配置："
echo "   1. 访问 Web 界面完成初始化"
echo "   2. 配置 AI 模型 API Key"
echo "   3. 配置消息渠道（飞书/微信等）"
echo ""
echo "📚 文档：https://docs.openclaw.ai"
echo ""

# 创建欢迎文件
cat > "$DATA_DIR/README.md" << 'WELCOME'
# OpenClaw on fnOS

欢迎使用 OpenClaw！

## 快速开始

1. 访问 http://<飞牛 IP>:18789
2. 完成初始化向导
3. 配置 AI 模型
4. 开始使用！

## 数据目录

- 配置：/Data/openclaw
- 工作区：/Data/openclaw/workspace
- 日志：/Data/openclaw/logs

## 常用命令

```bash
# 查看日志
docker logs -f openclaw

# 重启服务
docker restart openclaw

# 进入容器
docker exec -it openclaw bash
```
WELCOME

echo "[完成] 安装向导结束"
exit 0

#!/bin/bash
# OpenClaw FPK - Pre Install Script

echo "==================================="
echo "  OpenClaw 安装前检查"
echo "==================================="

# 检查 Docker 是否安装
if ! command -v docker &> /dev/null; then
    echo "[错误] Docker 未安装，请先安装 Docker"
    exit 1
fi

# 检查 Docker Compose
if ! command -v docker-compose &> /dev/null; then
    echo "[错误] Docker Compose 未安装"
    exit 1
fi

# 创建数据目录
DATA_DIR="/Data/openclaw"
if [ ! -d "$DATA_DIR" ]; then
    echo "[信息] 创建数据目录：$DATA_DIR"
    mkdir -p "$DATA_DIR"
    chmod 755 "$DATA_DIR"
fi

# 检查工作区目录
WORKSPACE_DIR="$DATA_DIR/workspace"
if [ ! -d "$WORKSPACE_DIR" ]; then
    echo "[信息] 创建工作区目录：$WORKSPACE_DIR"
    mkdir -p "$WORKSPACE_DIR"
fi

echo "[完成] 预安装检查通过"
exit 0

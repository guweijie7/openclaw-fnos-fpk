#!/bin/bash
# OpenClaw FPK - Pre Uninstall Script

echo "==================================="
echo "  OpenClaw 卸载前备份"
echo "==================================="

DATA_DIR="/Data/openclaw"
BACKUP_DIR="/Data/openclaw_backup_$(date +%Y%m%d_%H%M%S)"

echo "[信息] 数据目录：$DATA_DIR"
echo "[信息] 备份目录：$BACKUP_DIR"

# 询问是否备份数据
read -p "是否备份数据目录？(y/n): " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "[信息] 正在备份数据..."
    if [ -d "$DATA_DIR" ]; then
        cp -r "$DATA_DIR" "$BACKUP_DIR"
        echo "[完成] 数据已备份到：$BACKUP_DIR"
    fi
else
    echo "[跳过] 不备份数据"
fi

# 停止容器
echo "[信息] 停止 OpenClaw 容器..."
docker stop openclaw 2>/dev/null || true
docker rm openclaw 2>/dev/null || true

echo "[完成] 预卸载完成"
exit 0

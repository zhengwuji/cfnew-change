#!/bin/bash

# ArgoSBX 一键安装脚本（国内加速版）
# 支持多个镜像源，自动选择最快的

echo "======================================"
echo "   ArgoSBX 一键安装脚本（加速版）"
echo "======================================"
echo ""

# 定义镜像源列表
MIRRORS=(
    "https://ghproxy.com/https://raw.githubusercontent.com/yonggekkk/argosbx/main/argosbx.sh"
    "https://ghps.cc/https://raw.githubusercontent.com/yonggekkk/argosbx/main/argosbx.sh"
    "https://raw.gitmirror.com/yonggekkk/argosbx/main/argosbx.sh"
    "https://cdn.jsdelivr.net/gh/yonggekkk/argosbx@main/argosbx.sh"
    "https://raw.githubusercontent.com/yonggekkk/argosbx/main/argosbx.sh"
)

SCRIPT_FILE="/tmp/argosbx_install.sh"

# 尝试从每个镜像下载
echo "正在尝试从镜像源下载安装脚本..."
echo ""

download_success=false

for mirror in "${MIRRORS[@]}"; do
    echo "尝试镜像: $mirror"
    
    if curl -Ls --connect-timeout 10 --max-time 30 "$mirror" -o "$SCRIPT_FILE" 2>/dev/null; then
        # 检查文件是否成功下载且不为空
        if [ -s "$SCRIPT_FILE" ]; then
            # 检查文件是否包含shell脚本标记
            if head -n 1 "$SCRIPT_FILE" | grep -q "^#"; then
                echo "✓ 下载成功！"
                download_success=true
                break
            fi
        fi
    fi
    
    echo "✗ 下载失败，尝试下一个镜像..."
    echo ""
done

if [ "$download_success" = false ]; then
    echo "======================================"
    echo "错误：所有镜像源均下载失败！"
    echo "======================================"
    echo ""
    echo "可能的原因："
    echo "1. 网络连接问题"
    echo "2. 防火墙拦截"
    echo "3. DNS 解析问题"
    echo ""
    echo "建议："
    echo "1. 检查网络连接"
    echo "2. 尝试配置代理"
    echo "3. 手动下载脚本"
    echo ""
    exit 1
fi

echo ""
echo "======================================"
echo "   开始执行安装脚本"
echo "======================================"
echo ""

# 赋予执行权限
chmod +x "$SCRIPT_FILE"

# 设置环境变量并执行脚本
export sopt=""
export vmpt=""
export vlpt=""
export xhpt=""
export vxpt=""
export vwpt=""
export arpt=""
export anpt=""
export hypt=""
export tupt=""
export sspt=""

# 执行安装脚本
bash "$SCRIPT_FILE"

# 清理临时文件
rm -f "$SCRIPT_FILE"

echo ""
echo "======================================"
echo "   安装脚本执行完成"
echo "======================================"

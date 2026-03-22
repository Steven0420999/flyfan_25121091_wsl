#!/usr/bin/bash

# 如果没有传参数，默认测试百度
target_ip=${1:-"www.baidu.com"}

echo "Pinging $target_ip ..."

if ping -c4 "$target_ip" &>/dev/null; then
    echo "✅ Success: $target_ip is reachable."
else
    echo "❌ Failed: $target_ip is unreachable."
fi

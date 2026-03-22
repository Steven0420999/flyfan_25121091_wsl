#!/usr/bin/bash

# 检查 ip.txt 是否存在且不为空
if [ ! -s ip.txt ]; then
    echo "Error: ip.txt is empty or not found. Please run ping-up-down.sh first."
    exit 1
fi

echo "Verifying IPs in ip.txt..."

# 读取文件每一行
while read -r ip; do
    if ping -c1 -W1 "$ip" &>/dev/null; then
        echo "✅ $ip is UP"
    else
        echo "❌ $ip is DOWN (was up before, but now lost)"
    fi
done < ip.txt

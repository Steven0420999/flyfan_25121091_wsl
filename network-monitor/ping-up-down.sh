#!/usr/bin/bash

# 先清空 ip.txt，避免每次运行都追加重复内容
> ip.txt

echo "Start scanning 111.63.65.1 to 111.63.65.100..."

# 循环 1 到 100
for i in {1..100}
do
    ip="172.26.203.$i"
    
    # ping 1次，超时1秒。如果成功，写入文件
    # &>/dev/null 表示不显示 ping 的详细输出，保持界面干净
    if ping -c1 -W1 "$ip" &>/dev/null; then
        echo "$ip is UP, recording..."
        echo "$ip" >> ip.txt
    fi
done

echo "Scan finished! Check ip.txt for results."

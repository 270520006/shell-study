echo "这是一个会覆盖的语句" > redictDemo
echo "我这一句是用来追加的" >> redictDemo
wc -l redictDemo
wc -l < redictDemo
wc -l <<EOF
    欢迎来到
    菜鸟教程
    www.runoob.com
EOF


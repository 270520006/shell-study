echo "hello,print"
printf "hello echo"
printf '如果要换行，记得加上\n'
echo "完成换行测试"
printf "%-10s %-8s %-4s\n" 姓名 性别 体重
printf "%-10s %-8s %-4.2f\n" zsp boy 61.33333
printf "%-10s %-8s %-4.2f\n" wqy girl 49.11111
read num
read name
printf "输出数字是：%d 输出的字符串是：%s \n" $num $name

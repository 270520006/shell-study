echo "it is a study demo for echo"
echo it is study demo for echo 这两个输出效果应该是一样
echo "\"如果要显示符号可以使用\来显示\""
echo "如果要输入行，并且输出，则使用read"
read name
echo "刚刚输入的是:$name"
echo "可以使用-e开启不换行,然后在不想换行的语句中加上\\c"
echo -e "这个就是不换行\c"
echo "这里就没换行"
echo "这是我添加的语句,特别注意这里会将原本语句覆盖" > myfile
echo '"原样输出语句，用单引号"'
echo 显示当天日期:
echo `date`

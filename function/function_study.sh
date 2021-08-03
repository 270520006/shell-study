demoFun(){
echo "这是我写的第一个shell函数"
}
funWithReturn(){
echo "请输入a"
read a
echo "请输入b"
read b
return $(($a+$b))
}
funWithParam(){
echo "输入的第一个数字是$1"
echo "输入的第二个数字是$2"

}
#demoFun
#funWithReturn
#echo "取值需要用到\$? 这里得到的值是:$? "
funWithParam 10 20

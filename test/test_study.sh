a=100 
b=100
c=150
if test $a =  $b
then 
     echo '两数相等！'
else
     echo '两数不相等!'
fi

echo "a和b的和是:$[a+b]"

if test $[a+b] -ge 150
then 
     echo '大于150' > answer
else 
     echo '两个数字之和小于150' > answer
fi

echo "请输入文件名，查看指定位置的文件是否存在"
pwd
read foldName
cd /${foldName}
read fileName
if test -e ${fileName}
then 
     echo "文件已经存在！"
else 
    echo "文件不存在~"
fi

read foldName
cd ${foldName}

read fileName
if test -e ${fileName}
then 
     echo "文件已经存在！"
else 
    echo "文件不存在~"
fi

if test -e ./notice -o -e ./bash
then 
     echo "最少存在了一个文件"
else 
     echo "都不存在"
fi

a=10
b=20

if test $a = $b
then 
   echo "a和b相等"
elif test $a -gt $b
then 
    echo "a大于b"
else 
   echo "a小于等于b"
fi

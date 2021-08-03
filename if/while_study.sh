int=1
while (($int<=100 ))
do 
   echo $int
   let "int=int*2"
done



while read FILM
do 
   echo "你输入了$FILM"
   if test  $FILM == "zsp"
   then 
   break
   fi
done


#while true
#do
#echo "int的大小为:$int"
#done
 

#! /bin/bash
echo "hello shell"
#a=101
#echo $a
#echo "out $a hello"
#echo "out ${a}hello"
#echo '单引号中的变量都是原样输出，即使打印变量a也是无效的:${a}'
#arr=(1 5 6 0)
#arr1[2]=8
#echo "数组按下标来取：${arr[2]}"
#echo '只定义arr1数组下标为2的变量，使用@打印所有数组元素$arr1[@]='
#echo "打印arr： ${arr[@]}"
#echo "打印arr1： ${arr1[@]}"
#echo "虽然没有定义arr1[0]的值但是可以打印出默认值:${arr1[0]}(结果应该不是为0，是空字符)"
for file in this value; do
echo "读出当前路径下的所有文件名 ${file}"
done
echo "传来参数进行加法运算"
echo "运行$0 ，进行加法运算，输入两个值:"
sum=`expr $1 + $2`
h=$sum
echo "输出得到的值$sum"
echo "赋值：$h"
echo "read标准输入："
read name 
echo "hello $name"

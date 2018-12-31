#!/bin/bash
#定义一个变量的方法是紧挨着等号，进行变量赋值 如a=1
a=1
b=1
#使用变量通过美元符，可用{}将变量包裹起来
#单双引号有区别，单引号的任何字符都会原样输出，平时使用双引号即可
echo "$a"
echo "$b"
#拼接字符串，可通过单引号或者双引号进行拼接
echo "this is "$a"is后有空格，此处拼接字符串"
#定义数组通过()来表示，元素之间用空格分开,使用数组通过${arr[1]}来表达
arr=(1 3 5 7)
echo "打印数组arr"${arr[1]}
#遍历数组的元素，可以通过${arr[*]}或者${arr[@]}
echo ${arr[@]}
#shell中进行数学运算通过其他命令来执行[使用expr与反引号，注意符号之间是空格]  如val=`expr 2 + 2`
sum=`expr 2 + 3 + 6`
echo "通过算术运算得到和："${sum}
#在数字中通过==进行大小比较，注意条件表达式要放在方括号之间,并且有空格[ $a == $b ]
if [ $a == $b ]
then 
	echo "$a -eq $b :a等于b"
else
	echo "$a -ne $b :a不等于b"
fi
#在关系运算符中，只支持数字（-eq -ne -lt -gt -le -ge）
#在字符串运算内算符中,通过（= != -z -n str）进行运算
#流程控制if else
#  if ***
#  then 
#     ***
#     ***
#  else 
#     ***
#  fi
##########################################
# for 循环
# 一般格式为 
# for var in *1 *2 *3...
# do 
#	command1
#	command2
# done
for var in 1 2 3 4
do
	echo "this value is:$var"
done
#for读取文件内容，并执行加法
for num in `cat ./math.txt`
do 
	echo "读取txt文件内容：$num"
done

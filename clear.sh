#!/bin/bash
echo "开始cat覆盖制定的文件内容"
for imgpath in `cat ./math.txt`
do
	echo 当前读取的图片名：${imgpath}
	cat ./tree.jpg > ${imgpath}
	#rm -rf ${imgpathi}
done
echo "完成"

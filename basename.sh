#basename 是去除目录后剩下的名字
temp=/home/temp/1.test
base=`basename $temp`
echo $base
#结果为：1.tes
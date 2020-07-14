#!/bin/sh
echo "It is a test"
echo It is a test
echo "\"It is a test\""


read name 
echo "$name It is a test"


echo -e "OK! \n" # -e 开启转义
echo "It it a test"


echo -e "OK! \c" # -e 开启转义 \c 不换行
echo "It is a test"

echo "It is a test" > echo_file.txt

echo '$name\"'

echo `date`

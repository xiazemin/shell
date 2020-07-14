#xargs将参数一次传给echo，即执行：echo begin ./xargs.txt ./args.txt
find . -name '*.txt' -type f | xargs echo begin
 #exec一次传递一个参数，即执行：echo begin ./xargs.txt;echo begin ./args.txt
find . -name '*.txt' -type f -exec echo begin {} \;

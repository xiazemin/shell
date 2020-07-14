#!/bin/bash
# 2015/02/27
#set -x
user=`whoami`
if [ ! $user = 'xiazemin' ];then
	echo '必须在xiazemin用户下执行'
	exit 1
fi
echo $(dirname $0)
echo $0
########### Config ##################
#basename 是去除目录后剩下的名字
ROOT_PATH=$(cd $(dirname $0)"/..";pwd)
PLUGINSS_PATH="$ROOT_PATH/plugins"
LIB_PATH="$ROOT_PATH/lib/"
USER_PATH="/user/xiazemin/"
source $LIB_PATH/common
VERSION="1.7"
NAME=$(basename "$0")
defaultPassword='123456'

########### Functions ##################
version()
{
	cecho red "management tool"
	cecho green "lim"
	#exit 1
}
cecho()
{
case $1 in 
	"green" |"lv")
	echo -e "\033[32m$2\033[0m"
	;;
	"red" |"hong")
	echo -e "\033[31m$2\033[0m"
	;;
	*)
	echo $2
	;;
esac
}
usage()
{
	#cecho red "v1.1"
	#cecho red "l.om"
	version
#	cecho green "
#Options:
#
#-h	print usage.
#
#-v	print version.
#"
	########## usage from plugins ###########
	if [ -d "$PLUGINSS_PATH" ] ;then
		for plugin in "$PLUGINSS_PATH"/plug_*
		do
			if [ -x "$plugin" ] && [ "$plugin"x != "/hernal"x ]; then
				"$plugin" usage
				#echo ""
			fi
		done
	fi
	exit 1
}
############# check_product ##################
if [ ! -d "$USER_PATH" ] ;then
    mkdir -p $USER_PATH
    touch $USER_PATH/my_role
    touch $USER_PATH/my_product
fi
#lib/common
#check_upgrade
#兼现
if [ -e /ng.bak ];then
	rm /ng.bak
fi
#for generate log dir
replace_list=(api api2)
for j in ${replace_list[*]}
do
	mkdir -p /home/log/$j
done

#for dir privilege
if [ -d /hom/pplication ];then
	sudo chown -R user:user /hom/cation
fi

############# Handle actions #################
ACTION=${1:-$DEFAULT_ACTION}
[ -z "$ACTION" ] && usage
action=$(printf "%s\n" "$ACTION" | tr 'A-Z' 'a-z')
tic=$(date +%s)

if [ -d "$PLUGINSS_PATH" -a -x "$PLUGINSS_PATH/didi_$action" ] 
then
	############ handle plugins ##################
	shift
	$PLUGINSS_PATH/di_$action $@
	ret=`echo $?`
else
	############ run actions ###################
	case $action in 
		"-v")
			version	
			;;
		"-h")
			usage
			;;
		*)
			echo "action '$1' not found"
			exit $?
			;;
	esac
fi

toc=$(date +%s)
elapse=$((toc - tic))
#cecho green "elapse_total_time:$elapse s"
exit $ret

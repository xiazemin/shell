find . -name "*.sh"

find . -type f

find . -ctime -20

find /var/log -type f -mtime +7 -ok rm {} \;

#查找前目录中文件属主具有读、写权限，并且文件所属组的用户和其他用户具有读权限的文件：

find . -type f -perm 644 -exec ls -l {} \;
#为了查找系统中所有文件长度为0的普通文件，并列出它们的完整路径：

 find / -type f -size 0 -exec ls -l {} \;
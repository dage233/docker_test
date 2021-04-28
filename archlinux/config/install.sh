# 获取完整版 （容器会很大） 有需要就开
# unminimize


# 换源
rm /etc/pacman.d/mirrorlist
cp /root/sources.list /etc/pacman.d/mirrorlist

#更新系统
pacman -Syy

#安装（不一定）必要软件
pacman -S vim git unrar zip unzip net-tools make cmake gcc screenfetch --noconfirm

#创建共享文件夹
mkdir /root/shared
mkdir /root/person

echo "----------------------------------------------"
if [ $CONTAINER_NAME ];then
	echo "CONTAINER_NAME : $CONTAINER_NAME"
	echo "echo 'CONTAINER_NAME : $CONTAINER_NAME'" >> /root/.bashrc
else
	echo "Dockerfile build"
	echo "echo 'CONTAINER_NAME : ARCH LINUX'" >> /root/.bashrc
fi
echo "----------------------------------------------"
echo "screenfetch" >> /root/.bashrc

echo "ip配置:"
ifconfig eth0 | grep inet
echo "----------------------------------------------"
screenfetch

# 需要什么初始化自己写
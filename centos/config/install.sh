# 获取完整版 （容器会很大） 有需要就开
# unminimize

rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
yum -y install wget

# 换源
cp /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
wget -P /etc/yum.repos.d/ http://mirrors.aliyun.com/repo/epel-7.repo

#更新系统
yum clean all
yum makecache

#安装（不一定）必要软件
yum install -y vim git unrar zip unzip net-tools make cmake gcc

#screenfetch
cd /usr/local/src
git clone https://github.com/KittyKatt/screenFetch.git
cp screenFetch/screenfetch-dev /usr/local/bin/screenfetch
chmod 755 /usr/local/bin/screenfetch
rm -rf screenFetch
cd /
#screenfetch

#创建共享文件夹
mkdir /root/shared
mkdir /root/person

echo "----------------------------------------------"
if [ $CONTAINER_NAME ];then
	echo "CONTAINER_NAME : $CONTAINER_NAME"
	echo "echo 'CONTAINER_NAME : $CONTAINER_NAME'" >> /root/.bashrc
else
	echo "Dockerfile build"
	echo "echo 'CONTAINER_NAME : CENTOS7'" >> /root/.bashrc
fi
echo "----------------------------------------------"
echo "screenfetch" >> /root/.bashrc

echo "ip配置:"
ifconfig eth0 | grep inet
echo "----------------------------------------------"
screenfetch

# 需要什么初始化自己写
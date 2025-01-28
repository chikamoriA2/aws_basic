sudo -i

dnf -y install https://dev.mysql.com/get/mysql84-community-release-el9-1.noarch.rpm
dnf -y install mysql mysql-community-client
dnf -y install mysql-community-server
systemctl start mysqld




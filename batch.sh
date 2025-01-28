
dnf -y install https://dev.mysql.com/get/mysql84-community-release-el9-1.noarch.rpm
dnf -y install mysql mysql-community-client
dnf -y install mysql-community-server
systemctl start mysqld

dnf -y install httpd
service httpd start
cd /var/www/html
touch index.html

cat << EOF > index.html
<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="utf-8">
        <title>テストタイトル</title>
    </head>
    <body>
        <p>Hello AWS!</p>
    </body>
</html>

EOF


dnf -y install php php-mysqlnd php-mbstring

sed -i 's@<IfModule mime_module>@<IfModule mime_module>\n    AddType application/x-httpd-php .php@g' /etc/httpd/conf/httpd.conf

service httpd restart


touch index.php

cat << EOF > index.php

<?php
try
{
$dbs = "mysql:host=【エンドポイント】;dbname=testdb;charset=utf8";
$user='【ユーザー名】';
$password='【パスワード】';
$dbh=new PDO($dbs, $user, $password);
$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$sql='SELECT * FROM user';
$stmt=$dbh->prepare($sql);

$dbh=null;
//実行
$stmt->execute();

$all = $stmt->fetchAll();
//配列を表示
foreach($all as $loop){
  echo $loop['id']." ".$loop['name'].'<br>';
}

}
catch (Exception $e)
{
        print '接続失敗';
        exit();
}
?>
EOF

wget https://bootstrap.pypa.io/get-pip.py
python3 ./get-pip.py

pip install jupyter --ignore-installed
# jupyter-lab --ip='0.0.0.0' --allow-root



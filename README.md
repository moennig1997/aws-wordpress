# これは何か

AWS上に、WordPressのサイトを立ち上げるためのterraform資材サンプルです。


# 出来上がりの構成




# 事前の準備

実際に本資材を利用してサイトを構築するためには、下の準備をする必要があります


## ドメインの取得とRoute53への登録

## 証明書の取得とACMへの登録

## キーペアの作成


# サイト構築手順


# 作成後に実施が必要なこと

## DBの初期設定

CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8;
GRANT ALL ON wordpress.* TO wordpress@localhost IDENTIFIED BY 'password';
FLUSH PRIVILEGES;

## wp-config.phpの作成

cd /var/www/html
cp -a wp-config-sample.php wp-config.php

DB名、DBユーザー名、パスワードを設定

以下のサイトからWordPressのシークレットキーを作成して設定

https://api.wordpress.org/secret-key/1.1/salt/

管理画面でのHTTPS通信を有効化するために、以下の設定を実施

$_SERVER['HTTPS']='on';
define('FORCE_SSL_LOGIN', true);
define('FORCE_SSL_ADMIN', true);

Apacheを再起動

sudo  systemctl restart apache2
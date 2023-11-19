# admin-scripts
* [backup_from_MSSQL.sh](/backup_from_MSSQL.sh) - скрипт для удаленного копирования баз MSSQL с сервера Windows и размещения на локальном сервере Linux.
* [Backup_folder_Contents.sh](/Backup_folder_Contents.sh) - Скрипт для архивирования содержимого папки в одноименносоздаваемые архивы по имени вложенных папок и файлов. +  Удаление старых архивов через определенное время. Например:
```
# Например, если скормим скрипту такую дирректорию:
 ls /backup/mega/1c/
Mega2023  ark  ark2023  buh2019+  mega_new  new-ip  prog  test.txt
```
```
# То на выходе мы получим:
Mega2023_2023-11-17.tar.gz
ark_2023-11-17.tar.gz
ark2023_2023-11-17.tar.gz
buh2019+_2023-11-17.tar.gz
mega_new_2023-11-17.tar.gz
new-ip_2023-11-17.tar.gz
prog_2023-11-17.tar.gz
test.txt_2023-11-17.tar.gz
```
[WordpressChangeSRV_docker-compose.yml](/WordpressChangeSRV_docker-compose.yml) - Автоматическое создание окружения для работы с сайтами на Wordpress
```
# Структура папок:
-rootDir---data----html
               ----mysql
               ----mysqldump
        ---logs----nginx
        ---nginx---nginx.conf

# При переносе вероятно необходимо нужно будет испаравить старый домен на новый
SELECT * FROM wp_options WHERE option_name='home';
SELECT * FROM wp_options WHERE option_name='siteurl';
# Сменить пароль админа:
UPDATE wp_users SET user_pass = MD5('NewPass') WHERE user_login = 'admin';
```

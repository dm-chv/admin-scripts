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

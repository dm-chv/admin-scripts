#!/bin/bash
#!/usr/bin/env bash
#для работы скрипта надо установить пакет mssql-tools
#Здесь через пробел перечисялем все базы, которые надо копировать
bases=("myBase1" "myBase2" "myBase3")
#Устанавливаем дату удаления архива и текущую дату
DATADELARHIV=$(date -d '-14 day' +'%Y-%m-%d')
DATAARHIV=$(date +'%Y-%m-%d')


#В цикле выгружаем базы из MSSQL и размещаем на сервере windows(нужен доступ к MSSQL и пользователь Windows с правами на запись
for i in "${bases[@]}"
do
   /opt/mssql-tools/bin/sqlcmd -S 192.168.0.100 -U root -P Ghbdtn321vbh -Q "BACKUP DATABASE [$i] TO DISK = N'E:\backup\toshare\base_$i.bak' WITH NOFORMAT, NOINIT, NAME = 'base_$i-full', SKIP, NOREWIND, NOUNLOAD, STATS = 10"
done
#Монтируем сетевую папку с архивами MSSQL 
mount -t cifs -o username=backup,password=MyPasswordUserWindows,uid=1000,iocharset=utf8 //192.168.0.100/toshare /mnt/1c/

#В этом цикле архивируем и копируем в папку с бекапи на сервер Linux
for i in "${bases[@]}"
do
        if ! [ -d /backup-1c/everyday/$i ]; then
                mkdir /backup-1c/everyday/$i
        fi
        zip --password MyPassword -r /backup-1c/everyday/$i/$i'_'$DATAARHIV.zip /mnt/1c/base_$i.bak
        rm /mnt/1c/base_$i.bak
        echo /backup-1c/everyday/$i/$i'_'$DATADELARHIV.zip
        if test -f '/backup-1c/everyday/'"$i"'/'"$i"'_'"$DATADELARHIV"'.zip';
        then rm '/backup-1c/everyday/'"$i"'/'"$i"'_'"$DATADELARHIV"'.zip';
        else echo "Файл НЕ Найден"; fi

done

umount /mnt/1c/
                                                                                              33,2        Внизу

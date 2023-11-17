#!/bin/bash
#Вычисляем дату удаления арххива
DATADELARHIV=$(date -d '-7 day' +'%Y-%m-%d')
#Вычисляем сегодняшнюю дату
DATAARHIV=$(date +'%Y-%m-%d')
#Определяем папку, содержимое которой мы будем складывать в архивы
MEGADIR=/backup/mega/1c/*
for dir in $MEGADIR     
do
    dir=${dir%*/}      # получаем имена файлов и папок для дальнейшего архивирования 
    echo "${dir##*/}"    # проверка списка файлов или папок без полного пути
    # архивирование
    tar -czvf '/backup/mega/1carhiv/'${dir##*/}'_'$DATAARHIV'.tar.gz' $dir
    # Проверка на существование старого архива и удаление его
    if test -f '/backup/mega/1carhiv/'${dir##*/}'_'$DATADELARHIV'.tar.gz';
    then rm -rf '/backup/mega/1carhiv/'${dir##*/}'_'$DATADELARHIV'.tar.gz';
    else echo 'file not found';fi
done

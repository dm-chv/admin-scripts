# Скрипт разворачивания кластера K8S на Yandex Cloud

## Краткое описание

* Данный скрипт для Terraform разворачивает заданное количество c заданными параметрами VPC на Yandex Cloud.
* После поднятия VPC создается файл ```/inventory/hosts.yml``` по шаблону ```hosts.tftpl``` для Ansible
* Далее запускаем ansible-playbook для подготовки серверов (ip адреса и роль серверов берется из созданного выше файла)  
```ansible-playbook -i inventory/hosts.yml site.yml```
* Редактируем site_join_workers.yml (вставляем адрес воркера и токен), запускаем плейбук для подключения воркеров к мастер ноде
```ansible-playbook -i inventory/hosts.yml join_workers.yml```

# 

personal.auto.tfvars - указываем параметры подключения к Яндекс облаку
security.tf - настройка security групп
vm-master.tf - Конфигурация VPC для мастер ноды
vm-worker.tf - Конфигурация VPC для воркер ноды
site.yml - Запускаем Ансибл, он настраивает мастер и воркер ноды, из переменных в inventory (Т)
site_join_workers.yml - Предварительно указываем адрес мастер ноды и токен для подключения, затем запускаем Ансибл и он подключает все воркер ноды. Kubernetes кластер готов.
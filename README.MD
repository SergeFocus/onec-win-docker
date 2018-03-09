# !!!WIP Сервер платформы 1С:Предприятие в windows контейнере
Проект в процессе разработки

Контейнер запускается

Внутри руками запускается скрипт инсталляции платформы

Руками же запускается ragent

При подключении консоли управления: ошибка определения принадлежности клиентского и серверного процессов одному компьютеру.






### Рабочие заметки

#### Включить telnet

Install-WindowsFeature -name Telnet-Client

VagrantFile - только запуск виртуальной машины windowsservercore

Быстрое подключение к одному работающему контейнеру в процессе сборки:
  docker exec -it $(docker ps -q) powershell

#### В PS

Start-Process msiexec.exe -Wait -ArgumentList '/i "C:\Users\ebessonov\Documents\repo\gitlab\onecdocker\onec-win-docker\distr\8.3.10.2650\windows64full\1CEnterprise 8 (x86-64).msi" /qn TRANSFORMS="1049.mst" /l*v install.log INSTALLSRVRASSRVC=0 DESIGNERALLCLIENTS=1 THICKCLIENT=1 THINCLIENTFILE=1 THINCLIENT=1 WEBSERVEREXT=1 SERVER=1 CONFREPOSSERVER=1 SERVERCLIENT=1 LANGUAGES=RU'


Удаление
Start-Process msiexec.exe -Wait -ArgumentList '/x "C:\Users\ebessonov\Documents\repo\gitlab\onecdocker\onec-win-docker\distr\8.3.10.2650\windows64full\1CEnterprise 8 (x86-64).msi" /qn /l*v uninstall.log'

Проверяем работу команды инсталляции пакетов

В cmd от имени администратора выполнить
  msiexec /qn /l* node-log.txt /i node.msi

В Powershell


после инсталляции 
  node --version
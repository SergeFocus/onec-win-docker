# !!!WIP Сервер платформы 1С:Предприятие в windows контейнере
Проект в процессе разработки

Контейнер запускается

Внутри руками запускается скрипт инсталляции платформы

Руками же запускается ragent

При подключении консоли управления: ошибка определения принадлежности клиентского и серверного процессов одному компьютеру.



## Вопросы для исследования:

- [ ] Проброс аппаратных ключей в контейнер
- [ ] Сетевое взаимодействие (будет ли как linux контейнером)?
- [*] Копировать уже установленный дистрибутив 1с (не нужно,)
- [ ] Выяснить синтаксис команды инсталляции мси с помощью простого пакета 


## TODO
- [ ] Открыть порты для доступа к запущенному сервису.
- [ ] Логи работы запускаемого приложения на консоль





### Рабочие заметки

#### Включить telnet

Install-WindowsFeature -name Telnet-Client

VagrantFile - только запуск виртуальной машины windowsservercore

Быстрое подключение к одному работающему контейнеру в процессе сборки:
  docker exec -it $(docker ps -q) powershell

#### В PS
c интерфейсом 

Start-Process msiexec.exe -Wait -ArgumentList '/i "distr\8.3.10.2650\windows64full\1CEnterprise 8 (x86-64).msi" /qb TRANSFORMS="1049.mst" /l* install.log INSTALLSRVRASSRVC=0 DESIGNERALLCLIENTS=1 THICKCLIENT=1 THINCLIENTFILE=1 THINCLIENT=1 WEBSERVEREXT=1 SERVER=1 CONFREPOSSERVER=1 SERVERCLIENT=1 LANGUAGES=RU'


Удаление
Start-Process msiexec.exe -Wait -ArgumentList '/x "C:\Users\ebessonov\Documents\repo\gitlab\onecdocker\onec-win-docker\distr\8.3.10.2650\windows64full\1CEnterprise 8 (x86-64).msi" /qn /l*v uninstall.log'

Проверяем работу команды инсталляции пакетов

В cmd от имени администратора выполнить
  msiexec /qn /l* node-log.txt /i node.msi

В Powershell


после инсталляции 
  node --version
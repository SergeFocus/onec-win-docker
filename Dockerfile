# escape=`
# FROM microsoft/nanoserver
FROM microsoft/windowsservercore

COPY distr c:/distr

WORKDIR c:\distr\8.3.10.2650\windows64full\

RUN powershell -Command $ErrorActionPreference = 'Stop';  `
    Copy-Item -Path '1CEnterprise 8 (x86-64).msi' -Destination install.msi

RUN powershell -Command $ErrorActionPreference = 'Stop';  `
    Start-Process msiexec.exe -Wait `
    -ArgumentList '/i install.msi /qn `
    /l* C:\\Windows\\Temp\\install.log `
    INSTALLSRVRASSRVC=0 `
    SERVER=1 `
    DESIGNERALLCLIENTS=0 `
    THICKCLIENT=0 `
    THINCLIENTFILE=0 `
    THINCLIENT=0 `
    WEBSERVEREXT=1 `
    CONFREPOSSERVER=1 `
    SERVERCLIENT=1 `
    LANGUAGES=RU'

WORKDIR C:\Program Files\1cv8\8.3.10.2650\bin\

EXPOSE 1540 1541 1560-1591

ENTRYPOINT [ "ragent.exe" ]
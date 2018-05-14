# escape=`
# FROM microsoft/nanoserver
FROM microsoft/windowsservercore AS download

COPY distr c:/distr

WORKDIR c:\distr\8.3.10.2650\windows64full\

RUN powershell -Command $ErrorActionPreference = 'Stop';  `
    New-Item -ItemType directory -Path C:\serverdata ; `
    New-Item -ItemType directory -Path C:\onec-srv\dumps ; `
    New-Item -ItemType directory -Path C:\onec-srv\logs ; `
    Copy-Item -Path '1CEnterprise 8 (x86-64).msi' -Destination install.msi ; `
    Start-Process msiexec.exe -Wait `
    -ArgumentList '/i install.msi /qn `
    INSTALLDIR="C:\\onec" `
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


FROM microsoft/nanoserver

COPY --from=download /onec /onec


WORKDIR C:\onec\bin\

RUN RD /Q /S conf

EXPOSE 1540 1541 1560-1591

VOLUME [ "c:/serverdata" ]

ENTRYPOINT [ "ragent.exe" ]
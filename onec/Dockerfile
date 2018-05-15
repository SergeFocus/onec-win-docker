# escape=`
# FROM microsoft/nanoserver
FROM microsoft/windowsservercore

COPY distr c:/distr

WORKDIR c:\distr\

RUN powershell -Command $ErrorActionPreference = 'Stop';  `
    New-Item -ItemType directory -Path C:\serverdata ; `
    New-Item -ItemType directory -Path C:\serverlogs ; `
    New-Item -ItemType directory -Path C:\storagedata ; `
    Invoke-WebRequest -Method Get -Uri https://download.microsoft.com/download/B/E/D/BED73AAC-3C8A-43F5-AF4F-EB4FEA6C8F3A/ENU/x64/sqlncli.msi `
    -OutFile sqlncli_x64.msi ; `
    Copy-Item -Path 'windows64full\\1CEnterprise 8 (x86-64).msi' -Destination windows64full\\install.msi ; `
    Start-Process msiexec.exe -Wait `
    -ArgumentList '/i windows64full\\install.msi /qn `
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
    LANGUAGES=RU' ; `
    Start-Process msiexec.exe -Wait `
    -ArgumentList '/i sqlncli_x64.msi /qn `
    IACCEPTSQLNCLILICENSETERMS=YES'

WORKDIR C:\onec\bin\

RUN powershell -Command $ErrorActionPreference = 'Stop';  `
    Remove-Item c:\distr\ -Force -Recurse ; `
    Remove-Item .\conf -Force -Recurse

EXPOSE 1540 1541 1560-1591

VOLUME [ "c:/serverdata", "C:/serverlogs", "C:/storagedata" ]

ENTRYPOINT [ "ragent.exe" ]
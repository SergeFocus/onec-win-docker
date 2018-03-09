# escape=`
# FROM microsoft/nanoserver
FROM microsoft/windowsservercore

# VOLUME C:\\logs

COPY distr c:/distr

WORKDIR c:\distr\8.3.10.2650\windows64full\

# RUN dir

# RUN powershell -Command $ErrorActionPreference = 'Stop';  `
#     Start-Process msiexec.exe -Wait `
#     -ArgumentList '/i node.msi /qn /l* `
#     C:\\Windows\\Temp\\install.log'

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
    WEBSERVEREXT=0 `
    CONFREPOSSERVER=0 `
    SERVERCLIENT=1 `
    LANGUAGES=RU'


# SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# RUN Start-Process c:\windows\system32\msiexec.exe -Wait -ArgumentList '/i C:\\distr\\node.msi /qn /l* C:\\Windows\\Temp\\install.log'

# RUN Start-Process c:\windows\system32\msiexec.exe -Wait -ArgumentList '/i "C:/distr/8.3.10.2650/windows64full/1CEnterprise\ 8\ (x86-64).msi" /qn /l* C:/Windows/Temp/install.log'

# RUN ["c:\\windows\\system32\\msiexec.exe", "/i", "C:\\distr\\node.msi", "/qn", "/l* C:\\Windows\\Temp\\install.log" ]

# RUN node --version

# RUN Install-WindowsFeature -name Telnet-Client

# RUN powershell -Command $ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue' ; `
    # Invoke-WebRequest $('https://releases.hashicorp.com/consul/{0}/consul_{0}_windows_amd64.zip' -f $env:CONSUL_VERSION) -OutFile 'consul.zip' -UseBasicParsing ; `
#     Expand-Archive -Path consul.zip -DestinationPath C:\download -Force ; `
#     rm consul.zip ; `
#     mkdir C:\download\consul\data ; `
#     mkdir C:\download\consul\config



# RUN ["c:\\windows\\system32\\msiexec.exe", "/i", "C:\\distr\\8.3.10.2650\\windows64full\\1CEnterprise 8 (x86-64).msi", "/qn", "TRANSFORMS=1049.mst", "/l*v C:\\Windows\\Temp\\install.log" ]
#     INSTALLSRVRASSRVC=0 \
#     DESIGNERALLCLIENTS=1 \
#     THICKCLIENT=1 \
#     THINCLIENTFILE=1 \
#     THINCLIENT=1 \
#     WEBSERVEREXT=1 \
#     SERVER=1 \
#     CONFREPOSSERVER=1 \
#     SERVERCLIENT=1 \
#     LANGUAGES=RU

WORKDIR C:\Program Files\1cv8\8.3.10.2650\bin\

EXPOSE 1540 1541 1560-1591

ENTRYPOINT [ "ragent.exe" ]

# CMD ["agent", "-ui", "-dev", "-client", "0.0.0.0"]
# CMD ["cmd", "/C", "dir c:\\distr"]
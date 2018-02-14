# FROM microsoft/nanoserver
FROM microsoft/windowsservercore

# VOLUME C:\\logs

# COPY ./distr/ c:\\distr
# ADD ./distr /distr

# RUN ["msiexec.exe", "/i", "C:\\distr\\8.3.10.2650\\windows64full\\1CEnterprise 8 (x86-64).msi", "/quiet", "/qn", "TRANSFORMS=1049.mst"]
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

RUN dir c:

EXPOSE 1540
#  1541 1560:1591

# ENTRYPOINT [ "C:\\consul.exe" ]

# CMD ["agent", "-ui", "-dev", "-client", "0.0.0.0"]
CMD ["cmd", "/C", "dir c:\\distr"]
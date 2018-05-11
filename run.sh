winpty docker run -d \
    --name onec-srv \
    -p 1540:1540 \
    -p 1541:1541 \
    -p 1560-1591:1560-1591 \
    onec-srv
    #  \
    # powershell
    # -v C:\\Users\\ebessonov\\Documents\\repo\\gitlab\\onecdocker\\onec-win-docker\\distr:c:\\distr \
    # onec-srv 
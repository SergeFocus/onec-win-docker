winpty docker run -it --rm \
    --entrypoint powershell \
    -p 1540:1540 \
    -p 1541:1541 \
    -p 1560-1591:1560-1591 \
    onec-srv
    # -v C:\\Users\\ebessonov\\Documents\\repo\\gitlab\\onecdocker\\onec-win-docker\\distr:c:\\distr \
    # onec-srv 
winpty docker run -it --rm \
    --entrypoint powershell \
    --name onec-srv \
    -p 1540:1540 \
    -p 1541:1541 \
    -p 1560-1591:1560-1591 \
    onec-srv
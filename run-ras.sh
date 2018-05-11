winpty docker run -it --rm \
    --entrypoint ras.exe \
    --name onec-srv-ras \
    --link onec-srv:onec-srv \
    -p 1545:1545 \
    onec-srv \
    cluster onec-srv
sc create onec-srv-2580 ^
binPath= "\"C:\Program Files (x86)\1cv8\8.3.10.2650\bin\ragent.exe\" -srvc -agent -regport 21541 -port 21540 -range 21560:21591 -d \"C:\onec-srv-data\8.3.10.2650\1cv8\"" ^
start= auto ^
obj= .\Administrator ^
password= Q1w2e3r4 ^
displayname= onec-srv-2580 ^
depend= Tcpip/Dnscache/lanmanworkstation/lanmanserver/
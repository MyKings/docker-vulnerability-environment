#!/bin/bash
# author: MyKings

# Start apache2
while true
do
    apache2_service=`netstat -antlp|grep 80`
    if [ "$apache2_service" = "" ]; then
        echo "restart apache2 ..."
        service apache2 restart
        break
    else
        echo "[+] The Apache2 service is already running."
        break
    fi
    sleep 1
done

exit 0

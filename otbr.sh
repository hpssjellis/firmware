#!/bin/bash

ls /dev/ttyA*
##read


## /dev/ttyACM0



docker run --sysctl "net.ipv6.conf.all.disable_ipv6=0 \
        net.ipv4.conf.all.forwarding=1 net.ipv6.conf.all.forwarding=1" \
        -p 8080:80 --dns=127.0.0.1 -it --volume \
        /dev/ttyACM0:/dev/ttyACM0 --privileged openthread/otbr \
        --ncp-path /dev/ttyACM0

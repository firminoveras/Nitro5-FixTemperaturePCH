#!/bin/bash
/usr/bin/modprobe ec_sys write_support=1

while true; do
    /usr/bin/ec_probe write 34 12 > /dev/null 2>&1
    /usr/bin/ec_probe write 33 48 > /dev/null 2>&1
    /usr/bin/ec_probe write 16 0 > /dev/null 2>&1
    /usr/bin/ec_probe write 179 10 > /dev/null 2>&1
    sleep 0.2
done

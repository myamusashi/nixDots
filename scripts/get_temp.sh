#!/usr/bin/env bash

for i in /sys/class/hwmon/hwmon*/temp*_input; do echo "$(<$(dirname $i)/name): $(cat ${i%_*}_label 2>/dev/null || echo $(basename ${i%_*})) $(readlink -f $i)"; done | grep coretemp: | head -1 | awk {'print $5'} >/tmp/temp.txt

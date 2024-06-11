#!/bin/sh

nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits | awk '{ print ""$1"","%"}'

#nvidia-smi --query-gpu=utilization.gpu,temperature.gpu --format=csv,noheader,nounits | awk '{ print ""$1"","%"," ",""$2"","°C"}'

#nvidia-smi --query-gpu=utilization.gpu,temperature.gpu --format=csv,noheader,nounits | awk '{ print ""$1"%",""$2"C"}'

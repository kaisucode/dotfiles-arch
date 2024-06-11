
gpu_info=$(nvidia-smi --query-gpu=gpu_name,temperature.gpu,power.draw,memory.used,memory.total --format=csv,noheader,nounits)


gpu_temp=$(echo "${gpu_info}" | cut -d',' -f 2 | xargs)°C
gpu_power="$(echo "${gpu_info}" | cut -d',' -f 3 | xargs) W"
gpu_mem_used=$(echo "${gpu_info}" | cut -d',' -f 4 | xargs)
gpu_mem_total=$(echo "${gpu_info}" | cut -d',' -f 5 | xargs)

mem_stats="$gpu_mem_used/$gpu_mem_total MiB used"


message=""
message+="$mem_stats $gpu_temp $gpu_power"
echo $message

#echo $gpu_temp
#echo $gpu_info
#echo $mem_stats
#echo $gpu_mem_used
#echo $gpu_mem_total


#while read line; do echo "$line°C"; done


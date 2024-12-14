SCRIPT_PATH=$(realpath "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")
ssd_count=2
ssd_index=0
start_cpu=6
memmap_start_GB=16
cd "$SCRIPT_DIR"
for i in $(seq 0 $((ssd_count-1)))
do
    #cp ../nvmev.ko nvmev$i.ko
    sudo insmod ../nvmev$i.ko  memmap_start=$((memmap_start_GB+$i))G  memmap_size=1G cpus=$start_cpu,$(($start_cpu+1))
    start_cpu=$(($start_cpu+2))
done

#cd ../spdk
#sudo ./setup_spdk.sh
#cd -

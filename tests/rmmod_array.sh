SCRIPT_PATH=$(realpath "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")
ssd_count=4
ssd_index=0
start_cpu=7
cd "$SCRIPT_DIR"
for i in $(seq 0 $((ssd_count-1)))
do
    sudo rmmod nvmev$i
done

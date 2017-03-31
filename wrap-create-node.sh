TOP_DIR=$(cd $(dirname "$0") && pwd)

vm_name=$1
vswitch_name=$2
tapif=tap-$vm_name  

sudo ip tuntap add dev $tapif mode tap
sudo ip link set $tapif mtu $mtu
sudo ip link set $tapif up
sudo ovs-vsctl add-port $vswitch_name $tapif 

vbmc_port=$((30000 + RANDOM % 1000))

sudo $TOP_DIR/create-node.sh -n $vm_name -c 2 -m 8192 -d 10 -a x86_64 -t $tapif -E kvm -p $vbmc_port -f qcow2

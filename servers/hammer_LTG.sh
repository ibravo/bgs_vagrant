## To deploy LTG configurations ##

echo "1. Create LTG CentOS"
hammer -u admin -p octopus medium create --name "CentOS LTG" --os-family Redhat --path http://katello.hq.ltg/pulp/repos/LTG_Federal/Library/custom/CentOS7/Centos_7_x86_64

echo "2. Create Partition Table"
hammer -u admin -p octopus --help


echo "3. Modify EPEL repo on Provisioning template"
echo "4. Modify PXE Provisioning to allow for cciss drivers"

echo "5. Associate Servers with new medium and partition table"
# hammer -u admin -p octopus host create --name oscontroller3.opnfv.com --hostgroup Controller_Network --root-password Op3nStack --managed true --mac 00:22:64:03:DF:E4 --interface type=Nic::BMC,ip=192.168.3.206,mac=00:22:64:03:B7:28,username=Administrator,password=L3gfederal,provider=IPMI --architecture x86_64 --medium "CentOS LTG" --ptable "RAID 0 Autopart"



cat << EOF >> /etc/hosts
192.168.6.150  foreman.hq.ltg foreman
192.168.6.155  katello.hq.ltg katello
EOF



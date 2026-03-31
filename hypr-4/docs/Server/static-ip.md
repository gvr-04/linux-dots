Edit the netplan file 
`sudo cat /etc/netplan/50-cloud-init.yaml`

```
network:
  version: 2
  ethernets:
    enp3s0:
      dhcp4: false
      addresses: 
       - 111.111.111.111/11 
      gateway4: 111.111.111.111
      nameservers:
        addresses:
          - 8.8.8.8
          - 8.8.4.4
```
* 8.8.8.8, 8.8.4.4 are google servers
* To get gateway address 
```
ip route | grep default
```

Install samba
```
sudo apt install samba -y
```
Edit the samba config file
```
sudo vim /etc/samba/smb.conf
```
```
[Storage]
   path = /mnt/storage
   read only = no
   browsable = yes
   guest ok = no
   valid users = sambauser
```
Create a Samba User
```
sudo adduser sambauser
sudo smbpasswd -a sambauser
```
Set Permissions
```
sudo chown -R sambauser:sambauser /mnt/storage
sudo chmod -R 770 /mnt/storage
```
Restart Samba Service
```
sudo systemctl restart smbd
sudo systemctl enable smbd
```
Add group to allow multiple users [main user and samba user] to access the storage
```
sudo groupadd sharedgroup
sudo usermod -aG sharedgroup vamsi-kun
sudo usermod -aG sharedgroup sambaserver
sudo chown -R root:sharedgroup /mnt/storage
sudo chmod 775 /mnt/storage/
```

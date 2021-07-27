#!/data/data/com.termux/files/usr/bin
#####################################
# HI IAM NAVANEETHPL 
# This is a short help of openssh
#####################################

cd $HOME/ssh/

if [ -f "README.md" ]
then 
rm README.md
fi

read -p $' Do you want to continue? [y/n] $' answer
if [ "$answer" != "${answer#[Yy]}" ] ;
then

# Installing 
echo 
echo "[*]  Installing  "
echo

# storage permission
termux-setup-storage

#apt update && apt upgrade
apt upgrade -y
apt update

# installing openssh
pkg install openssh -y

# installing nmap
pkg install nmap -y


# ipv4 address of user
myip=$(ifconfig wlan0 | grep 'inet' | grep -v '::1' | grep -v '127.0.0.1' | awk NR==1'{print $2}')
# user id
myid=$(sshd | whoami )

echo 
echo "[*]  SET A PASSWORD TO YOUR SSH "

passwd $myid

cd /$HOME/

if [ -f "sshd" ]
then 
rm sshd
touch sshd
else
touch sshd
fi

echo "#!/data/data/com.termux/files/usr/bin
#####################################
# HI IAM NAVANEETHPL 
# This is a short help of openssh
#####################################
sshd
whoami
nmap localhost
echo 
echo
echo "====================================="
echo "     ssh $myid@$myip -p 8022 "
echo "           DONE " 
echo "====================================="  ">> /$HOME/sshd

cd /$HOME
chmod 777 sshd

touch ssh.txt
echo "
USER ID: $myid
USER IP: $myip ">> /$HOME/ssh.txt
mv /$HOME/ssh.txt /$HOME/storage/dcim/

echo 
echo
echo "================================"
echo "             DONE " 
echo "================================"

elif [ "$answer" != "${answer#[Nn]}" ] ;
then
echo 
echo
echo "================================"
echo "             DONE " 
echo "================================"

fi

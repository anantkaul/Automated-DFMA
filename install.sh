#! /bin/bash

echo 
while true; do
    read -p ' >> Which OS you use? [ (D)ebian or (A)rch ] ' da
    echo 
    case $da in
        [Dd]* ) sudo apt-get install yara -y; sudo apt-get install figlet lolcat git -y;break;;	# For Debian based Linux OS
        [Aa]* ) sudo pacman -S yara figlet lolcat git; break;;	# For Arch based Linux OS
        * )  echo ; echo ' >> Please answer (D)ebian or (A)rch ...';;
    esac
done

hashes="echo '###############################################################################' | lolcat"
py2=$(which python)
py3=$(which python3)
echo 

eval $hashes
echo 
echo " >> Installing Volatility 2 with its dependencies ..."
echo 
git clone https://github.com/volatilityfoundation/volatility.git
cd volatility
git clone https://github.com/gdabah/distorm.git
cd distorm
$py2 setup.py build
sudo $py2 setup.py build install
cd ..
wget https://ftp.dlitz.net/pub/dlitz/crypto/pycrypto/pycrypto-2.6.1.tar.gz
tar -xvzf pycrypto-2.6.1.tar.gz
rm pycrypto-2.6.1.tar.gz
cd pycrypto-2.6.1
python setup.py build
sudo python setup.py build install
cd ..
echo 

eval $hashes
echo 
echo " >> Installing Volatility3 with its requirements ..."
echo 
git clone https://github.com/volatilityfoundation/volatility3.git
cd volatility3
$py3 -m pip install -r requirements.txt

# Assigning execute permissions to 'auto-vol3' script
chmod +x auto-vol3.sh

echo 
eval $hashes
echo 
figlet -f Digital '        SPECIAL THANKS TO THE CREATORS' | lolcat
echo
figlet -f Kban 'Anant Kaul' | lolcat
figlet -f Kban '        AND' | lolcat
figlet -f Kban '  Volatility' | lolcat
echo
eval $hashes 
echo 
echo " >> Now you're finished with the Installation !!"
echo ' >> Please move on with your Memory Forensics Investigations ...'
echo 
echo " >> Help/Error with './auto-vol3.sh' ..."
echo " >> Start Investigating with './auto-vol3.sh /path/to/file.mem' !!"
echo

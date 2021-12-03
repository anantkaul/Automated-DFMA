#! /bin/bash

echo 
while true; do
    read -p ' >> Which OS you use? [ (D)ebian or (A)rch ] ' da
    echo 
    case $da in
        [Dd]* ) sudo apt install yara -y; sudo apt install figlet lolcat git python2 python3 libpython2.7 -y; break;;	# For Debian based Linux OS
        [Aa]* ) sudo pacman -S yara figlet lolcat git python2 python; break;;	# For Arch based Linux OS
        * )  echo ; echo ' >> Please answer (D)ebian or (A)rch ...';;
    esac
done

hashes="echo '##############################################################################' | lolcat"

py2=$(which python2)
py3=$(which python3)

wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
$py2 get-pip.py
rm get-pip.py
wget https://bootstrap.pypa.io/get-pip.py
$py3 get-pip.py
rm get-pip.py

$py2 -m pip install cefpython3

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

# Assigning execute permissions to 'auto-DFMA' script
chmod +x auto-DFMA.sh

echo 
eval $hashes
echo 
figlet -f Digital '    SPECIAL THANKS TO THE CONTRIBUTORS' | lolcat
echo
figlet -f miniwi '  Digital Forensics | Malware Analysis' | lolcat
echo
eval $hashes
echo
figlet -f Merlin1 'DFMA' | lolcat
figlet -f Mirror '  Framework' | lolcat
eval $hashes 
echo 
echo " >> Now you're finished with the Installation !!"
echo ' >> Please move on with your Digital Forensics & Malware Analysis Investigations ...'
echo 
echo " >> Help/Error with './auto-DFMA.sh' ..."
echo " >> Start Investigating with './auto-DFMA.sh /path/to/file.mem' !!"
echo


# figlet -f Merlin1 'DFMA' | lolcat
# figlet -f Mirror 'Framework' | lolcat
# figlet -f Madrid 'Framework' | lolcat
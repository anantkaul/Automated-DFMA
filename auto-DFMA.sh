#! /bin/bash

clear
echo 
echo '     ################################################################### ' | lolcat
figlet -f miniwi '           Welcome to DFMA ' | lolcat
echo '     ################################################################### ' | lolcat
echo
figlet -f miniwi '  Digital Forensics | Malware Analysis' | lolcat
figlet -f miniwi '        Automated by Anant Kaul' | lolcat
echo 

hashes="echo '##############################################################################' | lolcat"

good_bye() {

    echo
    eval $hashes 
    echo 
    echo " >> Now you're finished with your Memory Forensics Investigation !!"
    echo ' >> Please move on with other needed Investigations ...'
    echo ' >> Suggestions Already Given by "The Volatility Framework" !!'
    echo " >> Do check '$DIR' for Further Investigations ..."
    # echo " >> Outputs will be overwritten next time if not copied !!"
    echo
    figlet -f Digital '    SPECIAL THANKS TO THE CONTRIBUTORS' | lolcat
    echo
    figlet -f miniwi '  Digital Forensics | Malware Analysis' | lolcat
    echo
    eval $hashes
    echo
    figlet -f Merlin1 'DFMA' | lolcat
    figlet -f Mirror '  Framework' | lolcat
    # figlet -f Digital 'SPECIAL THANKS TO THE CREATORS -- ©'
    exit
}

# echo
# read -p " >> Enter Full Path of Memory File: " path_to_file

# if [ -z "$path_to_file" ]; then
#     echo
#     eval $hashes
#     echo 
#     echo " >> ERROR: Please Enter Full Path of Memory File as argument."
#     exit
# fi

py2=$(which python2)
py3=$(which python3)

volatility2="$py2 volatility/vol.py -f $path_to_file"
volatility="$py3 volatility3/vol.py -f $path_to_file"
render_pretty='-r pretty'
render_csv='-r csv'

location=$PWD
DIR=$location/Investigations
created=false

## Sample Loop
# while true; do
#     read -p ' >> Do you wish to continue? ( Y/n ) ' yn
#     case $yn in
#         [Yy]* ) break;;
#         [Nn]* ) good_bye;;
#         * )  echo ; echo ' >> Please answer yes or no ...';;
#     esac
# done

create_dir() {

    if [ ! -d "$DIR" ]; then
        mkdir $DIR
    fi    

    counter=1
    while true; do
        if [ ! -d "$DIR/$counter" ]; then
            DIR=$DIR/$counter 
            mkdir $DIR
            # cd $DIR
            break  
        fi        
        (( counter++ ))
    done
    created=true
}

check_dir() {
     if [[ "$created" == false ]]; then 
        create_dir
    fi
    cd $DIR
}

ImageInfo_vol2() {

    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with ImageInfo (Using Volatility 2) ...'; echo ; $volatility2 imageinfo > Vol2_ImageInfo.txt; echo ; echo " >> Output saved in '$PWD/Vol2_ImageInfo.txt' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with ImageInfo (Using Volatility 2) ...'; echo ; $volatility2 imageinfo; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

ImageInfo_vol3() {

    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with ImageInfo (Using Volatility 3) ...'; echo ; $volatility windows.info > Vol3_ImageInfo.txt; echo ; echo " >> Output saved in '$PWD/Vol3_ImageInfo.txt' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with ImageInfo (Using Volatility 3) ...'; echo ; $volatility windows.info; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

ImageInfo() {

    eval $hashes
    echo 
    while true; do
        read -p ' >> Proceed with Volatility 2 (slow) or Volatility 3 (fast) ? [ 2/3 ] ' v
        case $v in
            2)  ImageInfo_vol2 ; break;;
            3)  ImageInfo_vol3 ; break;;
            * )  echo ; echo ' >> Please answer Volatility (2) or (3) ...';;
        esac
    done
}

PsList() {

    eval $hashes
    echo 
    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with PsList ...'; echo ; $volatility $render_csv windows.pslist > PsList.csv; echo ; echo " >> Output saved in '$PWD/PsList.csv' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with PsList ...'; echo ; $volatility $render_pretty windows.pslist; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

PsTree() {

    eval $hashes
    echo 
    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with PsTree ...'; echo ; $volatility $render_csv windows.pstree > PsTree.csv; echo ; echo " >> Output saved in '$PWD/PsTree.csv' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with PsTree ...'; echo ; $volatility $render_pretty windows.pstree; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

PsScan() {

    eval $hashes
    echo 
    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with PsScan ...'; echo ; $volatility $render_csv windows.psscan > PsScan.csv; echo ; echo " >> Output saved in '$PWD/PsScan.csv' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with PsScan ...'; echo ; $volatility $render_pretty windows.psscan; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

NetScan() {

    eval $hashes
    echo 
    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with NetScan ...'; echo ; $volatility $render_csv windows.netscan > NetScan.csv; echo ; echo " >> Output saved in '$PWD/NetScan.csv' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with NetScan ...'; echo ; $volatility $render_pretty windows.netscan; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

DllList() {

    eval $hashes
    echo 
    read -p 'Which PID you want? : ' read_dll
    echo 
    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with DllList ...'; echo ; $volatility $render_csv windows.dlllist --pid $read_dll > DllList.csv; echo ; echo " >> Output saved in '$PWD/DllList.csv' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with DllList ...'; echo ; $volatility $render_pretty windows.dlllist --pid $read_dll; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

Handles() {

    eval $hashes
    echo 
    read -p 'Which PID you want? : ' read_handles
    echo 
    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with Handles ...'; echo ; $volatility $render_csv windows.handles --pid $read_handles > Handles.csv; echo ; echo " >> Output saved in '$PWD/Handles.csv' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with Handles ...'; echo ; $volatility $render_pretty windows.handles --pid $read_handles; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

GetSIDs() {

    eval $hashes
    echo 
    read -p 'Which PID you want? : ' read_sids
    echo 
    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with GetSIDs ...'; echo ; $volatility $render_csv windows.getsids --pid $read_sids > GetSIDs.csv; echo ; echo " >> Output saved in '$PWD/GetSIDs.csv' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with GetSIDs ...'; echo ; $volatility $render_pretty windows.getsids --pid $read_sids; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

RegistryHiveList() {

    eval $hashes
    echo 
    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with Registry HiveList (For Virtual Memory) ...'; echo ; $volatility $render_csv windows.registry.hivelist > RegistryHiveList.csv; echo ; echo " >> Output saved in '$PWD/RegistryHiveList.csv' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with Registry HiveList (For Virtual Memory) ...'; echo ; $volatility $render_pretty windows.registry.hivelist; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

RegistryHiveScan() {

    eval $hashes
    echo 
    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with Registry HiveScan (For Physical Memory) ...'; echo ; $volatility $render_csv windows.registry.hivescan > RegistryHiveScan.csv; echo ; echo " >> Output saved in '$PWD/RegistryHiveScan.csv' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with Registry HiveScan (For Physical Memory) ...'; echo ; $volatility $render_pretty windows.registry.hivescan; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

RegistryUserAssist() {

    eval $hashes
    echo 
    read -p " >> Which Service/File you want? (Preferably Don't use Extention) : " read_userassist
    echo 
    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with Registry UserAssist ...'; echo ; $volatility windows.registry.userassist | egrep "$read_userassist" > RegistryUserAssist.txt; echo ; echo " >> Output saved in '$PWD/RegistryUserAssist.txt' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with Registry UserAssist ...'; echo ; $volatility windows.registry.userassist | egrep "$read_userassist" ; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

TimeLiner() {

    eval $hashes
    echo 
    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with TimeLiner ...'; echo ; $volatility $render_csv timeliner > TimeLiner.csv; echo ; echo " >> Output saved in '$PWD/TimeLiner.csv' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with TimeLiner ...'; echo ; $volatility $render_pretty timeliner; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

HashDump() {

    eval $hashes
    echo 
    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with HashDump ...'; echo ; $volatility $render_csv windows.hashdump > HashDump.csv; echo ; echo " >> Output saved in '$PWD/HashDump.csv' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with HashDump ...'; echo ; $volatility $render_pretty windows.hashdump; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

ModScan() {

    eval $hashes
    echo 
    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with ModScan ...'; echo ; $volatility $render_csv windows.modscan > ModScan.csv; echo ; echo " >> Output saved in '$PWD/ModScan.csv' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with ModScan ...'; echo ; $volatility $render_pretty windows.modscan; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

LsaDump() {

    eval $hashes
    echo 
    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with LsaDump ...'; echo ; $volatility windows.lsadump > LsaDump.txt; echo ; echo " >> Output saved in '$PWD/LsaDump.txt' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with LsaDump ...'; echo ; $volatility windows.lsadump; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

FileScan() {

    eval $hashes
    echo 
    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with FileScan ...'; echo ; $volatility $render_csv windows.filescan > FileScan.csv; echo ; echo " >> Output saved in '$PWD/FileScan.csv' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with FileScan ...'; echo ; $volatility $render_pretty windows.filescan; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

SvcScan() {

    eval $hashes
    echo 
    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with SvcScan ...'; echo ; $volatility $render_csv windows.svcscan > SvcScan.csv; echo ; echo " >> Output saved in '$PWD/SvcScan.csv' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with SvcScan ...'; echo ; $volatility $render_pretty windows.svcscan; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

CmdLine() {

    eval $hashes
    echo 
    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with CmdLine ...'; echo ; $volatility $render_csv windows.cmdline > CmdLine.csv; echo ; echo " >> Output saved in '$PWD/CmdLine.csv' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with CmdLine ...'; echo ; $volatility $render_pretty windows.cmdline; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

MalFind() {

    eval $hashes
    echo 
    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with MalFind ...'; echo ' >> These can be Malicious (As suggested by Volatility Framework)' ; echo ' >> Looks Suspicious ...'; echo ; $volatility windows.malfind > MalFind.txt; echo ; echo " >> Output saved in '$PWD/MalFind.txt' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with MalFind ...'; echo ' >> These can be Malicious (As suggested by Volatility Framework)' ; echo ' >> Looks Suspicious ...'; echo ; $volatility windows.malfind; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

MemDump() {

    eval $hashes
    echo 
    read -p ' >> Which PID you want to dump out? : ' read_dump 
    echo 
    echo ' >> Dumping out the Required Process (dmp) ...'
    echo 
    check_dir
    $volatility $render_pretty windows.pslist --pid $read_dump --dump
    echo 
    echo " >> Output saved in '$PWD/pid.*.dmp' "
    cd $location
    echo 
}

ProcDump() {

    eval $hashes
    echo 
    read -p ' >> Which PID you want to dump out? : ' read_procdump 
    read -p ' >> Which ImageProfile you want to use? : ' image_profile 
    echo 
    echo ' >> Dumping out the Required Executable (exe) ...'
    echo 
    check_dir
    $volatility2 --profile $image_profile procdump -p $read_procdump -D .
    echo 
    echo " >> Output saved in '$PWD/executable.*.exe' "
    cd $location
    echo 
}

cuckoo() {

    $py2 $PWD/cuckoo.py 
    rm -rf $PWD/webrtc_event_logs
    rm -rf $PWD/blob_storage
    clear
    echo
}

volatility_menu() {

    echo '     #################################################################### ' | lolcat
    figlet -f miniwi '     Welcome to Memory Forensics' | lolcat
    echo '     #################################################################### ' | lolcat
    figlet -f miniwi '         Volatility Framework' | lolcat
    figlet -f miniwi '  Exclusively Automated by Anant Kaul' | lolcat
    echo
    eval $hashes
    
    while true; do

        echo
        read -p " >> Enter Full Path of Memory File: " path_to_file
        echo 

        if [ -z "$path_to_file" ]; then
            echo " >> ERROR: Please Enter Full Path of Memory File as argument ..."
            echo 
            eval $hashes
        else
            break
        fi
    done
    while true; do

        echo '##############################################################################' | lolcat
        echo 
        echo "        1   ->  ImageInfo                         12  ->  Timeliner"
        echo "        2   ->  PsList                            13  ->  HashDump"
        echo "        3   ->  PsScan                            14  ->  LsaDump"
        echo "        4   ->  PsTree                            15  ->  ModScan"
        echo "        5   ->  NetScan                           16  ->  FileScan"
        echo "        6   ->  DllList                           17  ->  SvcScan"       
        echo "        7   ->  Handles                           18  ->  CmdLine"
        echo "        8   ->  GetSIDs                           19  ->  MalFind"
        echo "        9   ->  Registry HiveList                 20  ->  MemDump (.dmp)"
        echo "        10  ->  Registry HiveScan                 21  ->  ProcDump (.exe)"
        echo "        11  ->  Registry UserAssist               22  ->  VirusTotal Analysis"
        echo 
        echo "        B   ->  Back                              Q   ->  Quit"
        echo
        read -p ' >> Which Volatile Memory Operation you wish to perform? ' op
        case $op in
            1) clear ; echo ; ImageInfo;;
            2) clear ; echo ; PsList;;
            3) clear ; echo ; PsScan;;
            4) clear ; echo ; PsTree;;
            5) clear ; echo ; NetScan;;
            6) clear ; echo ; DllList;;
            7) clear ; echo ; Handles;;
            8) clear ; echo ; GetSIDs;;
            9) clear ; echo ; RegistryHiveList;;
            10) clear ; echo ; RegistryHiveScan;;
            11) clear ; echo ; RegistryUserAssist;;
            12) clear ; echo ; TimeLiner;;
            13) clear ; echo ; HashDump;;
            14) clear ; echo ; LsaDump;;
            15) clear ; echo ; ModScan;;
            16) clear ; echo ; FileScan;;
            17) clear ; echo ; SvcScan;;
            18) clear ; echo ; CmdLine;;
            19) clear ; echo ; MalFind;;
            20) clear ; echo ; MemDump;;
            21) clear ; echo ; ProcDump;;
            22) clear ; echo ; Virustotal;;
            [Bb]* ) clear ; echo ; break;;
            [Qq]* ) clear ; good_bye;;
            * )  echo ; eval $hashes ; echo ; echo ' >> Please answer in range (1-22) or Go a step (B)ack or (q)uit ...'; echo ;;
        esac
    done
}

Virustotal() {
    while true; do
        echo '##############################################################################' | lolcat
        echo 
        echo "        1   ->  File"
        echo "        2   ->  URL"
        echo "        3   ->  Hash"
        echo
        echo "        B   ->  Back"
        echo
        read -p ' >> Which Framework you wish to perform analysis with? ' option
        case $option in
            1) clear ; echo ; volatility_menu;;
            2) clear ; echo ; Virustotal;;
            3) clear ; cuckoo;;
            [Bb]* ) clear ; echo ; break;;
            *) clear ; echo ; eval $hashes ; echo ; echo ' >> Please answer in range (1-3) or Go a step (B)ack or (q)uit ...'; echo ;;
        esac
    done
}

while true; do
    echo '##############################################################################' | lolcat
    echo 
    echo "        1   ->  Volatility"
    echo "        2   ->  VirusTotal"
    echo "        3   ->  Cuckoo Sandbox"
    echo
    echo "        Q   ->  Quit"
    echo
    read -p ' >> Which Framework you wish to perform analysis with? ' option
    case $option in
        1) clear ; echo ; volatility_menu;;
        2) clear ; echo ; Virustotal;;
        3) clear ; cuckoo;;
        [Qq]* ) clear ; good_bye;;
        *) clear ; echo ; eval $hashes ; echo ; echo ' >> Please answer in range (1-3) or (q)uit ...'; echo ;;
    esac
done
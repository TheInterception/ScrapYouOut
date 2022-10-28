clear
bold=$(tput bold)
endbold=$(tput sgr0)
toilet -f slant --filter border:gay ScrapYouOut///

echo ""
echo "${bold}THE NO-NONSENSE FINGERPRINTING AND INFORMATION GATHERING TOOL${endbold}"
echo "Current Date: " && date
echo "================================================================================================="
echo "================================================================================================="

echo "[*] Enter the URL or IP address: "
read addr
echo ""
echo "[!] Based on your input, We have Recieved the Following IP Address(s)"
dig +short $addr

echo "${bold}=== Main Menu (Use Numericals for Option Selection)${endbold}"
echo "1 >> DNS Lookup"
echo "2 >> Reverse DNS Lookup"
echo "3 >> IP Geolocation Lookup"
echo "4 >> Reverse IP Lookup"
echo "5 >> Fetch HTTP Headers"
echo "6 >> Site Banner Grabbing"
echo "7 >> Pull robots.txt"
echo "8 >> Check IP Origin"
echo "9 >> Whois Lookup"
echo ""

echo "Choose your option:"
read options

case $options in
1) echo "=== DNS Lookup Information ==="
   echo ""
   curl https://api.hackertarget.com/dnslookup/?q=$addr
   echo ""
   echo ""
   echo "${bold}[ALERT] Do you want to run the script again? (y/n)${endbold}"
   read exopt
   case $exopt in
   y) bash syo.sh
   ;;
   n) echo "[!] Exiting Script!"
   ;;
   esac
;;
2) echo "=== Reverse DNS Lookup Information ==="
   echo ""
   curl https://api.hackertarget.com/reversedns/?q=$addr
   echo ""
   echo ""
   echo "${bold}[ALERT] Do you want to run the script again? (y/n)${endbold}"
   read exopt
   case $exopt in
   y) bash syo.sh
   ;;
   n) echo "[!] Exiting Script!"
   ;;
   esac
;;
3) echo "=== IP Geolocation Lookup Information ==="
   echo ""
   curl https://api.hackertarget.com/ipgeo/?q=$addr
   echo ""
   echo ""
   echo "${bold}[ALERT] Do you want to run the script again? (y/n)${endbold}"
   read exopt
   case $exopt in
   y) bash syo.sh
   ;;
   n) echo "[!] Exiting Script!"
   ;;
   esac
;;
4) echo "=== Reverse IP Lookup Information ==="
   echo ""
   curl https://api.hackertarget.com/reverseiplookup/?q=$addr
   echo ""
   echo ""
   echo "${bold}[ALERT] Do you want to run the script again? (y/n)${endbold}"
   read exopt
   case $exopt in
   y) bash syo.sh
   ;;
   n) echo "[!] Exiting Script!"
   ;;
   esac
;;
5) echo "=== HTTP Response Headers ==="
   echo ""
   curl -i $addr
   echo ""
   echo ""
   echo "${bold}[ALERT] Do you want to run the script again? (y/n)${endbold}"
   read exopt
   case $exopt in
   y) bash syo.sh
   ;;
   n) echo "[!] Exiting Script!"
   ;;
   esac
;;
6) convaddr=$(echo -e "$(dig +short $addr)" | awk '{print ; exit}')
   curl https://api.hackertarget.com/bannerlookup/?q=$convaddr/24 
   echo ""
   echo "${bold}[ALERT] Do you want to run the script again? (y/n)${endbold}"
   read exopt
   case $exopt in
   y) bash syo.sh
   ;;
   n) echo "[!] Exiting Script!"
   ;;
   esac
;; 
7) echo "=== Robots.txt ==="
   echo ""
   curl https://$addr/robots.txt
   echo ""
   echo "${bold}[ALERT] Do you want to run the script again? (y/n)${endbold}"
   read exopt
   case $exopt in
   y) bash syo.sh
   ;;
   n) echo "[!] Exiting Script!"
   ;;
   esac
;;
8)echo "=== IP Origin Identifier ==="
  convaddr=$(echo -e "$(dig +short $addr)" | awk '{print ; exit}') 
  curl https://ipinfo.io/$convaddr/json
  echo ""
  echo "${bold}[ALERT] Do you want to run the script again? (y/n)${endbold}"
   read exopt
   case $exopt in
   y) bash syo.sh
   ;;
   n) echo "[!] Exiting Script!"
   ;;
   esac
;;
9) echo "=== WHOIS Lookup ==="
   whois $addr
   echo ""
   echo "${bold}[ALERT] Do you want to run the script again? (y/n)${endbold}"
   read exopt
   case $exopt in
   y) bash syo.sh
   ;;
   n) echo "[!] Exiting Script!"
   ;;
   esac

;;
*) echo "[X] Invalid Input!"
   echo "${bold}[ALERT] Do you want to run the script again? (y/n)${endbold}"
   read exopt
   case $exopt in
   y) bash syo.sh
   ;;
   n) echo "[!] Exiting Script!"
   ;;
   esac
;;
esac

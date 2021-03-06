#!/bin/sh

ip link show enp0s25 2>&1 | grep -q -E 'NO-CARRIER|DOWN' || {
  echo '>>>>>'
  exit 0
}

iw dev wlp3s0 link | grep -q 'Not connected.' && {
  echo '--x--'
  exit 0
}

essid=`iwconfig wlp3s0 | awk -F '"' '/ESSID/ {print $2}'`
stngth=`iwconfig wlp3s0 | awk -F '=' '/Quality/ {print $2}' | cut -d '/' -f 1`
bars=`expr $stngth / 10`

case $bars in
  0)    bar='-----' ;;
  1|2)  bar=')----' ;;
  3|4)  bar='))---' ;;
  5|6)  bar=')))--' ;;
  7|8)  bar='))))-' ;;
  9|10) bar=')))))' ;;
  *)    bar='--!--' ;;
esac

echo $essid $bar

exit 0

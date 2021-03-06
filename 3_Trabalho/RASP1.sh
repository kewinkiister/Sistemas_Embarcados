
while true
do

#!/bin/bash
# $(raspistill -t 1 -o QRCode.png)
QR=$(zbarimg -Sdisable -Sqrcode.enable -q QRCode.png)
TE=$(echo $?)
QR1=$(echo "${QR#QR-Code: }")   #Seleciona somento o horario dentro da variavel
MIN1=$(echo "${QR1:3}")         #Minutos do QRcode
HR1=$(echo "${QR1:0:2}")        #Horas do QRCode
MIN=$(date +%M)                 #Minutos do Relogio
HR=$(date +%H)                  #Horas do Relogio
HORA=$(($HR1-$HR))
if test "$TE" -ne 4
	then
if test "$MIN1" -lt "$MIN" -a "$HORA" -gt 1
	then
		MIN1=$(($MIN1+60))
		HR1=$(($HR1-1))
	fi
MIN1=$(echo "${MIN1#0}")
MINUTO=$(($MIN1-$MIN))
HORA=$(($HR1-$HR))
#MINUTO=$(($MINUTO+100))
#MINUTO=$(echo "${MINUTO#1}")

echo "Seu tempo restante é de $HORA Horas e $MINUTO Minutos"
case $HORA in
 [1-9])
	echo "Aberto"
	$(sudo ./relecomled)
	;;
-[1-9])
	echo "Fechado"
	;;
 0)
	case $MINUTO in
		0)
		echo "Fechado"
		;;
		[0-6][0-9])
		echo "Aberto"
	        $(sudo ./relecomled)
		;;
		*)
		echo "Fechado"
		;;
	esac

esac

fi
done

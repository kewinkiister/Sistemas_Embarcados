QR=$(zbarimg QRCode.png)
QR1=$(echo "${QR#QR-Code: }")   #Seleciona somento o horario dentro da variavel
MIN1=$(echo "${QR1:3}")         #Minutos do QRcode
HR1=$(echo "${QR1:0:2}")        #Horas do QRCode
MIN=$(date +%M)                 #Minutos do Relogio
HR=$(date +%H)                  #Horas do Relogio
HORA=$(($HR1-$HR))
MINUTO=$(($MIN1-$MIN))

case $MINUTO in
-[0-5][0-9])
	HORA=$(($HORA-1))
	MINUTO=$(($MINUTO+60))
esac

echo "Seu tempo restante é de $HORA Horas e $MINUTO Minutos"
 $case $HORA in
 [1-9])
	echo "Open"
	;;
-[1-9])
	echo "Open"
	;;
 0)
	case $MINUTO in
		0)
		echo "Closed"
		;;
		[0-6][0-9])
		echo "Open"
		;;
		*)
		echo "Closed"
		;;
	esac

esac


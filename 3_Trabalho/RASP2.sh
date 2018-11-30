QR=$(zbarimg QRCode.png)
QR1=$(echo "${QR#QR-Code: }")   #Seleciona somento o horario dentro da variavel
MIN1=$(echo "${QR1:3}")         #Minutos do QRcode
HR1=$(echo "${QR1:0:2}")        #Horas do QRCode
MIN=$(date +%M)                 #Minutos do Relogio
HR=$(date +%H)                  #Horas do Relogio
HORA=$(($HR1-$HR))		#Diferenca entre Hora do usuario e horario atual 
MINUTO=$(($MIN1-$MIN))		#Diferenca entre minuto do usuario e o minuto atual

case $MINUTO in			#Caso a diferenca seja negativa 
-[0-5][0-9])
	HORA=$(($HORA-1))	#Diminui uma hora
	MINUTO=$(($MINUTO+60))	#Acrescenta 60 minutos
esac

echo "Seu tempo restante é de $HORA Horas e $MINUTO Minutos"
 $case $HORA in			#Case relacionado a variavel Hora
 [1-9])				#Caso o usuario possua um saldo
	echo "Open"		#possitivo de horas o acesso 'e
	;;			#liberado
-[1-9])				#Caso o saldo seja negativo o acesso
	echo "Closed"		# 'e negado
	;;
 0)
	case $MINUTO in		#Caso o saldo seja nulo 'e feita 
		0)		#a mesma analise para os minutos
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


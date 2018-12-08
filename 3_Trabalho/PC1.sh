

#!/bin/bash

#########################################################################
# Exercício 1 - Criando e Executando Scripts                            #
#                                                                       #
# Nome: SomaValores.sh                                                  #
#                                                                       #
# Autor: Ricardo Prudenciato (ricardo@linuxsemfronteiras.com.br)        #
# Data: DD/MM/AAAA                                                      #
#                                                                       #
# Descrição: O script faz a soma de dois valores inseridos              #
#            pelo usuário                                               #
#                                                                       #
# Uso: ./SomaValores.sh                                                 #
#                                                                       #
#########################################################################
while true
do
read -p "Informe o tempo de acesso do cliente em minutos: " MIN
CAL=$(date +%M)	#Declaracao da variavel minuto do calendario 
MIN=$(($MIN+$CAL))	#Minuto 'e igual ao minuto do calendario + minutos inseriods pelo usuario
HORA=$(date +%H)	#Hora do calendario 
DIA=$(date +%H)		#Dia do calendario


while test "$MIN" -gt 60	#Em quanto min for maior que 60 faca
do				#While transforma o credito inserido pelo 
	if test "$MIN" -gt 60	#usuario em um horario futuro
	then
		HORA=$(($HORA+1))
		MIN=$(($MIN-60))

	fi
done


		MIN=$(($MIN+100))
		MIN=$(echo "${MIN#1}")
		HORA=$(($HORA+100))
		HORA=$(echo "${HORA#1}")
echo "O tempo limite de acesso do cliente é $HORA:$MIN"
$(qrencode " $HORA:$MIN" -o QRCode.png)	#Insere no QR code o horario de
					#se encerra o tempo do usuario

done

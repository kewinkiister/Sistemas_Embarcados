1.Crie um código em C para escrever "Ola mundo!" em um arquivo chamado 'ola_mundo.txt'.
Arquivo ola_mundo.txt:
Ola Mundo!

Arquivo ola_mundo.c:
#include <stdio.h>
#include <stdlib.h>
int main(int argc, const char * argv[]) {
    FILE *fp;
    char c;
    fp = fopen("ola_mundo.txt","r"); /* Arquivo ASCII, para leitura */
    if(!fp)
    {
        printf( "Erro na abertura do arquivo");
exit(-1); }
while((c = getc(fp) ) != EOF) /* Enquanto não chegar ao final do arquivo */ 
printf("%c", c); /* imprime o caracter lido */
printf("\n");
fclose(fp);
return 0;
}

Comando terminal:
$ gcc ola_mundo.c -o ola_mundo
$./ola_mundo
$Ola mundo!

2.Crie um código em C que pergunta ao usuário seu nome e sua idade, e escreve este conteúdo em um arquivo com o seu nome
e extensão '.txt'. Por exemplo, considerando que o código criado recebeu o nome de 'ola_usuario_1':


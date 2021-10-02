#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <windows.h>

using namespace std;

int main()
{

	int NumeroA;
	int NumeroB;
	int Suma;
	int Resta;
	int opcion;

	printf("Introduzca el primer entero   \n"); 
	scanf("%d", &NumeroA);
	printf("Introduzca el segundo entero   \n"); 
	scanf("%d", &NumeroB);

	Suma=NumeroA+NumeroB;
	Resta=NumeroA-NumeroB;
	
	printf("Seleccione una opcion 0 para sumar 1 para restar	\n"); 
	scanf("%d", &opcion);
	switch(opcion){
		case 0:
			printf("El resultado de la suma es:  \n");
			printf( "\n %d", Suma);
			break;
		case 1:
			printf("El resultado de la resta es:   \n");
			printf( "\n %d", Resta);
			break;
		default:
			printf("\n	No es una opcion valida");
	}
	
	system("pause");
	return 0;
}

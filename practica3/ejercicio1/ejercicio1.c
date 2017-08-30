#include <stdio.h>
#define N 5
extern int suma(short *v, short n);

int main() {
    short v[N]; // el tipo de v es un puntero a short
    short i;
    for(i=0;i<N;i++) {
        v[i]=(i+1);
        printf("En V[%d] hay %d\n", i, v[i]);
    }
    int res = suma(v, N);
    printf("La suma de los elementos de v es %d\n", res);

}
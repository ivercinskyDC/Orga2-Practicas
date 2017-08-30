#include <stdio.h>
#define N 10
extern void diagonal(int *matriz, int n, int*diagonal);

int main() {
    int matriz[N][N];
    int diagonal[N];

    int i=0;
    int j=0;
    for(i=0;i<N;i++){
        for(j=0;j<N;j++){
            matriz[i][j] = i*N + (j+1);
            printf("La matriz[%d][%d] = %d\n",i,j,matriz[i][j]);
        }
    }
    diagonal(matriz, N, diagonal)
    return 0;
}
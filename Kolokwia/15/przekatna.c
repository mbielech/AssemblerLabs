#include <stdio.h>
#include <stdlib.h>

long long przekatnaC(long** tab, int bok) {
	long long sum = 0;
	
	for(int i = 0; i < bok; i++) {
		sum += tab[i][i];
	}
	
	return sum;
}

long long przekatnaA(long** tab, int bok);

void main( void ) {
	int bok = 8;
	long** tab = malloc(bok * sizeof(long*));
	for(int i = 0; i < bok; i++) {
		tab[i] = malloc(bok * sizeof(long));
	}
	for(int i = 0; i < bok; i++) {
		for(int j = 0; j < bok; j++) {
			tab[i][j] = i+j-5;
			printf("%3ld ", tab[i][j]);
		}
		printf("\n\n");
	}
	
	printf("%lld\n", przekatnaC(tab, bok));
	printf("%lld\n", przekatnaA(tab, bok));
	
}

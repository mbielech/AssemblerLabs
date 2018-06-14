#include <stdio.h>

long long power(int a, int n) {
	long long sum = 1;
	for(int i = 0; i < n; i++) {
		sum *= a;
	}
	return sum;
}

unsigned int check_tabC( int* tab, int n, int* max ) {
	unsigned int sum = 0;
	for(int i = 0; i < 64; i++) {
		int licznik = 0;
		short bylo = 0;
		for(int j = 0; j < n; j++) {
			if(tab[j] == i) {
				licznik++;
				if(bylo == 0) {
					bylo = 1;
					sum += power(2, i);
				}
			}
		}
		if(licznik > *max)
			*max = licznik;
	}
	return sum;
}

unsigned int check_tabA( int* tab, int n, int* max );

void main( void ) {
	
	int tab[] = {0,0,0,1,1,1,1,2};
	int len;
	int max;
	
	len = 8;
	max = 0;
	
	printf( "CheckTabC = %d\n", check_tabC(tab, len, &max));
	printf("MAX = %d\n", max);
	
	len = 8;
	max = 0;
	
	printf( "CheckTabA = %d\n", check_tabA(tab, len, &max));
	printf("MAX = %d\n", max);
	
}

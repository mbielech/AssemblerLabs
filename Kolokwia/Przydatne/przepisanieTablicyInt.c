#include <stdio.h>
#include <stdlib.h>

unsigned int copyTabC( int* tab, int len, int* copy ) {
	for(int i = 0; i < len; i++) {
		copy[i] = tab[i];
	}
	return 0;
}

unsigned int copyTabA( int* tab, int len, int* copy );

void main( void ) {
	
	int tab[] = {0,0,0,1,1,1,1,2};
	int len = 8;
	int copy[8] = {0};

	
	printf( "CheckTabC = %d\n", copyTabC(tab, len, copy));
	tab[0] = 10;
	for(int i = 0; i < len; i++) {
		printf("COPYC = %d\n", copy[i]);
		copy[i] = -1;
	}
	
	
	printf( "CheckTabA = %d\n", copyTabA(tab, len, copy));
	tab[0] = 5;
	for(int i = 0; i < len; i++) {
		printf("COPYA = %d\n", copy[i]);
	}
	
}

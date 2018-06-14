
#include <stdio.h>

int maxdifc( int a, int b, int c, int d ) {
	int max = a;
	int min = a;
	if(b > max)
		max = b;
	if(c > max)
		max = c;
	if(d > max)
		max = d;
	if(b < min)
		min = b;
	if(c < min)
		min = c;
	if(d < min)
		min = d;
	return max - min;
}

int maxdifa( int a, int b, int c, int d );

void main( void ) {
	int a = 1;
	int b = 2;
	int c = 3;
	int d = 10;
 	
 	printf("Dif: %d\n", maxdifc(a,b,c,d));
 	printf("Dif: %d\n", maxdifa(a,b,c,d));
}

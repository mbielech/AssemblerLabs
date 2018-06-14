
#include <stdio.h>

int max2c( int a, int b ) {
	int x = a + b;
	int y = a * b;
	int z = a - b;
	int max = x;
	if(y > max)
		max = y;
	if(z > max)
		max = z;
		
	return max;
}

int max2a( int a, int b );

void main( void ) {
	int a = 40;
	int b = 0;
 	
 	printf("%d\n", max2c(a,b));
 	printf("%d\n", max2a(a,b));
 	
}

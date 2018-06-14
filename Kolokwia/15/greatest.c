
#include <stdio.h>

long long greatestc( unsigned int a, unsigned int b, unsigned int c ) {
	if( a > b ) {
		if(a > c)
			return a;
	}
	else {
		if( b > c )
			return b;
	}
	return c;
}

long long greatest( unsigned int a, unsigned int b, unsigned int c );

void main( void ) {
int i = 300;
int j = 1001;
int k = 20;
 	printf( "GreatC(%d,%d,%d) = %lld GreatA = %lld\n", 4,5,2, greatestc(i,j,k), greatest(i,j,k) );
}

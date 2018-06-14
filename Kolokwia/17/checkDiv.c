
#include <stdio.h>
long long power(int a, int n) {
	long long sum=1;
	for(int i = 0; i < n; i++){
		sum *= a;
	}
	return sum;
}

long long checkDivC( unsigned int a, unsigned int b, unsigned int c ) {
	if( c == 0 ) {
		if(a % b == 0){
			return 1;
		}
		else {
			return 0;
		}
	}
	else {
		long long sum = 0;
		for(int i = 1; i <= 64; i++) {
			if(a % i == 0){
				sum += power(2,i-1);
			}
		}
		return sum;
	}
}

long long checkDivA( unsigned int a, unsigned int b, unsigned int c );

void main( void ) {
int i = 200;
int j = 128;
int k = 1;

 	printf( "CheckDivC(%d,%d,%d) = %lld CheckDivA = %lld\n", i,j,k, checkDivC(i,j,k), checkDivA(i,j,k) );
}

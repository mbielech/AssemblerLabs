#include <stdio.h>
#include <stdlib.h>
#include <string.h>

long long maxC(long long* tab, long long n, long long* even, long long* neg) {
	*even = 0;
	*neg = 0;
	for(int i = 0; i < n; i++) {
		if(tab[i] % 2 == 0) {
			(*even)++;
		}
		if(tab[i] < 0) {
			(*neg)++;
		}
	}
	return 0;	
}

long long maxA(long long* tab, long long n, long long* even, long long* neg);

int main(void){
	int n = 7;
	long long tab[7] = {2,-3,-1,4,5,-6,-7};
	long long* a = malloc(sizeof(long long));
	long long* b = malloc(sizeof(long long));
	
	long long max = maxC(tab, n, a, b);
	printf("%lld, %lld, %lld\n", *a, *b, max);
	
	*a = -1;
	*b = -1;
	max = 0;
	
	max = maxA(tab, n, a, b);
	printf("%lld, %lld, %lld\n", *a, *b, max);
}

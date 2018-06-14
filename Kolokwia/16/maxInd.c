#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int maxindC(int a, int b, int c, int d) {
	int ind = 1;
	short powt = 0;
	int max = a;
	if(b>=max){
		if(b == max){
			powt = 1;
		}
		max = b;
		ind = 2;
	}
	if(c>=max){
		powt = 0;
		if(c == max){
			powt = 1;
		}
		max = c;
		ind = 3;
	}
	if(d>=max){
		powt = 0;
		if(d == max){
			powt = 1;
		}
		
		max = d;
		ind = 4;
	
	}
	if(powt == 1){
		ind = 0;	
	}
	return ind;
}

int maxindA(int a, int b, int c, int d);

int main(void){
	int a=8;
	int b= 5;
	int c=118;
	int d=1;
	printf("%d\n",maxindC(a,b,c,d));
	printf("%d\n",maxindA(a,b,c,d));
}

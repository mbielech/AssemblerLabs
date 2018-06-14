#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int maxindC(int a, int b, int c, int d) {
	int max = a;
	int returning = 1;
	
	if(b==max){
		returning = 0;
	}
	if (b>max){
		max = b;
		returning = 2;
	}
	if(c==max){
		returning = 0;
	}
	if(c>max){
		max = c;
		returning = 3;
	}
	
	if(d==max){
		returning = 0;
	}
	if(d>max){
		max = d;
		returning = 4;
	}
	return returning;
	
}

int maxindA(int a, int b, int c, int d);

int main(void){
	int a=5767;
	int b= 5767;
	int c=118;
	int d=1;
	printf("%d\n",maxindC(a,b,c,d));
	printf("%d\n",maxindA(a,b,c,d));
}

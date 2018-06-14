#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char* func(char* s, int c, int n, int inc) {
	for(int i = 0; i < n; i++) {
		s[i] = c;
		if(inc){
			c++;
		}
	}
	return s;
}

char* funa(char* s, int c, int n, int inc);

int main(void){

	int c = 'a';
	int n = 7;
	int inc = 0;
	
    char* sC;
    char* sA;
    
    sC = malloc(n);
    printf("c %s\n",func(sC,c,n,inc));
    
    sA = malloc(n);
    printf("a %s\n",funa(sA,c,n,inc));
    
    free(sC);
	free(sA);
}

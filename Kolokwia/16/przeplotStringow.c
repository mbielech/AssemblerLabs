#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char* func(char* buf, char* a, char* b) {
	int i = 0;
	int n = sizeof(a) + sizeof(b);
    while(i < n) {
    	if(i%2 == 0) {
    		buf[i] = a[i/2];
    	}
    	else {
    		buf[i] = b[i/2];
    	}
    	i++;
    }
    return buf;
}

char* funa(char* buf, char* a, char* b);

int main(void){

    char a[] ="abcd";
    char b[] ="efgh";
    char *bufC;
    char *bufA;
    
    int n = strlen(a) + strlen(b);
    
    bufC = malloc(n);
    printf("c %s\n",func(bufC,a,b));
    
    bufA = malloc(n);
    printf("a %s\n",funa(bufA,a,b));
    
    free(bufC);
	free(bufA);
}

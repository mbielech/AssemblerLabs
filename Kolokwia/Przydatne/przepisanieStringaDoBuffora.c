#include <stdio.h>
#include <stdlib.h>
#include <string.h>
char* func(char* buf, char* a) {
	int i = 0;
    while(a[i] != 0) {
    	buf[i] = a[i];
    	i++;
    }
    return buf;
}

char* funa(char* buf, char* a);

int main(void){

    char a[] ="bbbb";
    char *bufC;
    char *bufA;
    
    int n = strlen(a);
    
    bufC = malloc(n);
    printf("c %s\n",func(bufC,a));
    
    bufA = malloc(n);
    printf("a %s\n",funa(bufA,a));
    
    free(bufC);
	free(bufA);
}

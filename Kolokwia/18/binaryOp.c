#include <stdio.h>
#include <stdlib.h>

char* binA(char* result, char* arg1, char* arg2, int operation);

void main( void ) {
	char result[] = "       ";
	char arg1[] = "0101";
	char arg2[] = "10011";
	int operation = 0;
	
	printf("%s\n", binA(result, arg1, arg2, operation));
	
}

#include <stdio.h>
#include <stdlib.h>

char* usunSpacjeC( char* string, int zamiana )	{
	int i = 0;
	while(string[i] != 0) {
		if(zamiana){
			if(string[i] <= 'z' && string[i] >= 'a'){
				string[i] -= ('a'-'A');
			}
		}
		if(string[i] == ' ') {
			if(string[i+1] == ' ') {
				int j = i;
				while(string[j] != 0) {
					string[j] = string[j+1];
					j++;
				}
				i--;
			}
		}
		i++;
	}
	return string;
}

char* usunSpacjeA( char* string, int zamiana );

void main( void ) {
	char stringC[100] = "abc  DEF     gh ijk";
  
	printf("%s\n", usunSpacjeC(stringC, 1));
	
	char stringA[100] = "abc  DEF     gh ijk";
	
	printf("%s\n", usunSpacjeA(stringA, 1));

}

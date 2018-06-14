#include <stdio.h>
#include <stdlib.h>

//char* encodeC( char* buf, unsigned int mask, int operation, int character ) {
//	for(int i = 0; i < 10; i++) {
//		sprawdzic czy bit jest w masce
//		jesli jest to{
//			//wykonaj operacje na buf[i]
//			if(op == 3){
//				buf[i] = character;
//			}
//			if(op = 1){
//				while(1==1){
//					buf[i] = buf[i+1]
//					if buf[i] == '\0'
//						break;
//				}
//			}
//			
//			//zapisz do buf[i]
//		}
//		przesun maske
//	}
//}

char* encodeA( char* buf, unsigned int mask, int operation, int character );

void main( void ) {
	char buf[] = "0123456789012345";
	unsigned int mask = 1+2+16+32+128+512;
	int operation = 2;
	int character = 'X';
	printf("String:\n");
	printf("%s\n", buf);
	printf("Transpozycja:\n");
	printf("%s\n", encodeA(buf, mask, operation, character));
	printf("Wstawianie Xow:\n");
	operation = 3;
	printf("%s\n", encodeA(buf, mask, operation, character));
	printf("Usuwanie elementow:\n");
	operation = 1;
	printf("%s\n", encodeA(buf, mask, operation, character));
}

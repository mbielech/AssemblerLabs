#include <stdio.h>
#include <stdlib.h>

int stringC(char* buf, int a, int b, int charset, int* count) {
	int i = 0;
	*count = 0;
	int sum = 0;
	while(buf[i] != 0) {
		if(i >= a) {
			if(i <= b) {
				
				if(charset == 0) {
					(*count)++;
					sum += buf[i];
				}
				if(charset == 1) {
					if(buf[i]>='0') {
						if(buf[i]<='9') {
							(*count)++;
							sum += buf[i];
						}
					}
				}
				if(charset == 2) {
					if(buf[i]>='A') {
						if(buf[i]<='Z') {
							(*count)++;
							sum += buf[i];
						}
					}
				}
				if(charset == 3) {
					if(buf[i]>='a') {
						if(buf[i]<='z') {
							(*count)++;
							sum += buf[i];
						}
					}
				}
				if(charset == 4) {
					if(buf[i]>='a') {
						if(buf[i]<='z') {
							(*count)++;
							sum += buf[i];
						}
					}
					if(buf[i]>='A') {
						if(buf[i]<='Z') {
							(*count)++;
							sum += buf[i];
						}
					}
				}
			}
		}
		i++;
	}
	return sum;
}

int stringA(char* buf, int a, int b, int charset, int* count);

void main( void ) {
	char str[] = "ababA0eiubgoe";
	int a = 0;
	int b = 10;
	int charset = 0;
	int count = 0;
	
	int value = stringC(str, a, b, charset, &count);
	printf("%d, %d\n", value, count);
	
	count = 0;
	
	value = stringA(str, a, b, charset, &count);
	printf("%d, %d\n", value, count);
	
}

//Bielech Maciej
#include <stdlib.h>
#include <stdio.h>

long int sum_expr(int *tabA, int *tabB, int n, int operation );
int main(){
    int tabA[] = {0,-1000000099,2,3,4,5,6,7,8,9};
    int tabB[] = {9,8,7,6,5,4,3,4,1999999900,0};
    int n = 10;
    int operation = 0;
    int i;

    printf("Tab size = %d\n", n );
    for( i = 0; i < n; i++)
      printf("TabA[%2d] = %d  TabB[%2d] = %d\n", i, tabA[i], i, tabB[i] );
    printf("Operation = %d\n", operation );
    printf("Sum of expressions  = %ld\n", sum_expr( tabA, tabB, n, operation ) );
    return 0;
}


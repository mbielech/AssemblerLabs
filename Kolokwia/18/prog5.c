//---------------------------------------------------------------
// Test program - grupa 5
//---------------------------------------------------------------

#include <stdlib.h>
#include <stdio.h>

char *rotate_str(char *str, int shift, int case );

//---------------------------------------------------------------
// funkcja realizuje obrót (przesunięcie cykliczne) ciągu znaków
// z możliwością zmiany wielkości liter
//
// Parametry:
//    str   - łańcuch znaków (wejściowy/wynikowy)
//    shift - przesunięcie
//              shift>0 przesunięcie o shift znaków w prawo
//              shift<0 przesunięcie o |shift| znaków w lewo
//            UWAGA: shift może być większe od długości napisu!
//    case  - zmiana wielkości liter
//              0 = brak ingerencji w wielkość liter
//              1 = zmiana małych liter na wielkie
//              2 = zmiana wielkich liter na małe
//              3 = zmiana wielkości liter na przeciwne
//
// Wersja minimum : shift>0 dla case=0
//---------------------------------------------------------------
 
int main(){
    char str[] = "To jest napis testowy";
    int shift = 8;
    int case = 0;

    printf("Original string: %s\n", str );
    printf("Shift = %d\n", shift );
    printf("Case  = %d\n", case );
    printf("Rotated string : %s\n", rotate_str( str, shift, case ) );
    return 0;
}


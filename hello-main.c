#include "hello.h"
#include "sw-delay.h"
#include <stdio.h>

int main() {
    
    printf("Hello World from main!\n");

    swdelay(0x5ffffff);

    helloprint();
    
    printf("Bye!\n");

    return 0;
}

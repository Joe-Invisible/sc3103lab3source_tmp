#include "hello.h"
#include "sw-delay.h"

int loopcounter() {
    static int count = 0;
    printf("Hello World from funct 2!\n");
    swdelay(0x7fffffff);
    count++;
    return count;
}

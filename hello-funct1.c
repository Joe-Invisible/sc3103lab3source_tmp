#include "hello.h"
#include "sw-delay.h"

void helloprint() {
    printf("Hello World from function 1!\n");

    swdelay(0x6fffffff);

    while (1) {
        char c = getchar();
        int i = loopcounter();
        printf("You pressed some key %d times!\n", i);
        if (c != '\n') {
            getchar();  /* Consumes newline if not the only keystroke */
        } else {
            printf("Empty line, returning to caller...\n");
            return;
        }
    }

}


#ifndef SW_DELAY_INC__
#define SW_DELAY_INC__

#define swdelay(count_value)                \
    do {                                    \
        volatile unsigned long count =      \
            (count_value);                  \
        while (count > 0) {                 \
            count--;                        \
        }                                   \
    } while (0)

#endif  /* SW_DELAY_INC__ */

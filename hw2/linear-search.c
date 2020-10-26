// riscv-none-embed-gcc -march=rv32i -mabi=ilp32 -O3 -nostdlib linear-search.c -o linear-search

int _start()
{
    int max = 0;
    int arr[10] = {9, 28, 63, 88, 52, 9, 75, 6, 26, 7};

    for (int i = 0; i < 10; i++)
    {
        if (arr[i] > max)
        {
            max = arr[i];
        }
    }

    volatile char *tx = (volatile char *)0x40002000;
    const char *str = "The largest number in the array is ";
    while (*str)
    {
        *tx = *str;
        str++;
    }

    volatile int *tx2 = (volatile int *)0x40000008;
    *tx2 = max;

    return 0;
}

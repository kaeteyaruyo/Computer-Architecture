#include <stdio.h>

int main()
{
    int a[3] = {1, 2, 3};
    int b[3] = {4, 5, 6};
    int sum = 0;
    for (int i = 0; i < 3; ++i)
    {
        sum += a[i] * b[i];
    }
    printf("The inner product of two vectors is %d\n", sum);
    return 0;
}
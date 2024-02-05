#include <stdio.h>
#include <stdlib.h>

int main()
{
    int num;
    int answer = 1;
    char line[100];

    printf("Please enter a number:\n");
    fgets(line, 100, stdin);
    int check = sscanf(line, "%d", &num);
    if (!check)
    {
        printf("Error: No number entered\n");
        return 1;
    }

    for (int i = 1; i <= num; i++)
    {
        answer *= i;
    }

    printf("The factorial of %d is %d\n", num, answer);
}
#include<cs50.h>
#include<stdio.h>

int main(){
    
    printf("Number 1: ");
    int i = get_int();
    printf("Number 2: ");
    int j = get_int();
    //int total = i + j;

    //printf("Total: %i", total);
    //printf("Total: %i", i+j);
    printf("Subtract: %i\n", i - j);
    printf("Multiply: %i\n", i * j);
    printf("Division: %i\n", i / j);
    printf("Remainder: %i\n", i % j);
    
    printf("\n"); //newline
    return 0;
}
/*
multiply.c 14.03.2011
read 2 integer values from the keyboard
pass two integers, and a long int pointer (64bit)
to the assembly routine multiply
*/

#include <stdio.h>
#include <stdlib.h>
#include "cdecl.h"

extern int PRE_CDECL multiply ( int a, int b ,long long int *result) POST_CDECL;

int main()
{
  int status;
  int a,b;
  long long int result;	   // long long int is 64 bit wide

  printf("Value 1: ");
  scanf("%d", &a);
  
  printf("Value 2: ");
  scanf("%d", &b);

  status = multiply(a,b,&result);

  if (status !=0) printf("Assembler routine returned error: %d\n",status);
  else 	printf("The product is:%lld\n",result);

  return status;
}

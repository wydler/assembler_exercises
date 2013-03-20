/*
add.c 14.03.2011
Reads 2 integer values from the keyboard
Passes two integers and one int pointer
to the assembly routine add_asm
*/

#include <stdio.h>
#include <stdlib.h>
#include "cdecl.h"

extern int PRE_CDECL add_asm ( int a, int b ,int *result) POST_CDECL;

int main()
{
  int status;
  int a,b,result;

  printf("Value 1: ");
  scanf("%d", &a);
  
  printf("Value 2: ");
  scanf("%d", &b);

  status = add_asm (a,b,&result);	// calls the assembly program

  if (status !=0) printf("Assembler routine returned error: %d\n",status);
  else 	printf("The sum is:%d\n",result);

  return status;
}

#include <stdio.h>
#include <stdlib.h>
#include "cdecl.h"

extern int PRE_CDECL convbin ( int a ,char *result) POST_CDECL;

int main()
{
  int a,status;
  char result[33];

  printf("Value : ");
  scanf("%d", &a);
  
/* please insert the call of the assembly routine convbin here
*/

  if (status !=0) printf("Assembler routine returned error: %d\n",status);
  else 	printf("The 32 bit binary value of %d is: %s\n",a,result);

  return status;
}

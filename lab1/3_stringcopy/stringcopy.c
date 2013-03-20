/*
stringcopy.c 23.09.2009
Reads a string from the Keyboard
Passes a pointer to this string and a pointer to an empty string
to the assembly routine stringcopy
*/

#include <stdio.h>
#include <stdlib.h>
#include "cdecl.h"

char buf_in[256];
char buf_out[256];

extern int PRE_CDECL stringcopy( char *buf_in, char *buf_out, int *number ) POST_CDECL;

int main()
{
  int status;
  int number;

  printf("Enter some characters (max. 256)\n");
 
  fgets(buf_in, 255, stdin);

  status = stringcopy(&buf_in[0], &buf_out[0], &number);

  if (status !=0) { 
    printf("\nAssembler routine returned error:%d\n", status);
  }
  else { 
    printf("\n The strings size is %d characters.\n", number);
    printf("\n The copied string: %s \n", buf_out);
  }
  return status;
}

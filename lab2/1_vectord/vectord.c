/* file: vectrod.c 6.3.2012 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "cdecl.h"
#define MAXDIM 32

extern int PRE_CDECL vectord_asm (int dimension, int *y1, int *y2, int *distance2) POST_CDECL;

int main()
{
  int i,dimension,distance2,status;
  int y1[MAXDIM],y2[MAXDIM];
  float distance;

printf("Vector dimension: ");
scanf("%d",&dimension);
if (dimension > MAXDIM) dimension =MAXDIM;

for (i=0;i<dimension;i++)
{
	printf("Y1_%d-> ",i);
	scanf("%d",&y1[i]);
}

printf("\n");

for (i=0;i<dimension;i++)
{
	printf("Y2_%d-> ",i);
	scanf("%d",&y2[i]);
}
  
status = vectord_asm (dimension,y1,y2,&distance2);
  
  if (status !=0) {
	printf("Assembler routine returned error: %d\n",status);
  	}
  else{  
  	printf("The distance2 is: %d\n",distance2);
     	distance = sqrt(distance2);
	printf("The distance is: %f\n",distance);
  }

  return status;
}

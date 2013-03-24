/*
mean.c 11.10.2011
Passes the size of the array, the pointer to the array, and a pointer to the result to the assembly routine mean
*/
#include <stdio.h>
#include <stdlib.h>
#include "cdecl.h"

struct input_data {
	short count;
	short values[256];
	};

extern int PRE_CDECL mean (struct input_data *myData, int *result) POST_CDECL;

int main()
{
  int status,i,result;
 
  
  struct input_data myData;

  printf("How many values: ");
  scanf("%hd", &myData.count);
  if (myData.count >255) {  
          myData.count=255;   //limit number of values 
          printf("Number of values limited to 255.\n"); 
     }
  
  for (i=0;i<myData.count;i++)
  {
 	printf("Value %d: ",i);
  	scanf("%hd", &myData.values[i]);
  }

  status = mean(&myData,&result);	// calls the assembly program

  if (status !=0) printf("Assembler routine returned error: %d\n",status);
  else 	printf("The mean value is: %d \n",result);

   return 0;
}

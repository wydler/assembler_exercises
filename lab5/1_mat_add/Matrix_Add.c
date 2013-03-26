/*
 * file: Matrix_Add.c
 * Program for a matrix addition. The elements of the matrixes are type 'short'.
 * The matrixes are described in a data structure (struct matrix). 
 * The structure contents in addition to the matrix elements the number of rows,
 * the number of columns and the max number of columns of the matrix.
 * With the help of this parameters there can be specified matrixes with a different
 * number of elements (max 10 x10 elements).
 * Because of the definition of a structure a function call can be realized with 
 * only a few parameters.
 */

#include <stdio.h>
#include <stdlib.h>

#include "cdecl.h"

struct Matrix{
  unsigned int row;
  unsigned int maxcolumn;
  unsigned int column;
  short mat[10][10];
  };



/*
 * function Ass_Matrix
 * Add two matrixes; the number of rows and columns have to be the same
 * The matrixes are organized in the datatype Struct "Matrix"
 *
 * 	struct Matrix{
 * 	  unsigned short row;
 * 	  unsigned short maxcolumn;
 * 	  unsigned short column;
 *	  unsigned short mat[10][10];
 * 	  };
 *
 * The elements of the matrixes are signed 16 Bit numbers
 * Parameters:
 *   a - 1. matrix
 *   b - 2. matrix
 *   sum -> Destination -> Sum of a + b
 */
extern int PRE_CDECL Ass_Matrix( struct Matrix *A, struct Matrix *B, struct Matrix *Sum ) POST_CDECL;

struct Matrix Matrix_A, Matrix_B, Matrix_Sum;

int main()
{
  int status;
  int i,j;

  unsigned int row, column;

  printf("Please specify the number of rows (max 10) and columns (max 10) of the first matrix!\n");
  printf("Number of rows? --> ");
  scanf("%d", &row);
  if (row > 10) row = 10;	/* Limitation of rows */
  Matrix_A.row =row;
  printf("Number of columns? --> ");
  scanf("%d", &column);
  if (column > 10) column = 10;	/* Limitation of columns */
  Matrix_A.column =column;

  for (i = 0; i < row; i++) {
    for (j = 0; j < column; j++){
      printf("Matrix_A[%u],[%u] ", i, j);
      scanf("%hd",&Matrix_A.mat[i][j]);
    }
   } 

  printf("\n");
  printf("Please specify the number of rows (max 10) and columns (max 10) of the second matrix!\n");
  printf("Number of rows? --> ");
  scanf("%d", &row);
  if (row > 10) row = 10;	/* Limitation of rows */
  Matrix_B.row =row;
  printf("Number of columns? --> ");
  scanf("%d", &column);
  if (column > 10) column = 10;	/* Limitation of columns */
  Matrix_B.column =column;

  for (i = 0; i < row; i++) {
    for (j = 0; j < column; j++){
      printf("Matrix_B[%u],[%u] ", i, j);
      scanf("%hd",&Matrix_B.mat[i][j]);
    }
   }

  Matrix_A.maxcolumn = Matrix_B.maxcolumn = Matrix_Sum.maxcolumn = 10;

  status = Ass_Matrix(&Matrix_A, &Matrix_B, &Matrix_Sum);

  if( status )
  {
    printf("ERROR\n");
    return status;
  }

    /*
     * print out the result
     */

  printf("\nThe sum is:\n");

  for (i = 0; i < row; i++){
    for (j = 0; j < column; j++){
      printf("Matrix_Sum[%u],[%u] ", i, j);
      printf("%d ",Matrix_Sum.mat[i][j]);
    }
    printf("\n");
  }

    status = 0;


  return status;
}

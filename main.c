/*
 * Filename: main.c
 * Description: Main driver for matrix manipulating functions
 * Date: 
 * Name: 
 */

#include <stdio.h>   // printf()

#define N 4

void copy(void *, void *, int);
//void transpose(void *, int );
//void reverseColumns(void *, int n);
void printMatrixByRow(void *, int);

char A[N][N] = { 1,  -2,  3,  -4,
                -5,   6, -7,   8,
                -1,   2, -3,   4,
                 5,  -6,  7,  -8};

char C[N][N];

void main() {

  printf("Matrix A: \n");
  printMatrixByRow(A, N); 
	
  printf("Copy A to C\n");
  copy(A, C, N);
	
  printf("\nMatrix C: \n");
  printMatrixByRow(C, N);

  printf("Rotating the matrix C by 90 degrees clockwise: \n");
//  transpose(C, N);
//  reverseColumns(C, N);
  printMatrixByRow(C, N);

  return;
}

void printMatrixByRow(void *D, int n) {

  for (unsigned i = 0; i < n; i++) {
	for (unsigned j = 0; j < n; j++) {
      if ( j == n-1 ) printf("%4d", *((char*)D + i*n + j)); 
	  else printf("%4d ", *((char*)D + i*n + j)); 
    }
    printf("\n");
  }
  printf("\n");
  return;
}
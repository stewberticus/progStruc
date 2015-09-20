#include <stdlib.h>
#include <stdio.h>
#include <math.h>

int fib(int); 
int isqrt(int);

int main()
{
    char line[82];
    int  n;

    printf("Enter integer: ");
    fgets(line, sizeof line, stdin);
   
    n = atoi(line);
   
  
 

    printf("n: %i\n", n);
    printf("fib(%i) := %i\n", n, fib(n));
    printf("interger sqrt(%i):= %i\n", n, isqrt(n));
    printf("floating point sqrt(%i)= %f\n",n,sqrt((float)n)); 



}



int isqrt(int n)
 {
     int result = 1;
     for( int i = 1; i*i <= n; ++i )
          result = i;
     return  result;
 }
int fib(int n){

   int first = 0, second = 1, next, c;
  
   for ( c = 0 ; c < n ; c++ )
   {
      if ( c <= 1 )
         next = c;
      else
      {
         next = first + second;
         first = second;
         second = next;
      }
      
   }
	return next;
}

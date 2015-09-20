#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(){
 
char line[5000];
    int  n;

   while( fgets(line, sizeof line, stdin)!= NULL){;
    n = strlen(line);
for (int i =0; i<n;++i){
	printf("%c",line[n-1-i]);

}}
printf("\n");



}

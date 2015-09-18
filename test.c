#include <stdio.h>
#include <stdlib.h>


int main(){
char c;
int lines= 0;
int words = 0;
int space_prev= 0; 
int chars = 0; 

while( (c = getchar()) != EOF ){
	if(c == 10){
		lines++;
		words ++;
		chars ++;
	}
	else if(c == ' '){
		if(!space_prev){
			words++;
		}
		space_prev = 1;
		chars++;
	}
	else{
		//printf("%d\n",c);
		
		space_prev = 0;
		chars ++;

	}

}
printf("characters: %d\n",chars);

printf("words: %d\n",words);
		
printf("lines: %d\n",lines);



}

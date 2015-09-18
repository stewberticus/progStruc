#include <stdio.h>
#include <stdlib.h>


int main(){
char c;
int lines;
int words;
int space_prev; 
int chars; 

while( (c = getchar()) != EOF ){
	if(c == '/n'){
		lines++;
	}
	else if(c == ' '){
		if(!space_prev){
			words++;
		}
		space_prev = 1;
	}
	else{
		space_prev = 0;
		chars ++;

	}

}
printf("characters: %d\n",chars);

printf("words: %d\n",words);
		
printf("liness: %d\n",lines);



}

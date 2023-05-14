#include<stdio.h>

int main(){

	char* p = malloc(0x18);
	char* p1 = malloc(0x118);
	char* p2 = malloc(0x128);
	char* p3 = malloc(0x408);
	free(p);
	free(p3);
	free(p1);
	free(p2);
	return 0;
}

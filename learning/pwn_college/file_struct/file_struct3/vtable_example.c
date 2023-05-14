#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>

void win() {
	puts("PWNed !!!");
}

int main() {
	//leak win func addr
	printf("win func addr -->:%p\n",&win);
	printf("puts addr -->:%p\n",&puts);

	// open a file
	FILE *file_pointer = fopen("/dev/null", "w");


	char buf[0x1000];
	printf("Reading into stack buffer addr -->%p\n",buf);
	read(0,buf,0x1000);

	puts("Reading over file pointer");
	// Overwrite the file struct from stdin
	read(0,file_pointer,0x100);

	// Call fread on the file_pointer
	
	puts("Calling fwrite!");
	fwrite(buf,1,10,file_pointer);

	exit(0);
}

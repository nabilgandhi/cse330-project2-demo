#define _GNU_SOURCE
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

int main(void)
{
	printf("Process. My pid is %d \n", getpid());

	sleep(60);
	
	return 0;
}

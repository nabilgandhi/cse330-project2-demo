#define _GNU_SOURCE
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

int main(void)
{
	printf("Process. My pid is %d and my parent's pid is %d\n", getpid(), getppid());

	volatile int i;
	volatile int j;
	volatile int k;
	volatile int a=1,b=1;
	volatile int SIZE = 2147483640;
	while(1){
		for(i=0;i<SIZE;i++){
			for(j=0;j<SIZE;j++){
				for(k=0;k<SIZE;k++){
					a = a + b;
				}
			}
		}
		sleep(0.1);
	}
	
	return a;
}

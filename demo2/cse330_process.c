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




/*
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>  //Header file for sleep(). man 3 sleep for details.
#include <pthread.h>

#define _GNU_SOURCE
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sched.h>
#define CURR_THREAD 0
  
// A normal C function that is executed as a thread 
// when its name is specified in pthread_create()
void *myThreadFun(void *vargp)
{
	
	int queue = (int)vargp; 
// 	int *queue_num = (int *)vargp;
// 	int queue = *(int *)vargp;
// 	printf("1Assign this thread to queue #%i\n", *queue_num);
	printf("2Assign this thread to queue #%i\n", queue);
	
//     sleep(1);
//     printf("Printing GeeksQuiz from Thread \n");

int ret, ret_child_1, ret_child_2, ret_child_3;
struct sched_param param;
int sched_class, sched_prio = 0;
ret = sched_getparam(CURR_THREAD, &param);

sched_class = 2;
sched_prio = queue;
param.sched_priority = sched_prio;
if (sched_setscheduler(CURR_THREAD, SCHED_RR, &param) == -1) { fprintf(stderr, "error setting scheduler, maker sure you are root\n"); }

printf("Child 1 pid: %d Parent's pid is %d Sched_Class: %i Queue No: %i\n", getpid(), getppid(), sched_class, 99-sched_prio);
	
    return NULL;
}
   
int main()
{
	int i;
	int queue;
	pthread_t thread_id;

	// Let us create three threads
	for (i = 0; i < 3; i++){
		queue = i;
		pthread_create(&thread_id, NULL, myThreadFun, (void *)i);
	}

	pthread_exit(NULL);
	return 0;
	
//     pthread_t thread_id;
//     printf("Before Thread\n");
//     pthread_create(&thread_id, NULL, myThreadFun, NULL);
//     pthread_join(thread_id, NULL);
//     printf("After Thread\n");
//     exit(0);
}
*/


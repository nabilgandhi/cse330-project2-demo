### Run Command only once.
- chmod +x demo1.sh priority_sched_update.sh

### Testcase 1
- ./demo1.sh 1
- sudo ./priority_sched_update.sh 1
- sudo rmmod mymodule.ko; sudo insmod mymodule.ko uid=1000; sleep 1; dmesg | grep user_process_ge
- ps -u 1000  -o pid,comm,pri,class,etime | grep user_process_ge

### Testcase 2
- ./demo1.sh 2
- sudo ./priority_sched_update.sh 2
- sudo rmmod mymodule.ko; sudo insmod mymodule.ko uid=1000; sleep 1; dmesg | grep user_process_ge
- ps -u 1000  -o pid,comm,pri,class,etime | grep user_process_ge
- dmesg | grep user_process_ge | wc -l
- ps -u 1000  -o pid,comm,pri,class,etime | grep user_process_ge | wc -l

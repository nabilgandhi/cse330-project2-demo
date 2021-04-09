#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage:"
    echo "      $0 1"
    echo "              or"
    echo "      $0 2"
    exit
fi

make
killall user_process_generator

if [ $1 -eq 1 ]; then
        echo "Executing test #1"
        echo "Spawning 10 processes"

        for i in {1..10}
        do
                ( ./user_process_generator &)
        done
fi

if [ $1 -eq 2 ]; then
        echo "Executing test #2"
        echo "Spawning 100 processes"

        for i in {1..100}
        do
                ( ./user_process_generator &)
        done
fi


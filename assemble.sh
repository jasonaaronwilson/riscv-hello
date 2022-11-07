#!/bin/bash

# riscv64-linux-gnu-as -march=rv64imac -o HelloWorld.o HelloWorld.s

riscv64-linux-gnu-as -o hello.o hello.s && riscv64-linux-gnu-ld -o hello hello.o



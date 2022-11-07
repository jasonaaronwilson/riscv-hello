# RISCV Hello

This is a trivial demonstration program of "Hello World" which is
based off of:

https://smist08.wordpress.com/2019/09/07/risc-v-assembly-language-hello-world/

So far the only difference is removing the -march=rv64imac argument to
riscv64-linux-gnu-as. Additionally, we are using qemu-riscv64 to run
the program rather than TinyEMU.



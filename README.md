# RISCV64 Hello World Assembly Language Program

This is a trivial demonstration program of "Hello World" which is
based off of:

https://smist08.wordpress.com/2019/09/07/risc-v-assembly-language-hello-world/

The only "command" differences are removing the -march=rv64imac
argument to riscv64-linux-gnu-as and additionally, we are using
qemu-riscv64 to run the program rather than TinyEMU.

# Conclusions

Each GNU assembler "as" file should probably have at most one ".text"
and ".data" section. (Even though we don't demonstrate that multiple
files will work fine, I believe it will while we do demonstrate some
patterns that do not work.)

# Versions

Everything changes (including regressions) so I'll provide the
versions of the software that I'm using and the OS.

```
make versions
```

```
qemu-riscv64 --version
qemu-riscv64 version 7.1.0
Copyright (c) 2003-2022 Fabrice Bellard and the QEMU Project developers
riscv64-linux-gnu-as --version
GNU assembler (GNU Binutils) 2.38
Copyright (C) 2022 Free Software Foundation, Inc.
This program is free software; you may redistribute it under the terms of
the GNU General Public License version 3 or later.
This program has absolutely no warranty.
This assembler was configured for a target of `riscv64-linux-gnu'.
riscv64-linux-gnu-ld --version
GNU ld (GNU Binutils) 2.38
Copyright (C) 2022 Free Software Foundation, Inc.
This program is free software; you may redistribute it under the terms of
the GNU General Public License version 3 or (at your option) a later version.
This program has absolutely no warranty.
lsb_release -a
LSB Version:    n/a
Distributor ID: ManjaroLinux
Description:    Manjaro Linux
Release:        22.0.0
Codename:       Sikaris
# This is perhaps too detailed...
# lscpu
```

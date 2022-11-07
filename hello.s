#
# Risc-V Assembler program to print "Hello World!"
# to stdout.
#
# a0-a2 - parameters to linux function services
# a7 - linux function number
#

## Including ".section .code" in the assembly file causes a core dump
## (I'm still not sure if the core dump is in qemu, something it
## calls, or if this is a "reflected" problem as it tries to execute
## instructions).
##
## To see this for yourself, just uncomment the line below:
##
## .section .code
##
## (And remove the .text below...)
##
## I only used ".section .code" because this does not work:
##
## .code
##
## hello.s: Assembler messages:
## hello.s:14: Error: unknown pseudo-op: `.code'
## 
## Which of course is probably because ".text" is the correct
## "spelling" of "the read only code segment". I'm not sure where I
## picked up .code to be honest.
##
## Uncommenting this appears to (silently) break things. 
##
## .data
## foobar:      .ascii "Worries.\n"
##
## While only uncommenting this just magically works again:
##
## .data 1
## foobar:      .ascii "No worries.\n"

.text

.global foo
.global _start      # Provide program starting address to linker

# This is to test a theory of whether _start label or simply the first
# instructions in the code section are used or not.
#
# This basically proves that the indeed the _start label is used and
# not any code that may proceed it (otherwise we'd see an infinite
# loop instead of the correct output). Also note that we didn't add
# any "linker" flags to try to force a particular "_start" label which
# may be another option.

foo:    
        j foo

# Setup the parameters to print hello world
# and then call Linux to do it.

_start: addi  a0, x0, 1      # 1 = StdOut
        la    a1, helloworld # load address of helloworld
        addi  a2, x0, 13     # length of our string
        addi  a7, x0, 64     # linux write system call
        ecall                # Call linux to output the string

# Setup the parameters to exit the program
# and then call Linux to do it.

        addi    a0, x0, 0   # Use 0 return code
        addi    a7, x0, 93  # Service command code 93 terminates
        ecall               # Call linux to terminate the program

.data
helloworld:      .ascii "Hello World!\n"

## The basic program is from:
##
## https://smist08.wordpress.com/2019/09/07/risc-v-assembly-language-hello-world/
##
## The extra variations are me trying to figure out why some other
## code was failing. I believe I'm starting to understand more why
## people may not like "gas" (I always thought it was because the x86
## syntax was "AT&T" rather than "Microsoft").

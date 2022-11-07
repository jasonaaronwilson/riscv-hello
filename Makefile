all: build

build:
	./assemble.sh

run:
	./run.sh

clean:
	rm -f hello.o hello *~

diff:
	git difftool HEAD

versions:
	qemu-riscv64 --version
	riscv64-linux-gnu-as --version
	riscv64-linux-gnu-ld --version
	lsb_release -a
	# This is perhaps too detailed...
	# lscpu

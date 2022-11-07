all: build

build:
	./assemble.sh

run:
	./run.sh

clean:
	rm -f hello.o hello *~

diff:
	git difftool HEAD


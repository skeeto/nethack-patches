compile: nethack-3.4.3/Makefile
	$(MAKE) -C nethack-3.4.3

install: compile
	$(MAKE) -C nethack-3.4.3 install

nethack-3.4.3/Makefile: source
	cd nethack-3.4.3/ && sh sys/unix/setup.sh

source: nethack-3.4.3

nethack-3.4.3: nethack-343-src.tgz
	tar zxf nethack-343-src.tgz
	ln -s ../patches nethack-3.4.3/patches
	cd nethack-3.4.3/ && quilt push -a

clean:
	rm -rf nethack-3.4.3

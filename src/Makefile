CC = gcc
FC = gfortran
CCFLAGS = -O3 -Wno-unused-result
FCFLAGS = -O3
CCLINKER = gcc
FCLINKER = gfortran
CCLINKERFLAGS = -static
FCLINKERFLAGS = -static

.PHONY: all

all: GeneExtInp ReadExtOut

.PHONY: install

install: all
	-rm -f *.o
	if [ ! -d ../bin/ ]; then mkdir ../bin/; fi
	mv GeneExtInp ../bin/
	mv ReadExtOut ../bin/
	cp ExtDFTD4.sh ../bin/
	cp ExtDFTD4_settings.ini ../bin/
	@echo "installed to ../bin/"

GeneExtInp: GeneExtInp.o
	@echo "\033[40;35m Linking $@ ... \033[0m"
	$(CCLINKER) $(CCLINKERFLAGS) -o $@ $<

ReadExtOut: ReadExtOut.o ReadExtOutValue.o WriteExtOut.o
	@echo "\033[40;35m Linking $@ ... \033[0m"
	$(CCLINKER) $(CCLINKERFLAGS) -o $@ $^ -l $(FCLINKER) -l quadmath -l m

GeneExtInp.o: GeneExtInp.c
	@echo "\033[40;35m Compiling $@ ... \033[0m"
	$(CC) $(CCFLAGS) -o $@ -c $<

ReadExtOut.o: ReadExtOut.c
	@echo "\033[40;35m Compiling $@ ... \033[0m"
	$(CC) $(CCFLAGS) -o $@ -c $<

ReadExtOutValue.o: ReadExtOutValue.f90
	@echo "\033[40;35m Compiling $@ ... \033[0m"
	$(FC) $(FCFLAGS) -o $@ -c $<

WriteExtOut.o: WriteExtOut.f90
	@echo "\033[40;35m Compiling $@ ... \033[0m"
	$(FC) $(FCFLAGS) -o $@ -c $<

.PHONY: clean

clean:
	-rm -f GeneExtInp ReadExtOut
	-rm -f *.o 

	



OBJECTS = quadrature.o test1.o
OBJECTS2 = quadrature.o test2.o
OBJECTS3 = quadrature_omp.o test2_omp.o
MODULES = quadrature.mod

FFLAGS = -g

.PHONY: test1 clean

test2_omp: test2_omp.exe
	./test2_omp.exe
	
test2_omp.exe: quadrature_omp.mod $(OBJECTS3)
	gfortran -gopenmp $(OBJECTS3) -o test2_omp.exe

test2: test2.exe
	./test2.exe
	
test2.exe: $(MODULES) $(OBJECTS2)
	gfortran $(FFLAGS) $(OBJECTS2) -o test2.exe
	
test1: test1.exe
	./test1.exe
	
test1.exe: $(MODULES) $(OBJECTS)
	gfortran $(FFLAGS) $(OBJECTS) -o test1.exe

%.o : %.f90
	gfortran $(FFLAGS) -c $<

%.mod : %.f90
	gfortran $(FFLAGS) -c $<
	
clean:
	rm -f *.o *.exe *.mod

#-----------------------------------------------------------------------
# Compiler flags
#-----------------------------------------------------------------------

#
# gfortran
#
#F90	= gfortran
#F77	= gfortran
#CC	= gcc
##F90OPTS = -cpp -g -ffixed-line-length-none -ffree-line-length-none -fcheck=bounds -fcheck=all -fopenmp -O3 -fbacktrace
#F90OPTS = -cpp -g -ffixed-line-length-none -ffree-line-length-none -fopenmp -O3 -fbacktrace
#CCOPTS  = -g -O0

#
# intel
#
F90	 = ifort
F77	 = ifort
CC	 = icc
F90OPTS = -cpp -g -assume byterecl -free -fopenmp -traceback -O2 -unroll0 -diag-disable 8290 -diag-disable 8291
CCOPTS  = -g -O0

#-----------------------------------------------------------------------
# External libraries
#-----------------------------------------------------------------------
LIBS= -llapack -lblas

#-----------------------------------------------------------------------
# Define object files
#-----------------------------------------------------------------------
CHEBY2SPEC = lib/constants.o \
	lib/channels.o \
	lib/iomod.o \
	lib/parsemod.o \
	cheby2spec/cheby2spec.o

CHEBY2SPEC_OBJ = constants.o \
	channels.o \
	iomod.o \
	parsemod.o \
	cheby2spec.o

CHEBYFD = lib/constants.o \
	lib/channels.o \
	lib/iomod.o \
	lib/parsemod.o \
	chebyfd/dpss_ev.o \
	chebyfd/pythag.o \
	chebyfd/set_xint.o \
	chebyfd/sft.o \
	chebyfd/tinvit.o \
	chebyfd/tridib.o \
	chebyfd/xint.o \
	chebyfd/dpssmt.o \
	chebyfd/cfdmod.o \
	chebyfd/gaussian_coeffs.o \
	chebyfd/idpss_coeffs.o \
	chebyfd/chebyfd.o

CHEBYFD_OBJ = constants.o \
	channels.o \
	iomod.o \
	parsemod.o \
	dpss_ev.o \
	pythag.o \
	set_xint.o \
	sft.o \
	tinvit.o \
	tridib.o \
	xint.o \
	dpssmt.o \
	cfdmod.o \
	gaussian_coeffs.o \
	idpss_coeffs.o \
	chebyfd.o

#-----------------------------------------------------------------------
# Rules to create the programs
#-----------------------------------------------------------------------
cheby2spec: $(CHEBY2SPEC)
	$(F90) $(F90OPTS) $(CHEBY2SPEC_OBJ) $(LIBS) -o bin/cheby2spec
	rm -f *.o *~ *.mod

chebyfd: $(CHEBYFD)
	$(F90) $(F90OPTS) $(CHEBYFD_OBJ) $(LIBS) -o bin/chebyfd
	rm -f *.o *~ *.mod

%.o: %.f90
	$(F90) -c $(F90OPTS) $<

%.o: %.f
	$(F77) -c $(F77OPTS) $<

%.o: %.c
	$(CC)	 $(CCOPTS)  -c $<

clean_all:
	rm -f *.o *~ *.mod

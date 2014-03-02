
ACLOCAL_AMFLAGS = -I m4

JANSSON_INCLUDES= -I$(top_builddir)/compat/jansson-2.5/src -I$(top_srcdir)/compat/jansson-2.5/src

if WANT_USBUTILS
USBUTILS_INCLUDES = -I$(top_builddir)/compat/libusb-1.0/libusb -I$(top_srcdir)/compat/libusb-1.0/libusb
else
USBUTILS_INCLUDES =
endif

EXTRA_DIST	= example.conf m4/gnulib-cache.m4 linux-usb-cgminer \
		  ADL_SDK/readme.txt api-example.php miner.php	\
		  API.class API.java api-example.c windows-build.txt \
		  bitstreams/* API-README FPGA-README SCRYPT-README \
		  bitforce-firmware-flash.c hexdump.c ASIC-README \
		  01-cgminer.rules GPU-README

SUBDIRS		= lib compat ccan

INCLUDES	= $(PTHREAD_FLAGS) -fno-strict-aliasing $(JANSSON_INCLUDES) $(USBUTILS_INCLUDES)

bin_PROGRAMS	= exeminer

exeminer_LDFLAGS	= $(PTHREAD_FLAGS)
exeminer_LDADD	= $(DLOPEN_FLAGS) @LIBCURL_LIBS@ @JANSSON_LIBS@ @PTHREAD_LIBS@ \
		  @OPENCL_LIBS@ @NCURSES_LIBS@ @PDCURSES_LIBS@ @WS2_LIBS@ \
		  @LIBUSB_LIBS@ @MM_LIBS@ @RT_LIBS@ \
		  @MATH_LIBS@ lib/libgnu.a ccan/libccan.a

if HAVE_WINDOWS
exeminer_CPPFLAGS = -I$(top_builddir)/lib -I$(top_srcdir)/lib @OPENCL_FLAGS@
else
exeminer_CPPFLAGS = -I$(top_builddir)/lib -I$(top_srcdir)/lib @OPENCL_FLAGS@ @LIBCURL_CFLAGS@
endif

exeminer_CPPFLAGS += $(ADL_CPPFLAGS)

# common sources
exeminer_SOURCES := exeminer.c

exeminer_SOURCES	+= elist.h miner.h compat.h bench_block.h	\
		   util.c util.h uthash.h logging.h		\
		   sha2.c sha2.h api.c

exeminer_SOURCES	+= logging.c

if HAS_OPENCL
bin_SCRIPTS	= $(top_srcdir)/*.cl

exeminer_SOURCES += driver-opencl.h driver-opencl.c
exeminer_SOURCES += ocl.c ocl.h findnonce.c findnonce.h
exeminer_SOURCES += adl.c adl.h adl_functions.h
exeminer_SOURCES += *.cl

if HAS_SCRYPT
exeminer_SOURCES += scrypt.c scrypt.h
endif

endif

if NEED_FPGAUTILS
exeminer_SOURCES += fpgautils.c fpgautils.h
endif

if WANT_USBUTILS
exeminer_SOURCES += usbutils.c usbutils.h
endif

# Device drivers
if HAS_AVALON
exeminer_SOURCES += driver-avalon.c driver-avalon.h
endif

if HAS_KNC
exeminer_SOURCES += driver-knc-spi-fpga.c
endif

if HAS_BFLSC
exeminer_SOURCES += driver-bflsc.c driver-bflsc.h
endif

if HAS_BITFORCE
exeminer_SOURCES += driver-bitforce.c
endif

if HAS_HASHFAST
exeminer_SOURCES += driver-hashfast.c driver-hashfast.h hf_protocol.h
endif

if HAS_BITFURY
exeminer_SOURCES += driver-bitfury.c driver-bitfury.h
endif

if HAS_ICARUS
exeminer_SOURCES += driver-icarus.c
endif

if HAS_KLONDIKE
exeminer_SOURCES += driver-klondike.c
endif

if HAS_MODMINER
exeminer_SOURCES += driver-modminer.c
bitstreamsdir = $(bindir)/bitstreams
dist_bitstreams_DATA = $(top_srcdir)/bitstreams/*
endif

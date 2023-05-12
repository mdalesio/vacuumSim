TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS BELOW HERE

# Use typed rset structure (see 3.16.1 release notes)
USR_CPPFLAGS += -DUSE_TYPED_RSET

# xxxRecord.h will be created from xxxRecord.dbd
DBDINC += xxxRecord

# Install xxxSupport.dbd into <top>/dbd
DBD += xxxSupport.dbd

# Build an IOC support library
LIBRARY_IOC += vacuumSimSupport

# Compile and add code to the support library
vacuumSimSupport_SRCS += xxxRecord.c
vacuumSimSupport_SRCS += devXxxSoft.c

# Link locally-provided code into the support library,
# rather than directly into the IOC application, that
# causes problems on Windows DLL builds
vacuumSimSupport_SRCS += dbSubExample.c
vacuumSimSupport_SRCS += devvacuumSimVersion.c
vacuumSimSupport_SRCS += vacuumSimHello.c
vacuumSimSupport_SRCS += initTrace.c

vacuumSimSupport_LIBS += $(EPICS_BASE_IOC_LIBS)

# Auto-generate a header file containing a version string.
# Version comes from the VCS if available, else date+time.
GENVERSION = vacuumSimVersion.h
# Macro name
GENVERSIONMACRO = vacuumSimVERSION

# Build the IOC application
PROD_IOC = vacuumSim

# vacuumSim.dbd will be created and installed
DBD += vacuumSim.dbd

# vacuumSim.dbd will include these files:
vacuumSim_DBD += base.dbd
vacuumSim_DBD += xxxSupport.dbd
vacuumSim_DBD += dbSubExample.dbd
vacuumSim_DBD += devvacuumSimVersion.dbd
vacuumSim_DBD += vacuumSimHello.dbd
vacuumSim_DBD += initTrace.dbd

# vacuumSim_registerRecordDeviceDriver.cpp derives from vacuumSim.dbd
vacuumSim_SRCS += vacuumSim_registerRecordDeviceDriver.cpp

# Build the main IOC entry point where needed
vacuumSim_SRCS_DEFAULT += vacuumSimMain.cpp
vacuumSim_SRCS_vxWorks += -nil-

# Link in the code from our support library
vacuumSim_LIBS += vacuumSimSupport

# To build SNL programs, SNCSEQ must be defined
# in the <top>/configure/RELEASE file
ifneq ($(SNCSEQ),)
    # Build sncExample into vacuumSimSupport
    sncExample_SNCFLAGS += +r
    vacuumSim_DBD += sncExample.dbd
    # A .stt sequence program is *not* pre-processed:
    vacuumSimSupport_SRCS += sncExample.stt
    vacuumSimSupport_LIBS += seq pv
    vacuumSim_LIBS += seq pv

    # Build sncProgram as a standalone program
    PROD_HOST += sncProgram
    sncProgram_SNCFLAGS += +m
    # A .st sequence program *is* pre-processed:
    sncProgram_SRCS += sncProgram.st
    sncProgram_LIBS += seq pv
    sncProgram_LIBS += $(EPICS_BASE_HOST_LIBS)
endif

# Link QSRV (pvAccess Server) if available
ifdef EPICS_QSRV_MAJOR_VERSION
    vacuumSim_LIBS += qsrv
    vacuumSim_LIBS += $(EPICS_BASE_PVA_CORE_LIBS)
    vacuumSim_DBD += PVAServerRegister.dbd
    vacuumSim_DBD += qsrv.dbd
endif

# Finally link IOC to the EPICS Base libraries
vacuumSim_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD EXTRA GNUMAKE RULES BELOW HERE

# Explicit dependency needed for generated header file
devvacuumSimVersion$(DEP): $(COMMON_DIR)/$(GENVERSION)

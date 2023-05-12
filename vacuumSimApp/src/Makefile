TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = vacuumSim
# vacuumSim.dbd will be created and installed
DBD += vacuumSim.dbd

# vacuumSim.dbd will be made up from these files:
vacuumSim_DBD += base.dbd

# Include dbd files from all support applications:
#vacuumSim_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#vacuumSim_LIBS += xxx

# vacuumSim_registerRecordDeviceDriver.cpp derives from vacuumSim.dbd
vacuumSim_SRCS += vacuumSim_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
vacuumSim_SRCS_DEFAULT += vacuumSimMain.cpp
vacuumSim_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#vacuumSim_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
vacuumSim_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE


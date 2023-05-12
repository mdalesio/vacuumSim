#!../../bin/linux-x86_64/vacuumSim

#- You may have to change vacuumSim to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/vacuumSim.dbd"
vacuumSim_registerRecordDeviceDriver pdbbase

## Load record instances
dbLoadTemplate "db/pump.substitutions"
dbLoadTemplate "db/valve.substitutions"
dbLoadTemplate "db/gauge.substitutions"
dbLoadRecords "db/vacuumSimVersion.db"
dbLoadRecords "db/turbopump.db"
dbLoadRecords "db/valve.db"
dbLoadRecords "db/gauge.db"

#- Set this to see messages from mySub
#var mySubDebug 1

#- Run this to trace the stages of iocInit
#traceIocInit

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncExample, "user=user"

#!/bin/bash -x

# goes to the script location
cd ~/DEVEL/GITROOT/DashboardScripts/

# whatever
export PATH=/usr/local/git/bin:$PATH
date >> dates.txt

#update scripts
git pull > git.log

#run scripts
ctest -S CoSMo-Singapore-ChickenRice-ITK-i386-Wrapping.cmake   -V > i386-Wrapping.log
#ctest -S CoSMo-Singapore-ChickenRice-ITK-x86_64-Wrapping.cmake -V > x86_64-Wrapping.log
#ctest -S CoSMo-Singapore-ChickenRice-ITK-ppc-Wrapping.cmake    -V > ppc-Wrapping.log

#update crontab for the day after is needed
crontab CoSMo-Singapore-ChickenRice.crontab


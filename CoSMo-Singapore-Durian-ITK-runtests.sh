#!/bin/bash -x

# whatever
source /Users/CoSMoTest-Mac/.profile
export PATH=/usr/local/git/bin:$PATH
date >> dates.txt

# goes to the script location
cd ~/DEVEL/GITROOT/DashboardScripts/

#update scripts
git pull > git.log

#run scripts
ctest -S CoSMo-Singapore-Durian-ITK-i386-Wrapping.cmake   -V > i386-Wrapping.log
ctest -S CoSMo-Singapore-Durian-ITK-x86_64-Wrapping.cmake -V > x86_64-Wrapping.log
ctest -S CoSMo-Singapore-Durian-ITK-ppc-Wrapping.cmake    -V > ppc-Wrapping.log

#update crontab for the day after is needed
crontab CoSMo-Singapore-Durian.crontab


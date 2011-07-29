#!/bin/sh

# Move into the directory that contains the scripts
cd /Users/alexgouaillard/DEVEL/GITROOT/DashboardScripts

# Update the scripts
git pull >& git.log 

# Run the scripts
ctest -S SIgN-Karoshi2-ppc-nightly.cmake    -V >& SIgN-Karoshi2-ppc-nightly.log
ctest -S SIgN-Karoshi2-i386-nightly.cmake   -V >& SIgN-Karoshi2-i386-nightly.log
ctest -S SIgN-Karoshi2-x86_64-nightly.cmake -V >& SIgN-Karoshi2-x86_64-nightly.log

# Update the crontab for next day
crontab SIgN-Karoshi2.crontab


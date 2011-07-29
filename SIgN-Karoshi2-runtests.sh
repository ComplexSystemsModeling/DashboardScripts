#!/bin/sh

# Move into the directory that contains the scripts
cd /Users/alexgouaillard/DEVEL/GITROOT/DashboardScripts

# Update the scripts
git pull >& git.log 

# Run the scripts
ctest -S SIgN-Karoshi2-ppc-nightly.cmake -V >& SIgN-Karoshi2-ppc-nightly.log


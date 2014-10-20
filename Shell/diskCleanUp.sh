#!/bin/bash
###############################################################################
#
# discCleanUp.sh
#
################################################################################
 
DIR_PATH=$1
NUM_OF_DAYS=$2
DIR_SIZE=$3
SIZE=1024
 
DIR_SIZE=$(($DIR_SIZE * $SIZE * $SIZE))
 
# Command to find the File older then NUM_OF_DAYS and removing them from directory DIR_PATH
find $DIR_PATH -mtime +$NUM_OF_DAYS -exec rm {} ;
 
#Go to specified directory
cd $DIR_PATH
 
# Command to get the current directory size.
CURR_DIR_SIZE=`du -sk | cut -f1`
 
while [[ $CURR_DIR_SIZE -gt DIR_SIZE ]];
 
do
 
echo $CURR_DIR_SIZE
 
FILE=`ls -1tra | head -1`
 
rm -rf $FILE
 
# Command to get the current directory size.
CURR_DIR_SIZE=`du -sk | cut -f1`
 
done
 
exit 0
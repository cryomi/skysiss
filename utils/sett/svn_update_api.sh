#!/usr/local/bin/bash

PREFIX=/var/www/api
OWNER=www-data
SVN_ADDR=https://bootabox.unfuddle.com/svn/bootabox_apisvn/
SVN_USERNAME=bootabox
SVN_PASSWORD=boot171819box

echo ============================================
echo Export
echo ============================================
svn export --username $SVN_USERNAME --password $SVN_PASSWORD $SVN_ADDR $PREFIX --force

#echo ============================================
#echo Prepare_Config_Files
#echo ============================================
#for file in $( find $PREFIX -type f -name '*.sample' | sort )
#do
#   echo "Process File: " $file
#   if [ -f ${file//.sample/} ]; then
#     echo "File already exists. Skip..."
##     rm ${file//.sample/}
#   else
#     echo "Copy from sample"
#     cp "$file" ${file//.sample/}
#   fi
#done

echo ============================================
echo Change Owner
echo ============================================
chown -R $OWNER $PREFIX

echo ============================================
echo Change_Mode
echo ============================================
#echo "Skip this action..."
chmod -R 777 $PREFIX/log
echo "Done"
exit


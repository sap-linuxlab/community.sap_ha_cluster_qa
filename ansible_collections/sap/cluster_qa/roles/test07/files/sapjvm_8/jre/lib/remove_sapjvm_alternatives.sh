#!/bin/sh

help_output()
{
    echo "Removes an installed SAPJVM alternative. The syntax is:"
    echo "  remove_sapjvm_alternatives.sh <installation-directory>"
    echo "  "
    echo "Example:"
    echo "  remove_sapjvm_alternatives.sh  /usr/java/<sapjvm_install_dir>"
}

# print help if no arguments are passed and exit
if test $# -lt 1
then
    help_output
    exit 1
fi

SAPJVM_INSTALL_DIRECTORY=$1

if [ -d ${SAPJVM_INSTALL_DIRECTORY} ];
then
  echo "SAPJVM directory ${SAPJVM_INSTALL_DIRECTORY} is present"
else
  echo "SAPJVM directory ${SAPJVM_INSTALL_DIRECTORY} is not present, did you remove it already?"
fi

# check for /usr/sbin/update-alternatives command, on some distros it is not there and we consider
# other command(s)
alternativescmd="/usr/sbin/update-alternatives"

if [ -e ${alternativescmd} ];
then
  echo "${alternativescmd} is present"
else
  alternativescmd="/usr/sbin/alternatives"
  if [ -e ${alternativescmd} ];
  then
    echo "${alternativescmd} is present"
  else
    alternativescmd="update-alternatives"
  fi
fi 
   
echo "Removing alternative for java (${SAPJVM_INSTALL_DIRECTORY}/jre/bin/java)"
   
${alternativescmd} --verbose --remove  java ${SAPJVM_INSTALL_DIRECTORY}/jre/bin/java

echo "Removing alternative for javac (${SAPJVM_INSTALL_DIRECTORY}/bin/javac)"
   
${alternativescmd} --verbose --remove  javac ${SAPJVM_INSTALL_DIRECTORY}/bin/javac
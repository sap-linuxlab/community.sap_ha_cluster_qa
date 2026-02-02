#!/bin/sh

help_output()
{
    echo "Adds an installed SAPJVM as alternative. The syntax is:"
    echo "  add_sapjvm_alternatives.sh <installation-directory>"
    echo "  "
    echo "Example:"
    echo "  add_sapjvm_alternatives.sh  /usr/java/<sapjvm_install_dir>"
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
  echo "SAPJVM directory ${SAPJVM_INSTALL_DIRECTORY} is not present, I exit"
  exit 1
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

# compared to Oracle/OpenJDK8, we do not ship man - pages in the java alternative group, 
# and we do not have slaves javaws, jcontrol and ControlPanel
   
echo "Adding alternative for java"
   
${alternativescmd} --install /usr/bin/java java ${SAPJVM_INSTALL_DIRECTORY}/jre/bin/java 1 \
    --slave /usr/bin/rmid rmid   ${SAPJVM_INSTALL_DIRECTORY}/jre/bin/rmid \
    --slave /usr/bin/unpack200 unpack200  ${SAPJVM_INSTALL_DIRECTORY}/jre/bin/unpack200 \
    --slave /usr/bin/policytool policytool  ${SAPJVM_INSTALL_DIRECTORY}/jre/bin/policytool \
    --slave /usr/bin/orbd orbd ${SAPJVM_INSTALL_DIRECTORY}/jre/bin/orbd \
    --slave /usr/bin/rmiregistry rmiregistry ${SAPJVM_INSTALL_DIRECTORY}/jre/bin/rmiregistry \
    --slave /usr/bin/tnameserv tnameserv ${SAPJVM_INSTALL_DIRECTORY}/jre/bin/tnameserv \
    --slave /usr/bin/pack200 pack200 ${SAPJVM_INSTALL_DIRECTORY}/jre/bin/pack200 \
    --slave /usr/bin/keytool  keytool  ${SAPJVM_INSTALL_DIRECTORY}/jre/bin/keytool \
    --slave /usr/bin/servertool servertool  ${SAPJVM_INSTALL_DIRECTORY}/jre/bin/servertool \
    --slave /usr/bin/jjs jjs  ${SAPJVM_INSTALL_DIRECTORY}/jre/bin/jjs 
   
echo "Installing alternative for javac"

# compared to Oracle/OpenJDK8, we do not ship man - pages in the javac alternative group,
# and we do not have slaves 
# javapackager , javaws , ControlPanel, javafxpackager, jmc, jcontrol, jmc.ini, jvisualvm
 
${alternativescmd} --verbose --install /usr/bin/javac javac ${SAPJVM_INSTALL_DIRECTORY}/bin/javac 1 \
    --slave /usr/bin/javah  javah ${SAPJVM_INSTALL_DIRECTORY}/bin/javah \
    --slave /usr/bin/jrunscript jrunscript ${SAPJVM_INSTALL_DIRECTORY}/bin/jrunscript \
    --slave /usr/bin/jinfo jinfo ${SAPJVM_INSTALL_DIRECTORY}/bin/jinfo \
    --slave /usr/bin/jconsole jconsole ${SAPJVM_INSTALL_DIRECTORY}/bin/jconsole \
    --slave /usr/bin/jhat jhat ${SAPJVM_INSTALL_DIRECTORY}/bin/jhat \
    --slave /usr/bin/jdb jdb ${SAPJVM_INSTALL_DIRECTORY}/bin/jdb \
    --slave /usr/bin/pack200 pack200 ${SAPJVM_INSTALL_DIRECTORY}/bin/pack200 \
    --slave /usr/bin/serialver serialver ${SAPJVM_INSTALL_DIRECTORY}/bin/serialver \
    --slave /usr/bin/javadoc javadoc ${SAPJVM_INSTALL_DIRECTORY}/bin/javadoc \
    --slave /usr/bin/jstat jstat ${SAPJVM_INSTALL_DIRECTORY}/bin/jstat \
    --slave /usr/bin/jcmd jcmd ${SAPJVM_INSTALL_DIRECTORY}/bin/jcmd \
    --slave /usr/bin/rmic rmic ${SAPJVM_INSTALL_DIRECTORY}/bin/rmic \
    --slave /usr/bin/schemagen schemagen ${SAPJVM_INSTALL_DIRECTORY}/bin/schemagen \
    --slave /usr/bin/rmid rmid ${SAPJVM_INSTALL_DIRECTORY}/bin/rmid \
    --slave /usr/bin/unpack200 unpack200 ${SAPJVM_INSTALL_DIRECTORY}/bin/unpack200 \
    --slave /usr/bin/orbd orbd ${SAPJVM_INSTALL_DIRECTORY}/bin/orbd \
    --slave /usr/bin/appletviewer appletviewer ${SAPJVM_INSTALL_DIRECTORY}/bin/appletviewer \
    --slave /usr/bin/jsadebugd jsadebugd ${SAPJVM_INSTALL_DIRECTORY}/bin/jsadebugd \
    --slave /usr/bin/servertool servertool ${SAPJVM_INSTALL_DIRECTORY}/bin/servertool \
    --slave /usr/bin/javap javap ${SAPJVM_INSTALL_DIRECTORY}/bin/javap \
    --slave /usr/bin/idlj idlj ${SAPJVM_INSTALL_DIRECTORY}/bin/idlj \
    --slave /usr/bin/native2ascii native2ascii ${SAPJVM_INSTALL_DIRECTORY}/bin/native2ascii \
    --slave /usr/bin/extcheck extcheck ${SAPJVM_INSTALL_DIRECTORY}/bin/extcheck \
    --slave /usr/bin/policytool policytool ${SAPJVM_INSTALL_DIRECTORY}/bin/policytool \
    --slave /usr/bin/wsimport wsimport ${SAPJVM_INSTALL_DIRECTORY}/bin/wsimport \
    --slave /usr/bin/rmiregistry rmiregistry ${SAPJVM_INSTALL_DIRECTORY}/bin/rmiregistry \
    --slave /usr/bin/tnameserv tnameserv ${SAPJVM_INSTALL_DIRECTORY}/bin/tnameserv \
    --slave /usr/bin/java-rmi.cgi java-rmi.cgi  ${SAPJVM_INSTALL_DIRECTORY}/bin/java-rmi.cgi \
    --slave /usr/bin/jarsigner jarsigner ${SAPJVM_INSTALL_DIRECTORY}/bin/jarsigner \
    --slave /usr/bin/jmap jmap ${SAPJVM_INSTALL_DIRECTORY}/bin/jmap \
    --slave /usr/bin/jps jps ${SAPJVM_INSTALL_DIRECTORY}/bin/jps \
    --slave /usr/bin/wsgen wsgen ${SAPJVM_INSTALL_DIRECTORY}/bin/wsgen \
    --slave /usr/bin/jdeps jdeps ${SAPJVM_INSTALL_DIRECTORY}/bin/jdeps \
    --slave /usr/bin/jstatd jstatd ${SAPJVM_INSTALL_DIRECTORY}/bin/jstatd \
    --slave /usr/bin/xjc xjc ${SAPJVM_INSTALL_DIRECTORY}/bin/xjc \
    --slave /usr/bin/jstack jstack ${SAPJVM_INSTALL_DIRECTORY}/bin/jstack \
    --slave /usr/bin/keytool keytool ${SAPJVM_INSTALL_DIRECTORY}/bin/keytool \
    --slave /usr/bin/jar jar ${SAPJVM_INSTALL_DIRECTORY}/bin/jar \
    --slave /usr/bin/jjs jjs ${SAPJVM_INSTALL_DIRECTORY}/bin/jjs


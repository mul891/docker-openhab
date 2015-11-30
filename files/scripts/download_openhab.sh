#!/bin/bash


if [[ $OPENHAB_VERSION == "SNAPSHOT" ]]
then
  wget --quiet --no-cookies -O /tmp/distribution-runtime.zip https://openhab.ci.cloudbees.com/job/openHAB/lastBuild/artifact/distribution/target/distribution-1.8.0-SNAPSHOT-runtime.zip
  wget --quiet --no-cookies -O /tmp/distribution-addons.zip https://openhab.ci.cloudbees.com/job/openHAB/lastBuild/artifact/distribution/target/distribution-1.8.0-SNAPSHOT-addons.zip
  wget --quiet --no-cookies -O /tmp/demo-openhab.zip https://openhab.ci.cloudbees.com/job/openHAB/lastBuild/artifact/distribution/target/distribution-1.8.0-SNAPSHOT-demo.zip
else
  wget --quiet --no-cookies -O /tmp/distribution-runtime.zip https://bintray.com/artifact/download/openhab/bin/distribution-$OPENHAB_VERSION-runtime.zip 
  wget --quiet --no-cookies -O /tmp/distribution-addons.zip https://bintray.com/artifact/download/openhab/bin/distribution-$OPENHAB_VERSION-addons.zip 
  wget --quiet --no-cookies -O /tmp/demo-openhab.zip https://bintray.com/artifact/download/openhab/bin/distribution-$OPENHAB_VERSION-demo-configuration.zip 
fi

wget --quiet --no-cookies -O /tmp/hyperic-sigar-1.6.4.tar.gz http://downloads.sourceforge.net/project/sigar/sigar/1.6/hyperic-sigar-1.6.4.tar.gz

rm -rf /opt/openhab
mkdir -p /opt/openhab/addons-available
mkdir -p /opt/openhab/logs
mkdir -p /opt/openhab/lib
tar -zxf /tmp/hyperic-sigar-1.6.4.tar.gz --wildcards --strip-components=2 -C /opt/openhab hyperic-sigar-1.6.4/sigar-bin/lib/*
unzip -q -d /opt/openhab /tmp/distribution-runtime.zip
unzip -q -d /opt/openhab/addons-available /tmp/distribution-addons.zip
unzip -q -d /opt/openhab/demo-configuration /tmp/demo-openhab.zip
chmod +x /opt/openhab/start.sh
wget --quiet --no-cookies -O /opt/openhab/addons-available/org.openhab.io.myopenhab-1.7.0.jar https://bintray.com/artifact/download/openhab/mvn/org/openhab/io/org.openhab.io.myopenhab/1.7.0/org.openhab.io.myopenhab-1.7.0.jar
mv /opt/openhab/configurations /etc/openhab
ln -s /etc/openhab /opt/openhab/configurations

rm -f /tmp/distribution-* /tmp/demo-openhab* /tmp/hyperic-sigar-*

# HABMin
wget --quiet --no-cookies -O /tmp/habmin.zip https://github.com/cdjackson/HABmin/releases/download/0.1.3-snapshot/habmin.zip?raw=true

mkdir /opt/openhab/addons-available/habmin
wget --quiet --no-cookies -O /opt/openhab/addons-available/habmin/org.openhab.binding.zwave-1.8.0-SNAPSHOT.jar https://github.com/cdjackson/HABmin/blob/master/addons/org.openhab.binding.zwave-1.8.0-SNAPSHOT.jar?raw=true
wget --quiet --no-cookies -O /opt/openhab/addons-available/habmin/org.openhab.io.habmin-1.7.0-SNAPSHOT.jar https://github.com/cdjackson/HABmin/blob/master/addons/org.openhab.io.habmin-1.7.0-SNAPSHOT.jar?raw=true

unzip -q -d /opt/openhab /tmp/habmin.zip

# HABMin 2
wget --quiet --no-cookies -O /tmp/habmin2.zip https://github.com/cdjackson/HABmin2/releases/download/0.0.15/HABmin2-0.0.15-release.zip?raw=true

mkdir /opt/openhab/addons-available/habmin2
wget --quiet --no-cookies -O /opt/openhab/addons-available/habmin2/org.openhab.ui.habmin_2.0.0.SNAPSHOT-0.0.15.jar https://github.com/cdjackson/HABmin2/releases/download/0.0.15/org.openhab.ui.habmin_2.0.0.SNAPSHOT-0.0.15.jar?raw=true

mkdir /opt/openhab/webapps/habmin2
unzip -q -d /opt/openhab/webapps/habmin2 /tmp/habmin2.zip

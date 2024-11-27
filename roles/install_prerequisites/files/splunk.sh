#!/bin/sh -v

INSTALL_FILE="splunkforwarder-8.0.6-152fb4b2bb96-Linux-x86_64.tgz"

cd /opt
sudo wget https://artifactory-pit.mmodal-npd.com/artifactory/internal-yum-pit/$INSTALL_FILE
sudo tar -xzf $INSTALL_FILE
sudo useradd -m -r splunk
sudo chown -R splunk:splunk /opt/splunkforwarder
cd /opt/splunkforwarder/etc/system/local
sudo -u splunk bash -c 'echo "[user_info]
USERNAME = admin
PASSWORD = changeme" > user-seed.conf'
sudo chown -R splunk:splunk /opt/splunkforwarder
sudo -u splunk /opt/splunkforwarder/bin/splunk start --accept-license --answer-yes --auto-ports --no-prompt
sudo -u splunk /opt/splunkforwarder/bin/splunk set deploy-poll "https://splunkdeployer.3mhis.net:8089" --accept-license --answer-yes --auto-ports --no-prompt -auth admin:changeme
sudo -u splunk /opt/splunkforwarder/bin/splunk edit user admin -password "G?5AXHUlXqxPQISA.1YK" -auth admin:changeme 
sudo -u splunk /opt/splunkforwarder/bin/splunk stop
sudo /usr/bin/setfacl -m g:splunk:rx /var/log/messages
sudo /usr/bin/setfacl -m g:splunk:rx /var/log/secure
sudo /usr/bin/setfacl -m g:splunk:rx /etc/
sudo bash -c 'echo "{
postrotate
        /usr/bin/setfacl -m g:splunk:rx /var/log/messages
        /usr/bin/setfacl -m g:splunk:rx /var/log/secure
        /usr/bin/setfacl -m g:splunk:rx /etc/
    endscript
}" > /etc/logrotate.d/Splunk_ACLs'
sudo /opt/splunkforwarder/bin/splunk enable boot-start -user splunk
sudo sed -i '1 a USER=splunk' /etc/init.d/splunk
sudo systemctl enable splunk
sudo systemctl restart splunk
echo "Done"


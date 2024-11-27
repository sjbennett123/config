#!/bin/sh -v

# Ansible Managed
cd /opt
sudo tar -xzf "/tmp/{{ splunk_installation_filename }}"
sudo useradd -m -r splunk
sudo chown -R splunk:splunk /opt/splunkforwarder
cd /opt/splunkforwarder/etc/system/local
sudo -u splunk bash -c 'echo "[user_info]
USERNAME = admin
PASSWORD = changeme" > user-seed.conf'
# sudo chown -R splunk:splunk /opt/splunkforwarder
sudo -u splunk /opt/splunkforwarder/bin/splunk start --accept-license --answer-yes --auto-ports --no-prompt
sudo -u splunk /opt/splunkforwarder/bin/splunk set deploy-poll "{{ splunk_poll_url }}" --accept-license --answer-yes --auto-ports --no-prompt -auth admin:changeme
sudo -u splunk /opt/splunkforwarder/bin/splunk edit user admin -password "{{ vault_splunk_secret }}" -auth admin:changeme
sudo /usr/bin/setfacl -m g:splunk:rx /var/log/cron
sudo /usr/bin/setfacl -m g:splunk:rx /var/log/maillog
sudo /usr/bin/setfacl -m g:splunk:rx /var/log/messages
sudo /usr/bin/setfacl -m g:splunk:rx /var/log/secure
sudo /usr/bin/setfacl -m g:splunk:rx /var/log/spooler
sudo /usr/bin/setfacl -m g:splunk:rx /etc/
sudo /usr/bin/setfacl -m g:splunk:r /etc*
sudo bash -c 'echo "{
	postrotate
		/usr/bin/setfacl -m g:splunk:rx /var/log/cron
        /usr/bin/setfacl -m g:splunk:rx /var/log/maillog
        /usr/bin/setfacl -m g:splunk:rx /var/log/messages
        /usr/bin/setfacl -m g:splunk:rx /var/log/secure
        /usr/bin/setfacl -m g:splunk:rx /var/log/spooler
        /usr/bin/setfacl -m g:splunk:rx /etc/
        /usr/bin/setfacl -m g:splunk:r /etc*
    endscript
}" > /etc/logrotate.d/Splunk_ACLs'
sudo /opt/splunkforwarder/bin/splunk enable boot-start -user splunk
sudo sed -i '1 a #USER=splunk' /etc/init.d/splunk
sudo -u splunk /opt/splunkforwarder/bin/splunk restart
echo "Done"

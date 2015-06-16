Zabbix-OpenVZ
=============

OpenVZ node monitoring through Zabbix

OpenVZ containers monitoring through Zabbix

Dependencies
============
perl, sudo, zabbix-agent

Installation
============
1. copy vzdiscover.sh to /etc/zabbix/
2. copy zabbix_agentd.d/openvz.conf to /etc/zabbix/zabbix_agentd.d/
3. copy sudoers.d/openvz to /etc/sudoers.d/
4. chmod 440 /etc/sudoers.d/openvz
5. restart zabbix-agent daemon
6. import "zbx_templates/Template OpenVZ CT.xml" and "zbx_templates/Template OpenVZ Node.xml" into your templates
7. apply template "Template OpenVZ Node" to OpenVZ hardware node (otherwise known as host system).
8. enjoy


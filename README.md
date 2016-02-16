# Description
OpenVZ node monitoring through Zabbix.

OpenVZ containers monitoring through Zabbix.

Template "Template OpenVZ Node" finds all containers, creates new hosts and apply template "Template OpenVZ CT" on them.

# Dependencies
perl, sudo, zabbix-agent.

Installation
============
1. copy vzdiscover.pl, ubcfault.sh and vzlist.sh to /etc/zabbix/
2. copy zabbix_agentd.d/openvz.conf to /etc/zabbix/zabbix_agentd.d/
3. copy sudoers.d/zabbix to /etc/sudoers.d/
4. chown root:root /etc/sudoers.d/zabbix ; chmod 440 /etc/sudoers.d/zabbix
5. chmod 755 /etc/zabbix/vzdiscover.pl /etc/zabbix/ubcfault.sh /etc/zabbix/vzlist.sh
6. restart zabbix-agent daemon.
7. import "zbx_templates/Template OpenVZ CT.xml" and "zbx_templates/Template OpenVZ Node.xml" into your templates.
8. apply template "Template OpenVZ Node" to OpenVZ hardware node (otherwise known as host system).
9. enjoy.


You can tune macros (like {$PROC_CT_WARN}) in template Template OpenVZ CT,
 or set macros  to parent host (hardware node), it will be inherited to auto-discovered CT host. This is zabbix restriction.

Install extend check inside CT
============
1. copy ctextcheckdiscover.pl ctextcheck.sh to /etc/zabbix/
2. create directory /etc/zabbix inside CT and copy ctextcheck/ct_check.sh there.
3. edit ct_check.sh to realise custom checks.
4. enable discovery rule "discover container external checks" in CT nodes.
5. enjoy.


PS
===========
If you have problem with import template "Template OpenVZ Node.xml", try use template without discovery rule and add it later manually.
https://github.com/Lelik13a/Zabbix-OpenVZ/issues/2

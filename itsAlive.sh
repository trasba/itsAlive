#!/bin/sh
{ echo $HOSTNAME " is alive" ; date +"%Y.%m.%d-%H:%M:%S" ; echo $(echo "ipv6:") $(cat /var/ddns/ip6address); echo $(echo "ipv4:") $( curl -4 icanhazip.com) ; }| sendxmpp -t tr@ka.densatec.com

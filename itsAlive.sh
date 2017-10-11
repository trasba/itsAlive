#!/bin/sh

file_name="$HOME/.sendxmpprc"
command="sendxmpp"

#check if sendxmpp is installed
if ! which $command > /dev/null; then
   echo -n "$command not found! Install? (y/n): "
   read reply
   if [ "$reply" = "y" ]; then
      sudo apt-get install "$command"
   fi
fi

#check if config file is present
if [ -e "$file_name" ]
#send message
then
    { echo $HOSTNAME " is alive" ; date +"%Y.%m.%d-%H:%M:%S" ; echo $(echo "ipv6:") $(cat /var/ddns/ip6address); echo $(echo "ipv4:") $( curl -4 icanhazip.com) ; }| sendxmpp -t tr@ka.densatec.com
#setup sendxmpprc config file
else
    echo "sendxmpp needs to be setup"
    echo -n "Enter the username and password (e.g. user@server.com pass), followed by [ENTER]: "
    read xmppauth
    echo "#config file created by itsAlive.sh, it was not existing" > "$file_name"
    echo "$xmppauth" > "$file_name"
    echo "configured sendxmpp next, next time we will send data"
fi

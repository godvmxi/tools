#!/bin/bash
HOST="xx.xxx.com"
USER="yourname"
PASS="yourpassword"
CMD=$@
 
VAR=$(expect -c "
spawn /usr/bin/autossh -M 2000 -N -v -D 127.0.0.1:7070 $USER@$HOST $CMD
match_max 100000
expect \"*?assword:*\"
send -- \"$PASS\r\"
send -- \"\r\"
expect eof
")
echo "==============="
echo "$VAR"

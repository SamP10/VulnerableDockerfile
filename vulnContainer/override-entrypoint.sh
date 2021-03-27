#!/bin/sh

if [ -n "$PROFTPD_PUBLICIP" ]; then
    sed -i.bak "s/^\(MasqueradeAddress\).*/MasqueradeAddress $PROFTPD_PUBLICIP/" /etc/proftpd/proftpd.conf
fi

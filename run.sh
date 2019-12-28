#!/bin/bash

if [[ ! -v MAIL_TO ]]; then
    echo "MAIL_TO is not set"
    exit 1
fi

if [[ ! -v SMTP_ROOT ]]; then
    echo "SMTP_ROOT is not set"
    exit 1
fi

if [[ ! -v SMTP_MAIL_HUB ]]; then
    echo "SMTP_MAIL_HUB is not set"
    exit 1
fi

if [[ ! -v SMTP_AUTH_USER ]]; then
    echo "SMTP_AUTH_USER is not set"
    exit 1
fi

if [[ ! -v SMTP_AUTH_PASS ]]; then
    echo "SMTP_AUTH_PASS is not set"
    exit 1
fi


gawk 'match($0,/([^{}]*)({{\s*)(\S+)(\s*}})([^{}]*)/,a) && (a[3] in ENVIRON) { $0 = a[1] ENVIRON[a[3]] a[5] } 1' /etc/smartd.conf.tmpl > /etc/smartd.conf
gawk 'match($0,/([^{}]*)({{\s*)(\S+)(\s*}})([^{}]*)/,a) && (a[3] in ENVIRON) { $0 = a[1] ENVIRON[a[3]] a[5] } 1' /etc/ssmtp/ssmtp.conf.tmpl > /etc/ssmtp/ssmtp.conf

/usr/sbin/smartd --debug
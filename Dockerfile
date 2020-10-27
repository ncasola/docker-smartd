FROM alpine:3.7

RUN apk --update --upgrade add smartmontools ssmtp mailx gettext bash

COPY run.sh /run.sh
RUN chmod +x /run.sh

ADD smartd.conf.tmpl /etc/smartd.conf.tmpl
ADD ssmtp.conf.tmpl /etc/ssmtp/ssmtp.conf.tmpl
ADD revaliases.tmpl /etc/ssmtp/revaliases.tmpl

ENTRYPOINT /run.sh

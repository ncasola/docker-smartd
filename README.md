# docker-smartd


S.M.A.R.T mail alerts with Docker

Forked to work with x86 and added revaliases.

## Usage

Docker compose

```yaml
  smartd:
    image: rugarci/smartd
    environment:
      - MAIL_TO=yyyyyyy@gmail.com
      - FROM=xxxxxx@gmail.com
      - SMTP_ROOT=xxxxxx@gmail.com
      - SMTP_HOSTNAME=smartd
      - SMTP_MAIL_HUB=smtp.gmail.com:587
      - SMTP_AUTH_USER=xxxxxxx@gmail.com
      - SMTP_AUTH_PASS=xxxxxxxx
      - SMARTD_OPTIONS=-d scsi
    privileged: true
```

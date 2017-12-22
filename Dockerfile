FROM ubuntu:16.04
MAINTAINER shurrik

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y pptpd iptables

COPY pptpd-options /etc/ppp/pptpd-options
COPY chap-secrets /etc/ppp/chap-secrets
COPY pptpd.conf /etc/pptpd.conf

COPY entrypoint.sh /entrypoint.sh
RUN chmod 0700 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["pptpd", "--fg"]

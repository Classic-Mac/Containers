# Using Debian as a base
FROM debian:stable-slim


RUN apt-get update && apt-get install -y stunnel openssl locales \
&& rm -rf /var/lib/apt/lists/* \
&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 

ENV LANG=en_US.utf8

EXPOSE 25 143 110 993 995 587 4025 4143 4110 5025 5143 5110 6025 6143 6110
COPY stunnel.conf /etc/stunnel/stunnel.conf
COPY run-stunnel.sh /usr/local/bin/run-stunnel.sh
COPY stunnel.pem /etc/stunnel/stunnel.pem
COPY stunnel.pem /etc/ssl/certs/stunnel.pem
RUN chmod +x /usr/local/bin/run-stunnel.sh

ENTRYPOINT [ "/bin/bash","/usr/local/bin/run-stunnel.sh" ]
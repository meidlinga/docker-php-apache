#FROM webdevops/php-nginx:7.3
FROM webdevops/php-apache:7.3
#COPY . /app

ENV SSH_PASSWD "root:Docker!"
RUN apt-get update \
        && apt-get install -y --no-install-recommends dialog \
        && apt-get update \
	&& apt-get install -y --no-install-recommends openssh-server \
	&& echo "$SSH_PASSWD" | chpasswd
COPY docker/sshd_config /etc/ssh/

COPY docker/ep.sh /opt/docker/provision/entrypoint.d/

RUN mkdir -p /app/public
COPY stub/index.php /app/public

ENV WEB_DOCUMENT_ROOT=/app/public

#RUN composer1 install -d /app
#RUN ls /app

EXPOSE 8000 2222


FROM alpine:3.19.1

RUN apk update
RUN apk --no-cache add mysql mysql-client

RUN mkdir -p /run/mysqld

COPY conf/my.cnf /etc/my.cnf
COPY tools/init_db.sh /init_db.sh
RUN chmod +x /init_db.sh

EXPOSE 3306
CMD ["/init_db.sh"]

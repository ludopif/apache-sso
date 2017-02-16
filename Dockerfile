######################################################################
#
#

FROM apache:2.4.25

MAINTAINER Laurent Bodhuin <laurent.bodhuin@orange.com>

######################################################################
#USER root

#RUN echo "on commence"; cp /opt/apache/2.4.25/httpdwt_initd /etc/init.d/httpdwt_com && \
#    sed -i s/httpdwt_mco/httpdwt_com/g /etc/init.d/httpdwt_com && \
#    cp /opt/apache/2.4.25/httpdwt_sysconfig /etc/sysconfig/httpdwt_com && \
#    sed -i s/httpdwt_mco/wt_com/g /etc/sysconfig/httpdwt_com && \
#
#    echo "on est au milieu"; mkdir -p /var/opt/data/flat/wt_com

#ENV LANG en_US.UTF-8
#ENV LC_ALL en_US.UTF-8

EXPOSE 8080

#permet de recuperer les Volumes dans un Autre docker (-volume-from xxx)
#VOLUME /exec/applis/usso/com/current/logs/

#COPY wtcom-tb2.properties /opt/application/wt_com/
#RUN chmod 755 /opt/application/wt_com/wtcom-tb2.properties
RUN chgrp -R 0 /opt/apache/2.4.25/bin
RUN chmod -R g+rw /opt/apache/2.4.25/bin
RUN find /opt/apache/2.4.25/bin -type d -exec chmod g+x {} +
#RUN echo "ServerName localhost" >>/opt/apache/2.4.25/conf/httpd.conf

# forward request and error logs to docker log collector
#RUN ln -sf /dev/stdout /opt/apache/2.4.25/logs/access.log && ln -sf /dev/stderr /opt/apache/2.4.25/logs/error.log

#USER ussouser
#USER 1001

#COPY  startup.sh /
#RUN   /opt/apache/2.4.25/bin/httpd -D FOREGROUND &
#ENTRYPOINT ["/bin/bash"]
#ENTRYPOINT ["/opt/apache/2.4.25/bin/httpd -D FOREGROUND"]
CMD ["/opt/apache/2.4.25/bin/httpd","-D FOREGROUND"]
#CMD ["/bin/sh"]

###
# Automated Build for dklein/apacheds Image
# Version 1.0-SNAPSHOT
# (c) 2016 Dennis Klein
#
FROM dklein/java

MAINTAINER Dennis Klein <dennis.klein@gmx.com>

# download and install ApacheDS
RUN mkdir -p /custom/packages/apacheds
ENV APACHEDS_VERSION=2.0.0-M23
RUN cd /custom/packages/apacheds && \
  curl -L http://artfiles.org/apache.org/directory/apacheds/dist/$APACHEDS_VERSION/apacheds-$APACHEDS_VERSION.tar.gz | \
  tar zx --strip-components 1

# create apacheds user
RUN adduser --system --home /custom/syshome/apacheds --disabled-login apacheds && \
  chown -R apacheds:nogroup /custom/packages/apacheds

# copy entrypoint script
ADD entrypoint.sh /custom/

# Expose the ports we're intrested in
EXPOSE 10389 10636 60088 60464

USER apacheds

CMD ["/custom/entrypoint.sh"]

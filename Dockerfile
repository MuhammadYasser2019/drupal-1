FROM registry.access.redhat.com/ubi8/php-73
# Add application sources to a directory that the assemble script expects them
# and set permissions so that the container runs without root access

RUN mkdir -p /tmp/src/
COPY . /tmp/src/

## fix permissions ##
USER 0
RUN chown -R 1001:0 /tmp/src/
USER 1001

# Install the dependencies
RUN /usr/libexec/s2i/assemble

### create /data for sites initial values
RUN mkdir /opt/app-root/data

# Set the default command for the resulting image
CMD /usr/libexec/s2i/run

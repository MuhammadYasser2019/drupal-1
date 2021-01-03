FROM registry.access.redhat.com/ubi8/php-73

# Add application sources to a directory that the assemble script expects them
# and set permissions so that the container runs without root access
# USER 0
USER 1001
ADD . /tmp/src
RUN ls -la /tmp/src
# RUN chown -R 1001:0 /tmp/src
# RUN id
# Install the dependencies
RUN /usr/libexec/s2i/assemble

# Set the default command for the resulting image
CMD /usr/libexec/s2i/run
RUN mkdir /opt/app-root/data

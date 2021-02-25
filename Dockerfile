FROM registry.access.redhat.com/ubi8/php-73
# Add application sources to a directory that the assemble script expects them
# and set permissions so that the container runs without root access

RUN mkdir -p /tmp/src/
COPY . /tmp/src/
# RUN mv /tmp/src/* /tmp/src/.htaccess \ 
#     /tmp/src/.csslintrc /tmp/src/.editorconfig \ 
#     /tmp/src/.eslintignore /tmp/src/.eslintrc.json \
#     /tmp/src/.gitattributes /tmp/src/.ht.router.php /tmp/src

# Install the dependencies
RUN /usr/libexec/s2i/assemble

### create /data for sites initial values
RUN mkdir /opt/app-root/data

# Set the default command for the resulting image
CMD /usr/libexec/s2i/run

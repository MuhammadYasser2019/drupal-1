FROM registry.access.redhat.com/ubi8/php-73
# Add application sources to a directory that the assemble script expects them
# and set permissions so that the container runs without root access

RUN mkdir -p /tmp/src/drupal
COPY . /tmp/src/drupal
RUN mv /tmp/src/drupal/* /tmp/src/drupal/.htaccess \ 
    /tmp/src/drupal/.csslintrc /tmp/src/drupal/.editorconfig \ 
    /tmp/src/drupal/.eslintignore /tmp/src/drupal/.eslintrc.json \
    /tmp/src/drupal/.gitattributes /tmp/src/drupal/.ht.router.php /tmp/src

# Install the dependencies
RUN /usr/libexec/s2i/

### create /data for sites initial values
RUN mkdir /opt/app-root/data

# Set the default command for the resulting image
CMD /usr/libexec/s2i/run

FROM image-registry.openshift-image-registry.svc:5000/drupal-5/php-73:latest-ashraf
# Add application sources to a directory that the assemble script expects them
# and set permissions so that the container runs without root access
# USER 0
# USER 1001
# ADD . /tmp/src
# RUN chown -R 1001:0 /tmp/src


RUN mkdir /tmp/src
RUN git clone https://github.com/MuhammadYasser2019/drupal-1.git /tmp/src/drupal
RUN mv /tmp/src/drupal/* /tmp/src/drupal/.htaccess /tmp/src/drupal/.csslintrc /tmp/src/drupal/.editorconfig /tmp/src/drupal/.eslintignore /tmp/src/drupal/.eslintrc.json /tmp/src/drupal/.gitattributes /tmp/src/drupal/.ht.router.php /tmp/src
# Install the dependencies
RUN /usr/libexec/s2i/assemble

# Set the default command for the resulting image
CMD /usr/libexec/s2i/run
RUN mkdir /opt/app-root/data

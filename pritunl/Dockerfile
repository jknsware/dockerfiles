FROM centos:7.4.1708
LABEL \
  image_name=jknsware/pritunl \
  description="Pritunl with MongoDB" \
  maintainer="jason@jknsware.com" \
  dockerfile_location=https://github.com/jknsware/docker-pritunl/Dockerfile \
  base_image=centos:7.4.1708`

# Upgrade CentOS to latest

RUN yum upgrade -y && \
  yum install epel-release -y

# Copy in the rquired repo files

COPY repos/ /

# Install pritunl, mongodb, and run cleanup

RUN gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys 7568D9BB55FF9E5287D586017AE645C0CF8E292A && \
  gpg --armor --export 7568D9BB55FF9E5287D586017AE645C0CF8E292A > key.tmp; rpm --import key.tmp; rm -f key.tmp && \
  yum -y install pritunl mongodb-org && \
  yum clean all

# Copy in the conf files

COPY conf/ /

# Enable execution on the ENTRYPOINT script

RUN chmod +x /usr/local/bin/pritunl-start.sh

# Expose required ports

EXPOSE 1194/udp 1194/tcp 443/tcp 80/tcp

# Set the ENTRYPOINT and CMD

ENTRYPOINT ["/usr/local/bin/pritunl-start.sh"]

CMD ["/usr/bin/tail", "-f", "/var/log/pritunl.log"]
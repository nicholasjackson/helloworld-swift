FROM ibmcom/kitura-ubuntu:latest

EXPOSE 8090

# Create directory for server files
RUN mkdir /helloworld-swift

# Install supervisor and consul-template
RUN apt-get update
RUN echo y| apt-get install wget tar supervisor
RUN wget https://github.com/hashicorp/consul-template/releases/download/v0.10.0/consul-template_0.10.0_linux_386.tar.gz
RUN tar -xvzf consul-template_0.10.0_linux_386.tar.gz
RUN mv consul-template_0.10.0_linux_386/consul-template /bin/consul-template

# Configure consul-template supervisor and nginx
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY config.ctmpl /helloworld-swift/config.ctmpl

# Copy binary
COPY HelloWorld /helloworld-swift/HelloWorld

CMD ["/usr/bin/supervisord", "-c","/etc/supervisor/conf.d/supervisord.conf"]

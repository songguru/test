# Base image
FROM centos:8

# Set the maintainer
LABEL maintainer="your-email@example.com"

# Update and install required tools
RUN dnf update -y && \
    dnf install -y dnf-plugins-core curl && \
    dnf clean all

# Import Elasticsearch GPG key and add Elastic repository
RUN rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch && \
    echo "[elastic-8.x]" > /etc/yum.repos.d/elastic.repo && \
    echo "name=Elastic repository for 8.x packages" >> /etc/yum.repos.d/elastic.repo && \
    echo "baseurl=https://artifacts.elastic.co/packages/8.x/yum" >> /etc/yum.repos.d/elastic.repo && \
    echo "gpgcheck=1" >> /etc/yum.repos.d/elastic.repo && \
    echo "gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch" >> /etc/yum.repos.d/elastic.repo && \
    echo "enabled=1" >> /etc/yum.repos.d/elastic.repo && \
    echo "autorefresh=1" >> /etc/yum.repos.d/elastic.repo && \
    echo "type=rpm-md" >> /etc/yum.repos.d/elastic.repo

# Install Kibana
RUN dnf install -y kibana && \
    dnf clean all

# Enable and start Kibana as part of container startup
CMD ["bash", "-c", "systemctl enable kibana && systemctl start kibana && tail -f /dev/null"]


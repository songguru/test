# Base image
FROM ubuntu:20.04

# Set the maintainer
LABEL maintainer="your-email@example.com"

# Disable interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update and install required tools
RUN apt-get update && \
    apt-get install -y curl gnupg2 apt-transport-https && \
    apt-get clean

# Import Elasticsearch GPG key and add Elastic repository
RUN curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add - && \
    echo "deb https://artifacts.elastic.co/packages/8.x/apt stable main" > /etc/apt/sources.list.d/elastic-8.x.list

# Update and install Kibana
RUN apt-get update && \
    apt-get install -y kibana && \
    apt-get clean

# Expose Kibana's default port
EXPOSE 5601

# Start Kibana
CMD ["/usr/share/kibana/bin/kibana"]


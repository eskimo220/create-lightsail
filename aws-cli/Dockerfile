# AWS CLI2 を利用するDockerfile
FROM amazonlinux:2

WORKDIR /tmp
RUN yum install -y unzip less && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install
WORKDIR /root
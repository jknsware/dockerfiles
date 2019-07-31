FROM ubuntu:18.04

LABEL image_name=jknsware/grunt \
  description="Container with Terragrunt/form" \
  maintainer="jason@jknsware.com" \
  dockerfile_location=https://github.com/jknsware/dockerfiles/terragrunt \
  base_image=ubuntu:18.04

# Set environment variables

ENV TERRAFORM_VERSION 0.11.13
ENV TERRAGRUNT_VERSION v0.18.3
ENV MYSQL_VERSION 5.7.27

# Copy bash files

COPY docker/ /

# Update Ubuntu and install required packages
RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    bash-completion \
    mysql-server=${MYSQL_VERSION}* \
    openssh-client \
    ca-certificates \
    jq \
    wget \
    unzip \
    vim \
    git \
    tree \
    less \
    tzdata \
    python3 \
    python3-pip \
    python3-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Set time
RUN  echo America/Chicago > /etc/timezone \
  && ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime \
  && dpkg-reconfigure -f noninteractive tzdata

# Install AWSCLI
RUN pip3 install wheel \
    && pip3 install --upgrade setuptools \
    && pip3 install awscli --upgrade --user

# Install Terraform and Terragrunt

RUN mkdir -p /ci/terraform_${TERRAFORM_VERSION} \
    && wget -nv -O /ci/terraform_${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip -o /ci/terraform_${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin/ \
    && mkdir -p /ci/terragrunt-${TERRAGRUNT_VERSION}/ \
    && wget -nv -O /ci/terragrunt-${TERRAGRUNT_VERSION}/terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 \
    && chmod u+x /ci/terragrunt-${TERRAGRUNT_VERSION}/terragrunt \
    && cp /ci/terragrunt-${TERRAGRUNT_VERSION}/terragrunt /usr/local/bin \
    && rm -rf /ci

CMD ["/bin/bash"]

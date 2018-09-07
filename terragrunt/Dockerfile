FROM ubuntu:16.04

LABEL image_name=jknsware/docker-grunt \
  description="Container with Terragrunt/form" \
  maintainer="jason@jknsware.com" \
  dockerfile_location=https://github.com/jknsware/docker-terragrunt/Dockerfile \
  base_image=ubuntu:16.04

# Set environment variables

ENV TERRAFORM_VERSION 0.11.1
ENV TERRAGRUNT_VERSION v0.13.23

# Copy bash files

COPY docker/ /

# Upgrade Ubuntu and install required packages

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    openssh-client \
    ca-certificates \
    wget \
    unzip \
    vim \
    git \
    tree \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Terraform

RUN mkdir -p /ci/terraform_${TERRAFORM_VERSION} \
    && wget -nv -O /ci/terraform_${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip -o /ci/terraform_${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin/

# Install Terragrunt

RUN mkdir -p /ci/terragrunt-${TERRAGRUNT_VERSION}/ \
    && wget -nv -O /ci/terragrunt-${TERRAGRUNT_VERSION}/terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 \
    && chmod u+x /ci/terragrunt-${TERRAGRUNT_VERSION}/terragrunt \
    && cp /ci/terragrunt-${TERRAGRUNT_VERSION}/terragrunt /usr/local/bin \
    && rm -rf /ci

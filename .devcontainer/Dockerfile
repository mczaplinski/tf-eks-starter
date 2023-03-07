FROM mcr.microsoft.com/devcontainers/base:bullseye

RUN apt-get update && \
    apt-get install -y python

ARG TERRAFORM_VERSION=1.3.9
ARG TFLINT_VERSION=0.45.0
ARG TERRAGRUNT_VERSION=0.44.4

RUN curl -sSL https://get.docker.com/ | sh

RUN curl -sSL "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    sudo ./aws/install

RUN curl -sSL "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" -o "tf.zip" && \
    unzip tf.zip && \
    mv terraform /usr/local/bin/

RUN curl -sSL "https://github.com/terraform-linters/tflint/releases/download/v${TFLINT_VERSION}/tflint_linux_amd64.zip" -o "tflint.zip" && \
    unzip tflint.zip && \
    mv -f tflint /usr/local/bin/

RUN curl -sSL "https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_amd64" -o "terragrunt" && \
    chmod a+x terragrunt && \
    mv -f terragrunt /usr/local/bin/terragrunt

ENTRYPOINT [ "/usr/local/share/docker-init.sh" ]
CMD [ "sleep", "infinity" ]
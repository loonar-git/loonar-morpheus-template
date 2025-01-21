FROM ubuntu:22.04

# Instalar dependências
RUN apt-get update && apt-get install -y \
    curl \
    sudo \
    shellcheck \
    golang-go \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Instalar Terraform
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - \
    && sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
    && sudo apt-get update && sudo apt-get install -y terraform

# Instalar tfsec
RUN go install github.com/aquasecurity/tfsec/cmd/tfsec@latest

# Instalar trufflehog
RUN pip install truffleHog

# Adicionar tfsec ao PATH
ENV PATH="/root/go/bin:${PATH}"

# Definir diretório de trabalho
WORKDIR /workspace

# Comando padrão
CMD ["bash"]
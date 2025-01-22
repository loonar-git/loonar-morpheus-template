FROM ubuntu:22.04

ENV PATH="/usr/local/go/bin:/root/go/bin:${PATH}"

RUN apt-get update && apt-get install -y \
    apt-utils \
    curl \
    gnupg \
    software-properties-common \
    lsb-release \
    python3-pip \
    shellcheck && \
    curl -fsSL https://golang.org/dl/go1.21.1.linux-amd64.tar.gz | tar -C /usr/local -xz && \
    curl -fsSL https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list && \
    apt-get update && \
    apt-get install -y terraform && \
    go install github.com/aquasecurity/tfsec/cmd/tfsec@latest && \
    pip install truffleHog

WORKDIR /workspace

CMD ["bash"]
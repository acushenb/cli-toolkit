# Use debian:bookworm-slim as the base image
FROM debian:bookworm-slim

# Set version arguments
ARG PARTNER_CHAINS_VERSION=1.0.0
ARG CARDANO_VERSION=9.1.0

# Install necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    bash \
    vim \
    netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*

# Install partner-chains tools
RUN curl -L https://github.com/input-output-hk/partner-chains/releases/download/v${PARTNER_CHAINS_VERSION}/linux_x86_64.zip -o cli_tools.zip && \
    unzip cli_tools.zip -d /usr/local/bin/ && \
    rm cli_tools.zip

# Install Cardano CLI tools
RUN curl -L https://github.com/IntersectMBO/cardano-node/releases/download/${CARDANO_VERSION}/cardano-node-${CARDANO_VERSION}-linux.tar.gz -o cardano-node.tar.gz && \
    tar -xzf cardano-node.tar.gz -C /usr/local/ --strip-components=1 && \
    rm cardano-node.tar.gz

# Make binaries executable
RUN chmod +x /usr/local/bin/partner-chains-cli /usr/local/bin/partner-chains-node /usr/local/bin/sidechain-main-cli /usr/local/bin/cardano-cli

#Scripts WIP
Add the gen-all-keys.sh script
COPY gen-all-keys.sh /usr/local/bin/gen-all-keys.sh
RUN chmod +x /usr/local/bin/gen-all-keys.sh

# Add gen-addresses.sh script
COPY gen-addresses.sh /usr/local/bin/gen-addresses.sh
RUN chmod +x /usr/local/bin/gen-addresses.sh

# Keep the container running
CMD ["/bin/bash", "-c", "trap : TERM INT; sleep infinity & wait"]

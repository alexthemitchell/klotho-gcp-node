FROM gcr.io/cloud-builders/docker

# Install gcloud CLI
RUN bash -cx 'curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-391.0.0-linux-x86_64.tar.gz && tar -xf google-cloud-cli-391.0.0-linux-x86_64.tar.gz'

ENV PATH="${PATH}:${pwd}/google-cloud-sdk/bin"

# Install Node
RUN bash -cx 'curl -fsSL https://deb.nodesource.com/setup_17.x | bash - && apt-get install -y nodejs'

# Install Klotho/Pulumi
RUN bash -cx 'curl -fsSL https://api.cloudcompiler.run/v1/cli/install.sh | bash -s -- --allow-sudo --installdir /usr/bin' 

# Add Pulumi executable to path
ENV PATH="/root/.pulumi/bin:${PATH}"

ENTRYPOINT bash